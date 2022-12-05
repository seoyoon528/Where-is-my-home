<template>
  <v-app-bar height="80px" app color="white" flat>
    <a href="/">
      <img
        id="img-logo"
        src="@/assets/homeLogo_NavBar.png"
        width="200px"
        height="100%"
      />
    </a>

    <v-layout>
      <v-flex d-flex justify-start>
        <v-tabs height="80px" color="rgb(255, 100, 69)">
          <v-tab class="tabs-item" to="/houseDeal">{{ "실거래 조회" }}</v-tab>
          <v-tab class="tabs-item" to="/board">{{ "Community" }}</v-tab>
        </v-tabs>
      </v-flex>

      <v-flex d-flex justify-end align-self-center class="pr-5">
        <div v-if="checkUserInfo != null">
          <v-row no-gutters style="flex-wrap: nowrap" justify="end">
            <v-col cols="8">
              <v-avatar
                id="avatar"
                size="35"
                color="rgba(255, 100, 69, 0.6)"
                class="white--text"
                v-text="userInfo.uid.charAt(0).toUpperCase()"
                style="font-style: bold"
              ></v-avatar>
              <strong style="padding-left: 10px"
                >{{ userInfo.uname }}({{ userInfo.uid }})</strong
              >님 환영합니다.
            </v-col>
            <v-col>
              <v-btn class="tabs-item" @click.prevent="onClickLogout"
                >로그아웃</v-btn
              >
            </v-col>
            <v-col>
              <v-btn class="tabs-item ml-5" to="/user/myPage">{{
                "MyPage"
              }}</v-btn>
            </v-col>
          </v-row>
        </div>

        <div v-else>
          <v-btn class="tabs-item" to="/user/signUp">회원가입</v-btn>
          <v-btn class="tabs-item ml-5" to="/user">{{ "Login" }}</v-btn>
        </div>
      </v-flex>
    </v-layout>
  </v-app-bar>
</template>

<script>
import { mapState, mapGetters, mapActions } from "vuex";

export default {
  data() {
    return {};
  },
  computed: {
    ...mapState(["isLogin", "userInfo"]),
    ...mapGetters(["checkUserInfo"]),
  },
  methods: {
    ...mapActions(["userLogout"]),
    // ...mapMutations(memberStore, ["SET_IS_LOGIN", "SET_USER_INFO"]),
    onClickLogout() {
      // this.SET_IS_LOGIN(false);
      // this.SET_USER_INFO(null);
      // sessionStorage.removeItem("access-token");
      // if (this.$route.path != "/") this.$router.push({ name: "main" });
      console.log(this.userInfo.uid);
      //vuex actions에서 userLogout 실행(Backend에 저장 된 리프레시 토큰 없애기
      //+ satate에 isLogin, userInfo 정보 변경)
      // this.$store.dispatch("userLogout", this.userInfo.userid);
      this.userLogout(this.userInfo.uid);
      sessionStorage.removeItem("access-token"); //저장된 토큰 없애기
      sessionStorage.removeItem("refresh-token"); //저장된 토큰 없애기
      // if (this.$route.path != "/") this.$router.push({ path: "/" });
    },
  },
};
</script>

<style scoped>
#img-logo {
  margin: 0 20px 10px 10px;
}

.tabs-item {
  font-family: "BMDOHYEON_ttf";
  font-size: 15px;
}
</style>
