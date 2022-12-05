<template>
  <div>
    <v-row class="justify-center mt-5">
      <v-col cols="12" sm="3">
        <v-select
          v-model="sidoCodeVal"
          :items="sidos"
          id="sido"
          label="시 / 도"
          rounded
          solo
          @change="setParameterSido(sidoCodeVal)"
        ></v-select>
      </v-col>
      <v-col cols="12" sm="3">
        <v-select
          v-model="gugunCodeVal"
          :items="guguns"
          label="구 / 군"
          rounded
          solo
          @change="setMultiParametersGugun(sidoCodeVal, gugunCodeVal)"
        ></v-select>
      </v-col>
      <v-col cols="12" sm="3">
        <v-select
          v-model="dongCodeVal"
          :items="dongs"
          label="동"
          rounded
          solo
          @change="
            setMultiParametersDong(sidoCodeVal, gugunCodeVal, dongCodeVal)
          "
        ></v-select>
      </v-col>
      <v-col justify-center cols="12" sm="1">
        <v-hover v-slot="{ hover }">
          <v-btn
            @click.stop="drawer = !drawer"
            color="#FA8072"
            class="white--text"
            rounded
            large
            :elevation="hover ? 8 : 2"
            width="120"
            style="font-size: 18px"
          >
            <v-icon left color="#FBF7F2">fas fa-search</v-icon>
            조회</v-btn
          >
        </v-hover>
      </v-col>
    </v-row>

    <!------------------ 조회 결과 아파트 리스트 띄우기 ------------------>
    <v-sheet height="700" style="position: relative" elevation="20">
      <v-navigation-drawer
        v-model="drawer"
        absolute
        temporary
        hide-overlay
        width="400"
      >
        <v-list rounded>
          <div v-if="houses.length > 0">
            <v-list-item
              three-line
              v-for="house in houses"
              :key="house.apartmentName"
              link
              @click="aptDetailItem(house.aptCode)"
            >
              <v-list-item-content class="pa-6">
                <v-list-item-title align="center"
                  ><h5>{{ house.apartmentName }}</h5></v-list-item-title
                >
                <v-list-item-subtitle
                  ><v-chip class="ma-2" color="rgb(238, 232, 170)" small
                    >도로명 주소</v-chip
                  >
                  {{ house.roadName }}</v-list-item-subtitle
                >
                <v-list-item-subtitle
                  ><v-chip class="ma-2" color="rgb(255, 225, 225)" small
                    >건축년도</v-chip
                  >{{ house.buildYear }}년</v-list-item-subtitle
                >
              </v-list-item-content>
            </v-list-item>
          </div>

          <div v-else>
            <v-list-item>
              <h6>등록된 아파트 거래 내역이 없습니다.</h6>
            </v-list-item>
          </div>
        </v-list>
      </v-navigation-drawer>

      <div id="map" style="width: 100%; height: 100%"></div>
    </v-sheet>
  </div>
</template>

<script>
// import axios from "axios";
import { mapGetters, mapState, mapActions, mapMutations } from "vuex";

