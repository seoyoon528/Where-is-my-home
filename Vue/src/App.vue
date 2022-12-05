<template>
  <v-app id="app">
    <header-nav></header-nav>
    <v-main class="lighten-3">
      <router-view />
    </v-main>
    <footer-bar></footer-bar>
  </v-app>
</template>

<script>
import HeaderNav from "@/components/HeaderNav.vue";
import FooterBar from "@/components/FooterBar.vue";
export default {
  name: "App",
  components: {
    HeaderNav,
    FooterBar,
  },
};
</script>

<style>
@font-face {
  font-family: "OSeongandHanEum-Bold";
  src: url("assets/fonts/OSeongandHanEum-Bold.ttf") format("truetype");
  font-weight: 400;
}
@font-face {
  font-family: "SeoulNamsanB";
  src: url("assets/fonts/SeoulNamsanB.ttf") format("truetype");
  font-weight: 400;
}
@font-face {
  font-family: "JejuGothic";
  src: url("assets/fonts/JejuGothic.ttf") format("truetype");
  font-weight: 400;
}
@font-face {
  font-family: "BMDOHYEON_ttf";
  src: url("assets/fonts/BMDOHYEON_ttf.ttf") format("truetype");
  font-weight: 400;
}
@font-face {
  font-family: "BMHANNA_11yrs_ttf";
  src: url("assets/fonts/BMHANNA_11yrs_ttf.ttf") format("truetype");
  font-weight: 400;
}
@font-face {
  font-family: "OSeongandHanEum-Bold";
  src: url("assets/fonts/OSeongandHanEum-Bold.ttf") format("truetype");
  font-weight: 400;
}
</style>
