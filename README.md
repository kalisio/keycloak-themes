# keycloak-theme-sandbox

A sandobx to play with [Keycloak themes](https://www.keycloak.org/docs/latest/server_development/#_themes)

## Managing the stack

### Deploying the stack

```bash
export POSTGRES_DATA_PATH=/home/$USER/Volumes/postgres
env UID=${UID} GID=${GID} docker compose -f keycloak-postgres.yml up -d
```

### Removing the stack

```bash
docker compose -f keycloak-postgres.yml down
```

## Using Keycloak

### Login to keycloak master realm

1. Go to http://localhost:8080/
2. Click `Administration Console`
3. Login using the following credentials:
  
  - User: admin
  - Password: Pass;word1

### Login to the apps

### kdk

Go to: http://localhost:8080/realms/kdk/account/#/

### kapp

Go to: http://localhost:8080/realms/kapp/account/#/

### opal

Go to: http://localhost:8080/realms/opal/account/#/

## Useful links

https://www.keycloak.org/docs/latest/server_development/index.html#_themes
https://trigodev.com/blog/how-to-customize-keycloak-themes