/* 
  Define the Quasar app using UMD version
  see https://quasar.dev/start/umd/#quasar-config-object
*/ 

// Create the Vue app
const app = Vue.createApp({
  setup () {
    // data
    const environment = JSON.parse(String(document.querySelector('#environment').textContent))
    let informations = null
    // functions
    function version () {
      return {
        theme: themeVersion,
        kdk: kdkVersion
      }
    }
    async function popup (title, file) {
      // compute the localized file
      const index = file.lastIndexOf('.')
      const baseName = index > 0 ? file.substring(0, index) : file
      const extName = index > 0 ? file.substring(index, file.length) : ''
      const locale = environment.realm.i18n.locale || 'en'
      const localizedFile = `${baseName}_${locale}${extName}`
      // read the file content
      const content = await fetch(localizedFile)
      // open the dialog
      Quasar.Dialog.create({
        title,
        message: await content.text(),
        html: true,
        style: 'width: 800px; max-width: 90vw;',
        ok: {
          color: 'primary'
        }
      })
    }
    // Expose 
    return {
      email: Vue.ref(environment.user.email),
      username: Vue.ref(environment.user.username),
      firstName: Vue.ref(environment.user.firstName),
      lastName: Vue.ref(environment.user.lastName),
      password: Vue.ref(''),  
      rememberMe: Vue.ref(environment.realm.rememberMe ? 'on' : 'off'),
      loginLoading: Vue.ref(false),
      resetPasswordLoading: Vue.ref(false),
      passwordNew: Vue.ref(''),
      passwordConfirm: Vue.ref(''),
      updatedPasswordLoading: Vue.ref(false),
      showPassword: Vue.ref(false),
      showPasswordNew: Vue.ref(false),
      showPasswordConfirm: Vue.ref(false),
      submitAction: Vue.ref(''),
      version,
      popup
    }
  }
})

// Tell Vue to use Quasar using the specified configuration
app.use(Quasar, {
  config
})

// Mount the Quasar app
app.mount('#q-app')


