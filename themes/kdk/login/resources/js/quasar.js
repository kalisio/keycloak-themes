/* 
  Define the Quasar app using UMD version
  see https://quasar.dev/start/umd/#quasar-config-object
*/ 
// Create the Vue app
const app = Vue.createApp({
  setup () {
    // Expose 
    return {
      email: Vue.ref(''),
      password: Vue.ref(''),
      showPassword: Vue.ref(false),
      showAbout: Vue.ref(false),
      showLegal: Vue.ref(false),
      showGDPR: Vue.ref(false),
    }
  }
})
// Tell Vue to use Quasar using the specified configuration
app.use(Quasar, {
  config: {
    brand
  }
})
// Install translations files
Quasar.lang.set(Quasar.lang.fr)
// Mount the Quasar app
app.mount('#q-app')

