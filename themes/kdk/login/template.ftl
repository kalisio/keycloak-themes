<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html>

<head>
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons" rel="stylesheet" type="text/css">
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
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body>
    <div id="q-app">
      <div class="window-height window-width row justify-center bg-grey-4">
        <!-- 
          Header 
        -->
        <div class="col-12 self-start column justify-start items-center">
          <#include "fragments/header.flt">
        </div>
        <!-- 
          Content 
        -->
        <div class="column justify-center" style="min-width: 50%;">
          <q-card class="full-width bg-white" >
            <!-- banner -->
            <q-card-section>
              <div class="row justify-center items-center">
                <#include "fragments/banner.flt">
              </div>
            </q-card-section>
            <!-- form -->
            <q-card-section>
              <div class="row justify-center items-center">
                <#nested "form">
              </div>
            </q-card-section>
            <!-- social providers -->
            <q-card-section>
              <div class="row justify-center items-center">
                <#nested "socialProviders">
              </div>
            </q-card-section>
          </q-card>
          <!-- global options -->
          <#include "fragments/options.flt">
        </div>
        <!-- 
          Footer 
        -->
        <div class="col-12 self-end column justify-end items-center">
          <#include "fragments/footer.flt">
        </div>
    </div>
    <!-- 
      Use Vue and Quasar with UMD version
      For more information, refer to https://quasar.dev/start/umd#installation
    -->
    <script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.prod.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/quasar@2.14.1/dist/quasar.umd.prod.js"></script>
    <script src="${url.resourcesPath}/js/brand.js"></script>
    <script src="${url.resourcesPath}/js/quasar.js"></script>
</body>
</html>
</#macro>