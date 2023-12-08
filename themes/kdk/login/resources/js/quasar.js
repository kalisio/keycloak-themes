/* 
  Define the Quasar app using UMD version
  see https://quasar.dev/start/umd/#quasar-config-object
*/ 

// Create the Vue app
const app = Vue.createApp({
  setup () {
    // Configure here the data
    gcu = Vue.ref(false)
    // Expose 
    return {
      gcu
    }
  }
})
// Tell Vue to use Quasar using the specified configuration
app.use(Quasar, {
  config: {
    brand: {
      primary: '#293341'
    }
  }
})
// Install translations files
Quasar.lang.set(Quasar.lang.fr)
// Mount the Quasar app
app.mount('#q-app')