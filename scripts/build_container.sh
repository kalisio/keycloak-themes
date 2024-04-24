#!/usr/bin/env bash
set -euo pipefail
# set -x

THIS_FILE=$(readlink -f "${BASH_SOURCE[0]}")
THIS_DIR=$(dirname "$THIS_FILE")
ROOT_DIR=$(dirname "$THIS_DIR")

. "$THIS_DIR/kash/kash.sh"

## Parse options
##

PUBLISH=false
CI_STEP_NAME="Build"
while getopts "pr:" option; do
    case $option in
        p) # publish app
            PUBLISH=true
            ;;
        r) # report outcome to slack
            CI_STEP_NAME=$OPTARG
            trap 'slack_ci_report "$ROOT_DIR" "$CI_STEP_NAME" "$?" "$SLACK_WEBHOOK_SERVICES"' EXIT
            ;;
        *)
            ;;
    esac
done

## Init workspace
##

WORKSPACE_DIR="$(dirname "$ROOT_DIR")"
GIT_TAG=GIT_TAG=$(get_git_tag "$REPO_ROOT")

load_env_files "$WORKSPACE_DIR/development/common/kalisio_dockerhub.enc.env" "$WORKSPACE_DIR/development/common/SLACK_WEBHOOK_SERVICES.enc.env"
load_value_files "$WORKSPACE_DIR/development/common/KALISIO_DOCKERHUB_PASSWORD.enc.value"

## Build container
##

IMAGE_NAME="kalisio/keycloak-themes"
if [[ -z "$GIT_TAG" ]]; then
    IMAGE_TAG=latest
else
    IMAGE_TAG=$GIT_TAG
fi

begin_group "Building container ${IMAGE_NAME}:${IMAGE_TAG}"

pwd

docker login --username "$KALISIO_DOCKERHUB_USERNAME" --password-stdin < "$KALISIO_DOCKERHUB_PASSWORD"
# DOCKER_BUILDKIT is here to be able to use Dockerfile specific dockerginore (app.Dockerfile.dockerignore)
DOCKER_BUILDKIT=1 docker build \
    -f Dockerfile \
    -t "$IMAGE_NAME:$IMAGE_TAG" \
    "$WORKSPACE_DIR"

if [ "$PUBLISH" = true ]; then
    docker push "$IMAGE_NAME:$IMAGE_TAG"
fi

docker logout

end_group "Building container ..."
