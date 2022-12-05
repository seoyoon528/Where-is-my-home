<template>
  <div>
    <v-sheet id="main-sheet1" height="800">
      <v-container fill-height fluid>
        <v-row align="center" justify="center" class="my-15">
          <v-col id="card-desc" align="left">
            <h1 class="apart-desc-h1">전국 아파트 매매</h1>
            <h1 class="apart-desc-h1">실거래가 조회</h1>
            <h5 class="apart-desc-h5" id="h5-top">
              선택한 시, 군/구, 동에서 거래된
            </h5>
            <h5 class="apart-desc-h5">
              아파트 매매 내역과 상세 정보를 보여줘요.
            </h5>
          </v-col>
          <v-col class="pa-16" style="text-align: center">
            <v-hover v-slot="{ hover }">
              <v-card
                flat
                :class="{ 'on-hover': hover }"
                rounded
                color="rgba(0, 0, 0, 0)"
                height="500px"
                width="500px"
              >
                <img
                  src="@/assets/home_chart_outline.gif"
                  height="500px"
                  width="500px"
                />
                <div v-if="hover">
                  <v-btn
                    id="apart-move-btn"
                    class="white--text"
                    elevation="20"
                    fa-beat-fade
                    rounded
                    x-large
                    color="#48D1CC"
                    @click="movePage('aptdeal')"
                  >
                    <v-icon left color="#FFFFFF"
                      >fas fa-solid fa-chart-line</v-icon
                    >
                    서비스 바로 이동!
                  </v-btn>
                </div>
              </v-card>
            </v-hover>
          </v-col>
        </v-row>
      </v-container>
    </v-sheet>
    <v-sheet id="main-sheet2" height="800">
      <v-container fill-height fluid>
        <v-row align="center" justify="center" class="my-15">
          <v-col class="pa-15" style="text-align: center">
            <v-hover v-slot="{ hover }">
              <v-card
                flat
                :class="{ 'on-hover': hover }"
                rounded
                color="rgba(0, 0, 0, 0)"
                height="500px"
                width="500px"
              >
                <img
                  src="@/assets/networking.png"
                  height="400px"
                  width="400px"
                />
                <div v-if="hover">
                  <v-btn
                    id="apart-board-btn"
                    class="white--text"
                    elevation="20"
                    fa-beat-fade
                    rounded
                    x-large
                    color="#FA8072"
                    @click="movePage('board')"
                  >
                    <v-icon left color="#FFFFFF">mdi-message-text</v-icon>
                    게시판 바로 이동!
                  </v-btn>
                </div>
              </v-card>
            </v-hover>
          </v-col>
          <v-col id="card-desc2" align="center">
            <div style="text-align: left; padding: 80px">
              <h1 class="apart-desc-h1">다양한 정보를</h1>
              <h1 class="apart-desc-h1">공유할 수 있는</h1>
              <h1 class="apart-desc-h1">커뮤니티</h1>
              <h5 class="apart-desc-h5" id="h5-top2">
                평소 아파트 매매 거래에 대해 궁금했던 점,
              </h5>
              <h5 class="apart-desc-h5">나만 알기 아쉬운 부동산 소식 등</h5>
              <h5 class="apart-desc-h5">알짜배기 정보를 공유해요.</h5>
            </div>
          </v-col>
        </v-row>
      </v-container>
    </v-sheet>
    <v-sheet class="pa-10" id="main-sheet3" height="850">
      <!-- 로그인 후 부동산 맞춤 정보 표시 -->
      <v-card
        v-if="userInfo != null"
        class="px-15 pt-10"
        id="personal-real-estate"
      >
        <v-row height="300">
          <h2 id="main-sheet3-title">
            <strong id="main-sheet3-title-name">{{ userInfo.uname }}</strong
            >님의 관심지역 부동산 맞춤 정보
          </h2>
          <hr />
          <v-sheet class="px-10 pt-6" color="rgba(255, 255, 255, 0.2)">
            <h3>
              " <strong class="mx-1">{{ userInfo.sidoName }}</strong
              ><strong class="mx-1">{{ userInfo.gugunName }}</strong>
              <strong class="ml-1">{{ userInfo.dongName }}</strong> "의 아파트
              매매 거래량은 총
              <strong v-if="dongAptCount" style="color: rgb(0, 102, 0)">{{
                dongAptCount
              }}</strong>
              <strong v-else style="color: rgb(0, 102, 0)">0</strong>건 입니다.
            </h3>
            <h3 class="mt-8 mx-5">
              거래량이 가장 많은 아파트
              <strong style="color: rgb(153, 0, 0)">TOP 3</strong>는
            </h3>
            <v-row class="px-16 py-3">
              <v-col v-for="(item, i) in threeApt" :key="i" align="center">
                <!-- 아파트 클릭 시 정보 띄워주기 dialog START -->
                <v-col cols="auto">
                  <v-dialog
                    transition="dialog-bottom-transition"
                    max-width="600"
                  >
                    <template v-slot:activator="{ on, attrs }">
                      <!-- 아파트 목록 -->
                      <v-card
                        width="150"
                        class="px-2 pt-2"
                        elevation="15"
                        v-bind="attrs"
                        v-on="on"
                        @click="getAptItem(item.aptCode)"
                      >
                        <v-img src="@/assets/apartment.png" width="40" />
                        <div style="padding-top: 15px">
                          <h6>{{ item.apartmentName }}</h6>
                          <p style="font-size: 14px; color: gray">
                            총 {{ item.count }}건
                          </p>
                        </div>
                      </v-card>
                      <!-- 아파트 목록 end -->
                    </template>

                    <template v-slot:default="dialog">
                      <v-card class="px-10 pt-10">
                        <div style="text-align: center">
                          <h4
                            style="
                              font-weight: bold;
                              font-size: 30px;
                              font-family: Jejugothic;
                            "
                          >
                            {{ item.apartmentName }}
                          </h4>
                        </div>
                        <v-container class="pa-10">
                          <v-row justify="center">
                            <v-col>
                              <v-card
                                class="pa-2"
                                width="200"
                                height="200"
                                align="center"
                                justify="center"
                                elevation="10"
                              >
                                <v-row
                                  align="center"
                                  justify="center"
                                  class="card-item-title"
                                  >지번주소</v-row
                                >
                                <v-img
                                  src="@/assets/home_addr.png"
                                  width="100px"
                                  height="100px"
                                  class="my-3"
                                ></v-img>
                                <v-row
                                  class="card-item-content px-10"
                                  align="center"
                                  justify="center"
                                >
                                  {{ house.dongCode.sidoName }}
                                  {{ house.dongCode.gugunName }}
                                  {{ house.dongCode.dongName }}
                                  {{ house.houseInfo.roadName }}
                                </v-row>
                              </v-card>
                            </v-col>
                            <v-col>
                              <v-card
                                class="pa-2"
                                width="200"
                                height="200"
                                align="center"
                                justify="center"
                                elevation="10"
                              >
                                <v-row
                                  align="center"
                                  justify="center"
                                  class="card-item-title"
                                  >도로명주소</v-row
                                >
                                <v-img
                                  src="@/assets/highway-sign.png"
                                  width="100px"
                                  height="100px"
                                  class="my-5"
                                ></v-img>
                                <v-row
                                  class="card-item-content px-10"
                                  align="center"
                                  justify="center"
                                >
                                  {{ house.houseInfo.roadName }}
                                </v-row>
                              </v-card>
                            </v-col>
                          </v-row>
                          <v-row>
                            <v-col>
                              <v-card
                                class="pa-2"
                                width="200"
                                height="200"
                                align="center"
                                justify="center"
                                elevation="10"
                              >
                                <v-row
                                  align="center"
                                  justify="center"
                                  class="card-item-title"
                                  >건축년도</v-row
                                >
                                <v-img
                                  src="@/assets/fireworks.png"
                                  width="100px"
                                  height="100px"
                                  class="my-5"
                                ></v-img>
                                <v-row
                                  class="card-item-content px-10"
                                  align="center"
                                  justify="center"
                                >
                                  {{ house.houseInfo.buildYear }}년
                                </v-row>
                              </v-card>
                            </v-col>
                            <v-col>
                              <v-card
                                class="pa-2"
                                width="200"
                                height="200"
                                align="center"
                                justify="center"
                                elevation="10"
                              >
                                <v-row
                                  align="center"
                                  justify="center"
                                  class="card-item-title"
                                  >평균면적</v-row
                                >
                                <v-img
                                  src="@/assets/area.png"
                                  width="100px"
                                  height="100px"
                                  class="my-5"
                                ></v-img>
                                <v-row
                                  class="card-item-content px-10"
                                  align="center"
                                  justify="center"
                                >
                                  {{ area }}㎡
                                </v-row>
                              </v-card>
                            </v-col>
                          </v-row>
                        </v-container>

                        <v-card-actions class="justify-end">
                          <v-btn text @click="dialog.value = false"
                            >Close</v-btn
                          >
                        </v-card-actions>
                      </v-card>
                    </template>
                  </v-dialog>
                </v-col>
                <!-- 아파트 클릭 시 정보 띄워주기 dialog END -->
              </v-col>
              <v-col
                v-for="i in 3 - threeApt.length"
                :key="i + threeApt.length"
                align="center"
              >
                <v-card width="150" class="px-2 pt-2" elevation="10">
                  <v-img src="@/assets/apartment.png" width="40" />
                  <div style="padding-top: 15px">
                    <h6>아파트 매물이 없습니다!</h6>
                  </div>
                </v-card>
              </v-col>
            </v-row>
          </v-sheet>
        </v-row>
        <v-row height="300" class="pl-11 pt-8">
          <v-col sm="9">
            <h3>부동산 뉴스</h3>
            <v-row justify="center" class="px-6 pt-2">
              <v-card style="text-align: center" max-width="850" flat>
                <naver-news></naver-news>
              </v-card>
            </v-row>
          </v-col>
          <v-col sm="3">
            <div align="right">
              <v-img src="@/assets/landlord.png" width="280"></v-img>
            </div>
          </v-col>
        </v-row>
      </v-card>

      <!-- 로그아웃 시 보여줄 화면 -->
      <v-card
        v-else
        class="px-15 pt-10"
        id="personal-real-estate-none-Login"
        height="100%"
        elevation="20"
      >
        <v-row class="fill-height" align="center" justify="center">
          <div style="text-align: center">
            <h1>부동산 맞춤정보 서비스는</h1>
            <h1>로그인 후 이용이 가능합니다.</h1>
            <v-btn
              rounded
              large
              elevation="10"
              color="amber"
              class="mt-5 white--text"
              style="font-weight: bold"
              @click="movePage('login')"
              >Login</v-btn
            >
          </div>
        </v-row>
      </v-card>
    </v-sheet>
  </div>
