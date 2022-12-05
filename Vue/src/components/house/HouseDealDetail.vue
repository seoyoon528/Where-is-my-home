<template>
  <div v-if="$store.state.house">
    <v-sheet align="center" class="pa-10">
      <v-card max-width="1400" class="pa-10" elevation="6">
        <div style="font-size: 40px; font-weight: bold">
          {{ house.houseInfo.apartmentName }}
        </div>
        <hr />
        <v-row>
          <v-col>
            <v-card max-width="450" height="350" flat class="ma-6" align="left">
              <map-init></map-init>
            </v-card>
          </v-col>
          <v-col>
            <v-card max-width="650" flat class="ma-6" align="left">
              <v-row class="ma-0">
                <v-col sm="4"
                  ><v-chip
                    class="ma-2"
                    color="rgb(76, 153, 0)"
                    label
                    text-color="white"
                    style="font-weight: bold"
                  >
                    <v-icon left>mdi-label</v-icon>
                    지번 주소</v-chip
                  ></v-col
                >
                <v-col sm="8" align-self="center">
                  {{ house.dongCode.sidoName }}
                  {{ house.dongCode.gugunName }}
                  {{ house.dongCode.dongName }}
                  {{ house.houseInfo.roadName }}
                </v-col>
              </v-row>
              <v-row class="ma-0">
                <v-col sm="4">
                  <v-chip
                    class="ma-2"
                    color="orange"
                    label
                    text-color="white"
                    style="font-weight: bold"
                  >
                    <v-icon left> mdi-call-split </v-icon>
                    도로명 주소</v-chip
                  >
                </v-col>
                <v-col sm="8" align-self="center">{{
                  house.houseInfo.roadName
                }}</v-col>
              </v-row>
              <v-row class="ma-0">
                <v-col sm="4">
                  <v-chip
                    class="ma-2"
                    color="rgb(0, 102, 204)"
                    label
                    text-color="white"
                    style="font-weight: bold"
                  >
                    <v-icon left> mdi-domain </v-icon>
                    건축년도</v-chip
                  >
                </v-col>
                <v-col sm="8" align-self="center"
                  >{{ house.houseInfo.buildYear }}년</v-col
                >
              </v-row>
              <v-row class="ma-0">
                <v-col sm="4">
                  <v-chip
                    class="ma-2"
                    color="rgb(255, 137, 137) "
                    label
                    text-color="white"
                    style="font-weight: bold"
                  >
                    <v-icon left> mdi-checkbox-marked-circle </v-icon>
                    평균 면적</v-chip
                  ></v-col
                >
                <v-col sm="8" align-self="center">{{ area }}㎡</v-col>
              </v-row>
              <v-row>
                <v-col>
                  <v-row justify="center">
                    <v-hover v-slot="{ hover }">
                      <v-btn
                        color="rgb(255, 100, 69)"
                        rounded
                        outlined
                        large
                        :elevation="hover ? 8 : 2"
                        width="135"
                        class="mr-5"
                        style="font-weight: bold"
                        @click="getDirections()"
                      >
                        길찾기</v-btn
                      >
                    </v-hover>
                    <v-hover v-slot="{ hover }">
                      <v-btn
                        color="rgb(0, 102, 0)"
                        rounded
                        outlined
                        large
                        :elevation="hover ? 8 : 2"
                        width="135"
                        class="mr-5"
                        style="font-weight: bold"
                        @click="naverSerach()"
                      >
                        검색 결과 보기</v-btn
                      >
                    </v-hover>
                    <v-hover v-slot="{ hover }">
                      <v-btn
                        color="primary"
                        rounded
                        outlined
                        large
                        :elevation="hover ? 8 : 2"
                        width="135"
                        style="font-weight: bold"
                        @click="naverSearchRealEstate()"
                      >
                        주변 부동산 보기</v-btn
                      >
                    </v-hover>
                  </v-row>
                </v-col>
              </v-row>
            </v-card>
          </v-col>
        </v-row>
        <v-simple-table id="deal-list" fluid align="center" class="mt-10">
          <template v-slot:default>
            <thead>
              <tr>
                <th
                  class="text-center font-weight-bold"
                  style="font-size: 16px"
                >
                  <span class="head-span">#</span>
                </th>
                <th
                  class="text-center font-weight-bold"
                  style="font-size: 16px"
                >
                  <span class="head-span">층</span>
                </th>
                <th
                  class="text-center font-weight-bold"
                  style="font-size: 16px"
                >
                  <span class="head-span">면적</span>
                </th>
                <th
                  class="text-center font-weight-bold"
                  style="font-size: 16px"
                >
                  <span class="head-span">거래 금액</span>
                </th>
                <th
                  class="text-center font-weight-bold"
                  style="font-size: 16px"
                >
                  <span class="head-span">거래 일자</span>
                </th>
              </tr>
            </thead>
            <tbody class="text-center">
              <tr v-for="(houseItem, idx) in house.dealList" :key="idx">
                <td>{{ idx + 1 }}</td>
                <td>{{ houseItem.floor }}층</td>
                <td>{{ houseItem.area }} ㎡</td>
                <td>{{ houseItem.dealAmount }} 만원</td>
                <td>
                  {{ houseItem.dealYear }} - {{ houseItem.dealMonth }} -
                  {{ houseItem.dealDay }}
                </td>
              </tr>
            </tbody>
          </template>
        </v-simple-table>
      </v-card>
    </v-sheet>
  </div>
</template>

<script>
import { mapState, mapGetters } from "vuex";
import MapInit from "@/components/house/MapInit.vue";

export default {
  components: {
    MapInit,
  },

  watch: {
    "options.center"(cur) {
      console.log("new center", cur.lat, cur.lng);
      this.mapInstance.setCenter(
        new window.kakao.maps.LatLng(cur.lat, cur.lng)
      );
    },
  },

  computed: {
    ...mapState(["house"]),
    ...mapGetters(["area"]),
  },

  methods: {
    naverSerach() {
      window.open(
        "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=" +
          this.house.dongCode.sidoName +
          " " +
          this.house.dongCode.gugunName +
          " " +
          this.house.dongCode.dongName +
          " " +
          this.house.houseInfo.roadName,
        "_blank"
      );
    },

    naverSearchRealEstate() {
      window.open(
        "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=" +
          this.house.dongCode.sidoName +
          " " +
          this.house.dongCode.gugunName +
          " " +
          this.house.dongCode.dongName +
          " 부동산",
        "_blank"
      );
    },

    getDirections() {
      window.open(
        "https://map.kakao.com/link/to/" +
          this.house.houseInfo.apartmentName +
          "," +
          this.house.houseInfo.lat +
          "," +
          this.house.houseInfo.lng
      );
    },

    initial() {
      console.log("house 나와라 ===> ", this.house);
      try {
        if (this.house != null) {
          console.log("lat --> ", this.house.houseinfo.lat);
        }
      } catch (err) {
        console.log(err);
      }
    },
  },
};
</script>

<style>
</style>