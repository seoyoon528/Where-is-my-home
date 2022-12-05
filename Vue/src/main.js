import Vue from "vue";
import App from "./App.vue";
// Import Bootstrap and BootstrapVue CSS files (order is important)
import { BootstrapVue, IconsPlugin } from "bootstrap-vue";
import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";
import vuetify from "./plugins/vuetify";
import store from "./store";
import router from "./router";

// /* import the fontawesome core */
// import { library } from "@fortawesome/fontawesome-svg-core";
// /* import font awesome icon component */
// import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
// /* import specific icons */
// import { faUserSecret } from "@fortawesome/free-solid-svg-icons";

// Make BootstrapVue available throughout your project
Vue.use(BootstrapVue);
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin);

// /* add icons to the library */
// library.add(faUserSecret);
// /* add font awesome icon component */
// Vue.component("font-awesome-icon", FontAwesomeIcon);

Vue.config.productionTip = false;

new Vue({
  vuetify,
  store,
  router,
  render: (h) => h(App),
}).$mount("#app");