</template>

<script>
import { mapActions, mapGetters, mapState } from "vuex";
import NaverNews from "@/components/house/NaverNews.vue";

export default {
  name: "AppMain",

  components: { NaverNews },

  data() {
    return {};
  },

  computed: {
    ...mapState(["userInfo", "dongAptCount", "threeApt", "house"]),
    ...mapGetters(["area"]),
  },

  mounted() {
    // TODO 여기 지역 -> 고객이 회원가입 시 등록한 관심 지역으로 변경
    this.searchNaverNews(
      this.userInfo.sidoName + this.userInfo.gugunName + " 부동산 아파트"
    );
    this.getTotalDongAptCount(this.userInfo.dongCode);
    this.getTop3AptList(this.userInfo.dongCode);
  },

  methods: {
    ...mapActions([
      "searchNaverNews",
      "getTotalDongAptCount",
      "getTop3AptList",
      "getAptItem",
    ]),

    movePage(type) {
      switch (type) {
        case "aptdeal":
          this.$router.push({ path: "/houseDeal" });
          break;
        case "board":
          this.$router.push({ path: "/board/list" });
          break;
        case "login":
          this.$router.push({ path: "/user/userLogin" });
          break;
      }
    },
  },
};
</script>

<style>
/* v-sheet {
    -webkit-transition: 0.4s ease-in-out;
  transition: 0.4s ease-in-out;
} */

