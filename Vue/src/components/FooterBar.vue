<template>
  <v-footer light padless>
    <v-card width="100%" id="footer-card" flat class="lighten-1 text-center">
      <v-card-text>
        <v-btn
          v-for="icon in icons"
          :key="icon"
          class="mx-4"
          color="rgb(200, 200, 200)"
          icon
        >
          <v-icon size="24px">
            {{ icon }}
          </v-icon>
        </v-btn>
      </v-card-text>
      <v-divider></v-divider>
      <v-card-text color="rgb(200, 200, 200)">
        <p>SSAFY HOMES Final Project</p>
        {{ new Date().getFullYear() }} — <strong>대전 5반 2조</strong>
        <p>황정주, 박서윤</p>
      </v-card-text>
    </v-card>
  </v-footer>
</template>

<script>
export default {
  data: () => ({
    icons: ["mdi-facebook", "mdi-twitter", "mdi-linkedin", "mdi-instagram"],
  }),
};
</script>

<style>
#footer-card {
  background-color: white;
}
</style>