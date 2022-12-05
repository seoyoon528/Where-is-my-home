<template>
  <v-carousel cycle height="200" hide-delimiter-background show-arrows-on-hover>
    <v-carousel-item v-for="(item, i) in top5News" :key="i">
      <v-sheet class="sheet" height="100%" rounded>
        <v-row class="fill-height" align="center" justify="center">
          <div id="news-content" @click="movePage(item)" class="mt-5">
            <h4 class="mb-4" v-html="item.title"></h4>
            <h6 class="px-3" v-html="item.description"></h6>
          </div>
        </v-row>
      </v-sheet>
    </v-carousel-item>
  </v-carousel>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  data() {
    return {
      keyword: "",
    };
  },

  computed: {
    ...mapGetters(["top5News"]),
  },

  methods: {
    movePage(item) {
      window.open(item.originallink, "_blank");
    },
  },
};
</script>

<style>
.sheet {
  background-image: url("@/assets/news4.png");
  background-size: cover;
  /* opacity: 0.7; */
}

#news-content {
    background-color: rgba(255, 255, 255, 0.5);
    padding: 10px;
}
</style>