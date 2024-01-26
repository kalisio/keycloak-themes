<div class="row justify-center items-center q-gutter-xs">
  <div>
    <q-btn flat label="${msg('legalNotice')}" flat no-caps rounded 
      @click="popup('${msg('legalNotice')}', '${url.resourcesPath}/html/legal-notice_${locale.currentLanguageTag}.html')" 
    />
  </div>
  <div>|</div>
  <div>
    <q-btn flat label="${msg('dataPolicy')}" flat no-caps rounded 
      @click="popup('${msg('dataPolicy')}', '${url.resourcesPath}/html/data-policy_${locale.currentLanguageTag}.html')" 
    />
  </div>
</div>

