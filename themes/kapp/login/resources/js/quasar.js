/* 
  Define the Quasar app using UMD version
  see https://quasar.dev/start/umd/#quasar-config-object
*/ 

// Create the Vue app
const app = Vue.createApp({
  setup () {
    // Configure here the data
    gcu = Vue.ref(false),
    infoO = Vue.ref(false)
    // Expose 
    return {
      gcu,
      infoO
    }
  }
})
// Tell Vue to use Quasar using the specified configuration
app.use(Quasar, {
  config: {
    brand: {
      primary: '#067DB8',
      secondary: '#82AADA',
      accent: '#2F8CC3',
      dark: '#005587',
      info: '#2F8CC3',
      positive: '#7bb946',
      negative: '#e31c3d',
      warning: '#fdb81e'
    }
  }
})
// Install translations files
Quasar.lang.set(Quasar.lang.fr)

// Mount the Quasar app
app.mount('#q-app')