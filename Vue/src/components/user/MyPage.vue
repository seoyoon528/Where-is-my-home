<template>
  <div>
    <v-container fluid grid-list-xl>
      <v-layout wrap align-center elevation="8">
        <div
          style="
            width: 80%;
            margin: 0 auto;
            margin-top: 70px;
            margin-bottom: 10px;
          "
        >
          <v-card
            style="margin: 0 auto; padding: 40px; width: 65%"
            rounded="xl"
          >
            <v-flex xs12 sm6 d-flex align-self-center style="margin: 0 auto">
              <v-img src="@/assets/mypage_icon.gif" width="50%"></v-img>
            </v-flex>
            <v-flex xs12 sm4 d-flex align-self-center style="margin: 0 auto">
              <h3 style="margin: 0 auto; font-weight: bold">
                {{ userInfo.uname }}
              </h3>
            </v-flex>
            <hr />
            <div style="margin: 0 auto; padding: 0 10px 10px 10px">
              <v-row>
                <v-col sm="4">
                  <v-chip
                    class="ma-2"
                    color="orange"
                    label
                    text-color="white"
                    style="font-weight: bold"
                    >ID</v-chip
                  >
                </v-col>
                <v-col sm="8" align-self="center" style="font-weight: bold">
                  {{ userInfo.uid }}
                </v-col>
              </v-row>
              <v-row>
                <v-col sm="4">
                  <v-chip
                    class="ma-2"
                    color="blue"
                    label
                    text-color="white"
                    style="font-weight: bold"
                    >이름</v-chip
                  >
                </v-col>
                <v-col sm="8" align-self="center" style="font-weight: bold">
                  {{ userInfo.uname }}
                </v-col>
              </v-row>
              <v-row>
                <v-col sm="4">
                  <v-chip
                    class="ma-2"
                    color="green"
                    label
                    text-color="white"
                    style="font-weight: bold"
                    >주소</v-chip
                  >
                </v-col>
                <v-col sm="8" align-self="center" style="font-weight: bold">
                  {{ userInfo.uaddr }}
                </v-col>
              </v-row>
              <v-row>
                <v-col sm="4">
                  <v-chip
                    class="ma-2"
                    color="pink lighten-3"
                    label
                    text-color="white"
                    style="font-weight: bold"
                    >사용자 타입</v-chip
                  >
                </v-col>
                <v-col sm="8" align-self="center" style="font-weight: bold">
                  <v-flex
                    xs8
                    sm8
                    v-if="userInfo.utype == 'normal'"
                    align-self-center
                  >
                    일반 사용자
                  </v-flex>
                  <v-flex sm8 v-else align-self-center>
                    부동산 관련 종사자
                  </v-flex>
                </v-col>
              </v-row>
              <v-row>
                <v-col sm="3">
                  <v-chip
                    class="ma-2"
                    color="blue-grey lighten-3"
                    label
                    text-color="white"
                    style="font-weight: bold"
                    >관심 지역</v-chip
                  >
                </v-col>
                <v-col sm="9">
                  <v-chip
                    class="ma-2"
                    color="purple darken-4"
                    text-color="white"
                    style="font-weight: bold"
                  >
                    {{ userInfo.sidoName }}</v-chip
                  >
                  <v-chip
                    class="ma-2"
                    color="purple lighten-1"
                    text-color="white"
                    style="font-weight: bold"
                    >{{ userInfo.gugunName }}</v-chip
                  >
                  <v-chip
                    class="ma-2"
                    color="purple lighten-3"
                    text-color="white"
                    style="font-weight: bold"
                    >{{ userInfo.dongName }}</v-chip
                  >
                </v-col>
              </v-row>
              <v-flex
                xs12
                d-flex
                align-self-center
                style="margin: 0 auto; margin-top: 30px"
                ><v-btn
                  style="margin: 0 auto"
                  elevation="6"
                  :to="{ path: '/user/userModify' }"
                  ><b>내 정보 수정</b></v-btn
                ></v-flex
              >
            </div>
          </v-card>
        </div>
      </v-layout>
    </v-container>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  created() {
    console.log(this.userInfo);
  },

  computed: {
    ...mapState(["userInfo"]),
  },

  methods: {},
};
</script>

<style>
</style>