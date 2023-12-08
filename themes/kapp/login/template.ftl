<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html class="${properties.kcHtmlClass!}">

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
          Header
        </div>
        <!-- 
          Content 
        -->
        <div class="column justify-center" style="min-width: 50%;">
          <q-card class="full-width bg-white" >
            <!-- logo -->
            <q-card-section>
                <div class="row justify-center items-center ">
                    <img class="col-2" src="${url.resourcesPath}/img/irsn.png" />
                    <img class="col-2" src="${url.resourcesPath}/img/opal.png" />
                </div>
                <div class="row justify-center items-center text-dark" style="font-size: 20px;">
                    en partenariat avec <img class="col-2" src="${url.resourcesPath}/img/anccli.png" />
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
          <!-- global linkg -->
          <div class="row justify-center items-center">
            <q-btn label="Conditions générales" flat no-caps rounded @click="gcu = true" />
          </div>
        </div>
        <!-- 
          Footer 
        -->
        <div class="col-12 self-end column justify-end items-center">
          <div class="row items-center">
            <span id="kdk-txt">Réalisé avec le Kalisio's Development Kit</span>
            <q-btn id="kdk-link" icon="link" tooltip="MORE_ABOUT_KDK" size="sm" href="https://kalisio.github.io/kdk" target="_blank" flat round />
          </div>
          <a href="https://kalisio.com" target="_blank">
            <img id="kLogo" loading="lazy" src="${url.resourcesPath}/img/kalisio.webp" width="80px"/>
          </a>
        </div>
        <!--
         Dialogs
        -->
        <q-dialog v-model="gcu">
          <q-card style="width: 100%">
            <q-card-section class="row items-center no-wrap">
              <div>
                <div class="text-weight-bold">Dialog</div>
                <div class="text-grey">Example</div>
              </div>

            <q-space />

            </q-card-section>
             <q-card-actions align="right">
                <q-btn label="Close" color="primary" @click="gcu = false" />
            </q-card-actions>
          </q-card>
        </q-dialog>
    </div>
    <!-- 
      Use Vue and Quasar with UMD version
      For more information, refer to https://quasar.dev/start/umd#installation
    -->
    <script src="https://cdn.jsdelivr.net/npm/vue@3/dist/vue.global.prod.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/quasar@2.14.1/dist/quasar.umd.prod.js"></script>
    <script src="${url.resourcesPath}/js/quasar.js"></script>
</body>
</html>
</#macro>