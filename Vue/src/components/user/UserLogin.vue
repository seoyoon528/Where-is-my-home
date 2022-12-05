<template>
  <div>
    <v-container fluid grid-list-xl>
      <v-layout wrap align-center elevation="8" class="mt-15">
        <div style="width: 20%; margin: 0 auto">
          <v-flex> 아이디 </v-flex>
          <v-text-field v-model="user.uid" label="ID" solo></v-text-field>
          <v-flex> 비밀번호 </v-flex>
          <v-text-field
            v-model="user.upw"
            label="PW"
            solo
            type="password"
          ></v-text-field>
          <v-flex align-self-center style="margin: 0 auto; text-align: center"
            ><v-btn
              color="amber white--text"
              style="font-weight: bold; font-size: 18px"
              large
              rounded
              @click="confirm"
              >로그인</v-btn
            ></v-flex
          >
        </div>
      </v-layout>
    </v-container>
  </div>
</template>

<script>
import { mapState, mapActions, mapGetters } from "vuex";

export default {
  name: "UserLogin",
  data() {
    return {
      user: {
        uid: "",
        upw: "",
      },
      ////snackbar 관련부분
      snackbar: false,
      text: `ID 또는 PW를 확인해주세요.`,
      //////////////////////////////////////
    };
  },
  computed: {
    ...mapState(["isLogin", "isLoginError", "userInfo"]),
    ...mapGetters(["checkUserInfo"]),
  },
  watch: {
    checkUserInfo(userVal) {
      console.log("로그인 정보 확인", userVal);
    },
  },
  methods: {
    ...mapActions(["userLogin", "getUserInfo"]),
    async confirm() {
      await this.userLogin(this.user);
      let token = sessionStorage.getItem("access-token");
      console.log("1. confirm() token >> " + token);
      // console.log("UserLogin.vue에서 isLogin : ", this.isLogin);
      if (this.isLogin == false) {
        alert("ID 또는 PW를 확인해주세요.");
        // this.snackbar = true;
      }
      if (this.isLogin) {
        await this.getUserInfo(token);
        console.log("4. confirm() userInfo :: ", this.userInfo);
        this.$router.push({ path: "/" });
      }
    },
  },
};
</script>

<style>
</style>