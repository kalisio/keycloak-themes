<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html <#if realm.internationalizationEnabled>lang="${locale.currentLanguageTag}"</#if>>

<head>
  <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons" rel="stylesheet" type="text/css">
  <link href= "https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" rel= "stylesheet" type="text/css">
  <link href="https://cdn.jsdelivr.net/npm/quasar@2.14.1/dist/quasar.prod.css" rel="stylesheet" type="text/css">
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="robots" content="noindex, nofollow">

  <#if properties.meta?has_content>
    <#list properties.meta?split(' ') as meta>
      <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
    </#list>
  </#if>
  <title>${msg("loginTitle",(realm.displayName!''))}</title>
  <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
  <#if properties.stylesCommon?has_content>
    <#list properties.stylesCommon?split(' ') as style>
      <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
    </#list>
  </#if>
  <#if properties.styles?has_content>
    <#list properties.styles?split(' ') as style>
      <link href="${url.resourcesPath}/css/${style}" rel="stylesheet" />
    </#list>
  </#if>
  <#if properties.scripts?has_content>
    <#list properties.scripts?split(' ') as script>
      <script src="${url.resourcesPath}/js/${script}" type="text/javascript"></script>
    </#list>
  </#if>
  <#if properties.version?has_content>
    <script>
      const themeVersion = '${properties.version}'
    </script>
  <#else>
    <script>
      const themeVersion = undefined
    </script>
  </#if>
  <#if properties.kdkVersion?has_content>
    <script>
      const kdkVersion = '${properties.kdkVersion}'
    </script>
  <#else>
    <script>
      const kdkVersion = undefined
    </script>      
  </#if>
</head>

<body>
  <div id="q-app">
    <div class="window-height window-width row justify-center bg-grey-4">
      <!-- 
        Header 
      -->
      <div class="full-width row justify-center">
        <#include "fragments/header.ftl">
      </div>
      <!-- 
        Content 
      -->
      <div class="row justify-center" style="width: 600px; max-width: 95vw;"> 
        <q-card class="full-width bg-white column justify-center">
          <!-- banner -->
          <div>
            <#include "fragments/banner.ftl">
          </div>
          <!-- form -->
          <div :class="{ 'q-pt-md q-pr-md q-pl-md': $q.screen.xs, 'q-pt-lg q-pr-lg q-pl-lg': $q.screen.gt.xs }"> 
            <#nested "form">
          </div>
          <!-- social providers -->
          <#nested "socialProviders">
        </q-card>
        <!-- global options -->
        <div :class="{ 'q-pt-xs': $q.screen.xs, 'q-pt-sm': $q.screen.gt.xs }">
          <#include "fragments/options.ftl">
        </div>
      </div>
      <!-- 
        Footer 
      -->
      <div class="full-width row justify-center">
        <#include "fragments/footer.ftl">
      </div>
    </div>
  </div>
  <!--
    Retrieve Keycloak environement
  -->
  <script id="environment" type="application/json">
    {
      "realm": {
        "resourcesPath": "${url.resourcesPath}",
        "i18n": {
          "enabled": <#if realm.internationalizationEnabled>true<#else>false</#if>,
          "locale": <#if realm.internationalizationEnabled>"${locale.currentLanguageTag}"<#else>null</#if>
        },
        "rememberMe": <#if realm.rememberMe>true<#else>false</#if>
      },
      "user": {
        "username": <#if user??>"${(user.username!'')}"<#else>""</#if>,
        "email": <#if user??>"${(user.email!'')}"<#else>""</#if>,
        "firstName": <#if user??>"${(user.firstName!'')}"<#else>""</#if>,
        "lastName": <#if user??>"${(user.lastName!'')}"<#else>""</#if>
      }
    }
  </script>
  <!-- 
    Use Vue and Quasar with UMD version
    For more information, refer to https://quasar.dev/start/umd#installation
  -->
  <script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.prod.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/quasar@2.14.1/dist/quasar.umd.prod.js"></script>
  <!-- Install Quasar language pack -->
  <#if realm.internationalizationEnabled>
    <#if properties.locales?has_content>
      <#list properties.locales?split(',') as locale>
        <script src="https://cdn.jsdelivr.net/npm/quasar@2.14.1/dist/lang/${locale}.umd.prod.js"></script>
      </#list>      
    </#if>
    <script>Quasar.lang.set(Quasar.lang.${locale.currentLanguageTag})</script>
  </#if>
  <script src="${url.resourcesPath}/js/config.js"></script>
  <script src="${url.resourcesPath}/js/quasar.js"></script>
</body>
</html>
</#macro>