export default {
  data() {
    return {
      sidoCodeVal: "",
      gugunCodeVal: "",
      dongCodeVal: "",
      drawer: null,
      map: null,
    };
  },
  created() {
    //시/도 리스트 가져옴
    this.CLEAR_SIDO_LIST();
    this.getSidoList();
  },
  mounted() {
    if (window.kakao && window.kakao.maps) {
      this.initMap();
    } else {
      const script = document.createElement("script");
      /* global kakao */
      script.onload = () => kakao.maps.load(this.initMap);
      document.head.appendChild(script);
    }
  },
  watch: {
    "options.center"(cur) {
      console.log("new center", cur.lat, cur.lng);
      this.mapInstance.setCenter(
        new window.kakao.maps.LatLng(cur.lat, cur.lng)
      );
    },
    lats() {
      console.log("watch lats:" + this.lats);
      this.setMap();
    },
  },

  computed: {
    ...mapState(["sidos", "guguns", "dongs", "houses", "house"]),
    ...mapGetters(["lats", "lngs"]),
  },

  methods: {
    ...mapActions([
      "getSidoList",
      "getGugunList",
      "getDongList",
      "getAptList",
      "getAptItem",
    ]),
    ...mapMutations([
      "CLEAR_SIDO_LIST",
      "CLEAR_GUGUN_LIST",
      "CLEAR_DONG_LIST",
      "CLEAR_APT_LIST",
    ]),

    // 시도 코드로 구군 리스트 가져옴
    setParameterSido(sidoCodeVal) {
      this.dongCodeVal = null;
      this.gugunCodeVal = null;
      this.CLEAR_GUGUN_LIST();
      this.CLEAR_DONG_LIST();
      this.getGugunList(sidoCodeVal);
    },

    // 시도 코드 & 구군 코드로 여러개로 동 리스트 가져옴
    setMultiParametersGugun(sidoCodeVal, gugunCodeVal) {
      this.CLEAR_DONG_LIST();
      let payload = { sidoCodeVal, gugunCodeVal };
      this.getDongList(payload);
    },

    // 시도 코드 & 구군 코드 & 동 코드로 아파트 목록 리스트 가져옴
    setMultiParametersDong(sidoCodeVal, gugunCodeVal, dongCodeVal) {
      this.CLEAR_APT_LIST();
      let payload = { sidoCodeVal, gugunCodeVal, dongCodeVal };
      this.getAptList(payload);
    },

    aptDetailItem(aptCode) {
      this.getAptItem(aptCode);
      this.$router.push({ path: "/houseDealDetail/" + aptCode });
    },

    // 아파트 리스트 가져와 위도, 경도로 지도에 마커 찍기
    setMap() {
      console.log(this.houses.length);
      if (this.houses.length > 0) {
        var imageSrc =
          "https://cdn-icons-png.flaticon.com/512/4551/4551325.png";
        var container = this.map;

        for (let i = 0; i < this.houses.length; i++) {
          // 마커 이미지의 이미지 크기 입니다
          var imageSize = new kakao.maps.Size(60, 60);
          // 마커 이미지를 생성합니다
          var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

          // 마커를 생성합니다
          new kakao.maps.Marker({
            map: this.map, // 마커를 표시할 지도
            position: new kakao.maps.LatLng(this.lats[i], this.lngs[i]), // 마커를 표시할 위치
            title: "hi", // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image: markerImage,
            // 마커 이미지
          });
        }

        var locPosition = new kakao.maps.LatLng(this.lats[0], this.lngs[0]); //좋아요 목록 첫번째 아파트의 위치 지정
        container.setCenter(locPosition); // 지도 중심좌표를 지정한 곳으로 변경

        // 지도에 확대 축소 컨트롤을 생성한다
        var zoomControl = new kakao.maps.ZoomControl();
        // 지도의 우측에 확대 축소 컨트롤을 추가한다
        container.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
      }
    },

    // 지도 생성하는 함수
    initMap() {
      var container = document.getElementById("map");
      var options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 2,
      };
      var map = new kakao.maps.Map(container, options);

      this.map = map;
      // map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);

      // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
      if (navigator.geolocation) {
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function (position) {
          var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도

          var imageSrc =
              "https://cdn-icons-png.flaticon.com/512/1093/1093121.png",
            imageSize = new kakao.maps.Size(65, 65);
          var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

          var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="font-weight: bold;">현재 위치입니다!</div>'; // 인포윈도우에 표시될 내용입니다

          // 마커와 인포윈도우를 표시합니다
          displayMarker(locPosition, message, markerImage);
        });
      } else {
        // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        var imageSrc =
            "https://cdn-icons-png.flaticon.com/512/1093/1093121.png",
          imageSize = new kakao.maps.Size(60, 68);
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
          message = "현재 위치를 발견하지 못했습니다.";

        displayMarker(locPosition, message, markerImage);
      }

      // 지도에 마커와 인포윈도우를 표시하는 함수입니다
      function displayMarker(locPosition, message, image) {
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
          map: map,
          position: locPosition,
          image: image,
        });

        var iwContent = message, // 인포윈도우에 표시할 내용
          iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
          content: iwContent,
          removable: iwRemoveable,
        });

        // 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);

        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);
      }
    },
  },
};
</script>

<style>
</style>