.mainSheet {
  -webkit-animation: fadein 2s;
}

@keyframes fadein {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}

#main-sheet1 {
  background-color: RGB(251, 247, 241);
  -webkit-animation: fadein 2s;
}

#main-sheet2 {
  background-color: RGB(255, 255, 255);
  -webkit-animation: fadein 2s;
}

#main-sheet3 {
  /* background-color: RGB(239, 255, 239); */
  background-color: #f1f8e9;
  font-family: "JejuGothic";
  -webkit-animation: fadein 2s;
}

.apart-desc-h1 {
  font-family: "BMHANNA_11yrs_ttf";
  font-size: 50px;
  /* font-weight: bold; */
}

.apart-desc-h5 {
  color: rgb(100, 100, 100);
}

#h5-top {
  margin-top: 40px;
}

#h5-top2 {
  margin-top: 40px;
}

#apart-move-btn {
  font-size: 18px;
  font-weight: bold;
}

#apart-board-btn {
  margin-top: 70px;
  font-size: 18px;
  font-weight: bold;
}

#personal-real-estate {
  background-color: rgba(255, 255, 255, 0.5);
}

#personal-real-estate-none-Login {
  background-color: rgba(255, 255, 255, 0.6);
}

#card-desc {
  padding: 150px;
}

#main-sheet3-title {
  font-family: "JejuGothic";
  font-size: 40px;
}

.card-item-title {
  font-weight: bold;
  font-family: "JejuGothic";
  font-size: 20px;
}

.card-item-content {
  font-family: "JejuGothic";
}
</style>