# keycloak-themes

Kalisio's [Keycloak themes](https://www.keycloak.org/docs/latest/server_development/#_themes)

This project brings together a set of Keycloak themes used by Kalisio applications.
Just like the applications developed by Kalisio, these themes are based on the use of the [Quasar Framework](https://quasar.dev/)
This allows to have the same look & feel between the applications and the different user interfaces provided by Keycloak.

> [!Note]
>Before going any further, it is essential to understand how themes work in Keycloak and how one can create a theme. Please refer to the [official documentation](https://www.keycloak.org/docs/latest/server_development/index.html#_themes).
> You can also read the following articles:
>* [https://trigodev.com/blog/how-to-customize-keycloak-themes](https://trigodev.com/blog/how-to-customize-keycloak-themes)


## Understanding the KDK core theme

The [KDK](./themes/kdk) extends the Keycloak's **base** them with the following types of customization:
* login
 

## Extending the KDK theme

### Minimum file stucture

The minimum file structure you need to create is the following:
```
my-theme
 ├ login
 |   └─ resources
 |      ├─ js
 |      |   └─ config.js
 |      └─ img
 |          └─ logo.png
 └─ theme.properties
```

#### theme.properties

The [theme.properties](https://www.keycloak.org/docs/latest/server_development/index.html#theme-properties) file allows setting some configuration for the theme.

A **theme.properties** file commonly has content like this

```
parent=kdk 
import=common/keycloak
locales=fr,en
meta=viewport==width=device-width,initial-scale=1
```

#### config.js

The `config.js` file allows you to configurr **Quasar** by defining a [Quasar Config Object](https://quasar.dev/start/umd/#quasar-config-object). 

> [!TIP]
> Use the Quasar Config Object to define the brand colors to be used in the application.

#### logo.png

This file represents the application logo. 

> [!TIP]
> The recommended size is about 400x150 pixels.

## Checking the theme

To check the theme, we recomend to:

1. create a realm for your application
2. In `Realm Settings`, `Themes` tab, assign the app's theme to the `Login theme`
3. Log in to the app: `https://<keycloak.url>/realms/<app>/account/#/`

> [!NOTE]  
> In local, the url for the `kapp` example will be the following: http://localhost:8080/realms/kapp/account/#/

## Running Keycloak

We provide a generic [Docker compose](https://docs.docker.com/compose/) file to let you run **Keycloak** locally and check your theme.

### Deploying the stack

The **Docker compose** file requires you to define the `POSTGRES_DATA_PATH` which allow to persist the **PostgreSQL** database, such as shown below:

```bash
 export POSTGRES_DATA_PATH=/home/$USER/Volumes/postgres
```

Then you are able to run the stack by typing the following command:

```bash
env UID=${UID} GID=${GID} docker compose -f keycloak-postgres.yml up -d
```

You can now log in to **Keycloak**:
1. Go to http://localhost:8080/
2. Click `Administration Console`
3. Login using the following credentials:
  
  - User: admin
  - Password: Pass;word1

### Removing the stack

To remove the stack, simply type the following command:

```bash
docker compose -f keycloak-postgres.yml down
```








