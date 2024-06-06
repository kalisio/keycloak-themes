/* 
  Define the Quasar app using UMD version
  see https://quasar.dev/start/umd/#quasar-config-object
*/ 

// Create the Vue app
const app = Vue.createApp({
  setup () {
    // Data
    const environment = JSON.parse(String(document.querySelector('#environment').textContent))
    // Functions
    async function popup (title, file) {
     const content = await fetch(file)
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
      rememberMe: Vue.ref(environment.permissions.rememberMe ? 'on' : 'off'),
      loginLoading: Vue.ref(false),
      resetPasswordLoading: Vue.ref(false),
      passwordNew: Vue.ref(''),
      passwordConfirm: Vue.ref(''),
      updatedPasswordLoading: Vue.ref(false),
      showPassword: Vue.ref(false),
      showPasswordNew: Vue.ref(false),
      showPasswordConfirm: Vue.ref(false),
      submitAction: Vue.ref(''),
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


