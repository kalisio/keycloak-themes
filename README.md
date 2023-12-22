# keycloak-themes

Kalisio's [Keycloak themes](https://www.keycloak.org/docs/latest/server_development/#_themes)

This project brings together a set of Keycloak themes used by Kalisio applications.
Just like the applications developed by Kalisio, these themes are based on the use of the [Quasar Framework](https://quasar.dev/)
This allows to have the same look & feel between the applications and the different user interfaces provided by Keycloak.

> [!Note]
>Before going any further, it is essential to understand how themes work in Keycloak and how one can create a theme. Please refer to the [official documentation](https://www.keycloak.org/docs/latest/server_development/index.html#_themes).
> You can also read the following articles:
>* [https://trigodev.com/blog/how-to-customize-keycloak-themes](https://trigodev.com/blog/how-to-customize-keycloak-themes)


## Understanding the kore theme

The [kore](./themes/kore) extends the Keycloak's **base** them with the following types of customization:
* login

_TODO_

 

## Extending the kore theme

### Minimum file stucture

The minimum file structure you need to create is:
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

#### config.js

The `config.js` file allows configuring **Quasar**. It defines a [Quasar Config Object](https://quasar.dev/start/umd/#quasar-config-object). 

> [!TIP]
> Use the Quasar Config Object to define the brand colors to be used in the application.

#### logo.png

This file represents the application logo. 

> [!TIP]
> The recommend size is about 400 x 150 pixels.

### Checking the theme

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

#



