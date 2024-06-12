<div class="q-pa-sm column items-center justify-end">
  <div class="row justify-center items-center q-gutter-x-sm">
    <q-icon id="theme-info" name="las la-info-circle" size="sm">
      <q-tooltip class="bg-primary text-white text-caption">
        <div>${msg('themeVersion')}: <b>{{ version().theme }}</b></div>
        <div>${msg('kdkThemeVersion')}: <b>{{ version().kdkTheme }}</b></div>
      </q-tooltip>
    </q-icon>
    <div>|</div>
    <div>
      ${msg('designBy')}
      <a href="https://kalisio.com" target="_blank">Kalisio</a>
    </div>
  </div>
</div>