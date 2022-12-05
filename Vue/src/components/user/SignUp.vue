<template>
  <div>
    <v-container fluid grid-list-xl>
      <v-layout wrap align-center elevation="8">
        <div style="width: 70%; margin: 0 auto; margin-top: 100px">
          <v-text-field
            v-model="user.uname"
            :counter="10"
            :rules="nameRules"
            label="Name"
            required
            clearable
            ref="username"
          ></v-text-field>
          <v-text-field
            v-model="user.uid"
            :counter="10"
            :rules="nameRules"
            label="ID"
            required
            clearable
            ref="userid"
          ></v-text-field>
          <v-text-field
            v-model="user.upw"
            :counter="10"
            :rules="nameRules"
            type="password"
            label="PW"
            required
            clearable
            ref="userpw"
          ></v-text-field>
          <v-text-field
            v-model="user.uaddr"
            :rules="nameRules"
            label="Address"
            placeholder="ex) 대전광역시 유성구 학하서로"
            required
            clearable
            ref="useraddr"
          ></v-text-field>

          <v-select
            v-model="user.utype"
            :items="items"
            :rules="nameRules"
            label="UserType"
            required
            ref="usertype"
          ></v-select>
          <v-row class="justify-center mt-5">
            <v-col
              cols="12"
              sm="3"
              align-self="center"
              style="font-size: 18px; color: #919191; font-family: JejuGothic"
              >관심 지역</v-col
            >
            <v-col>
              <v-row>
                <v-col cols="12" sm="3">
                  <v-select
                    v-model="user.sidoCodeVal"
                    :items="sidos"
                    id="sido"
                    label="시 / 도"
                    rounded
                    solo
                    @change="setParameterSido(user.sidoCodeVal)"
                  ></v-select>
                </v-col>
                <v-col cols="12" sm="3">
                  <v-select
                    v-model="user.gugunCodeVal"
                    :items="guguns"
                    label="구 / 군"
                    rounded
                    solo
                    @change="
                      setMultiParametersGugun(
                        user.sidoCodeVal,
                        user.gugunCodeVal
                      )
                    "
                  ></v-select>
                </v-col>
                <v-col cols="12" sm="3">
                  <v-select
                    v-model="user.dongCodeVal"
                    :items="dongs"
                    label="동"
                    rounded
                    solo
                    @change="
                      setMultiParametersDong(
                        user.sidoCodeVal,
                        user.gugunCodeVal,
                        user.dongCodeVal
                      )
                    "
                  ></v-select>
                </v-col>
              </v-row>
            </v-col>
          </v-row>
          <v-row justify="center" style="margin: 0 auto; margin-top: 30px">
            <button
              :disabled="!valid"
              class="mr-4 custom-btn btn-3"
              @click="signUp"
              width="100px"
            >
              <span>가입하기</span>
            </button>
          </v-row>
        </div>
      </v-layout>
    </v-container>
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";

export default {
  data() {
    return {
      valid: true,
      user: {
        uname: "",
        uid: "",
        upw: "",
        uaddr: "",
        utype: "",
        sidoCodeVal: "",
        gugunCodeVal: "",
        dongCodeVal: "",
      },
      nameRules: [(v) => !!v || "필수 입력 사항입니다."],
      select: null,
      items: ["일반 사용자", "부동산 관련 종사자"],
      checkbox: false,
    };
  },
  created() {
    this.CLEAR_SIDO_LIST();
    this.getSidoList();
  },
  computed: {
    ...mapState(["sidos", "guguns", "dongs", "dongCode"]),
  },
  methods: {
    ...mapActions([
      "getSidoList",
      "getGugunList",
      "getDongList",
      "getAptList",
      "getAptItem",
      "userSignUp",
      "getDongCode",
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
      this.getDongCode(payload);
    },

    //signup버튼 눌렀을 때
    signUp() {
      let err = true;
      let msg = "";
      !this.user.uname &&
        ((msg = "이름을 입력해주세요"),
        (err = false),
        this.$refs.username.focus());
      err &&
        !this.user.uid &&
        ((msg = "ID를 입력해주세요."),
        (err = false),
        this.$refs.userid.focus());
      !this.user.upw &&
        ((msg = "password를 입력해주세요"),
        (err = false),
        this.$refs.userpw.focus());
      !this.user.uaddr &&
        ((msg = "주소를 입력해주세요"),
        (err = false),
        this.$refs.useraddr.focus());
      err &&
        !this.user.utype &&
        ((msg = "사용자 타입을 선택해주세요."),
        (err = false),
        this.$refs.usertype.focus());

      if (!err) alert(msg);
      else {
        if (this.user.utype == "일반 사용자") {
          this.user.utype = "normal";
        } else if (this.user.utype == "부동산 관련 종사자") {
          this.user.utype = "realEstate";
        }

        console.log(this.user.sidoCodeVal);
        let data = {
          uid: this.user.uid,
          upw: this.user.upw,
          uname: this.user.uname,
          uaddr: this.user.uaddr,
          utype: this.user.utype,
          dongCode: this.dongCode,
          sidoName: this.user.sidoCodeVal,
          gugunName: this.user.gugunCodeVal,
          dongName: this.user.dongCodeVal,
        };

        this.userSignUp(data);
      }
    },
  },
};
</script>

<style scoped>
.custom-btn {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: "JejuGothic";
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
  box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, 0.5),
    7px 7px 20px 0px rgba(0, 0, 0, 0.1), 4px 4px 5px 0px rgba(0, 0, 0, 0.1);
  outline: none;
}

.btn-3 {
  background: rgb(255, 100, 69);
  background: linear-gradient(
    0deg,
    rgb(218, 119, 100) 0%,
    rgb(230, 80, 50) 100%
  );
  width: 130px;
  height: 40px;
  line-height: 42px;
  padding: 0;
  border: none;
}
.btn-3 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-3:before,
.btn-3:after {
  position: absolute;
  content: "";
  right: 0;
  top: 0;
  background: rgb(230, 80, 50);
  transition: all 0.3s ease;
}
.btn-3:before {
  height: 0%;
  width: 2px;
}
.btn-3:after {
  width: 0%;
  height: 2px;
}
.btn-3:hover {
  background: transparent;
  box-shadow: none;
}
.btn-3:hover:before {
  height: 100%;
}
.btn-3:hover:after {
  width: 100%;
}
.btn-3 span:hover {
  color: rgb(230, 80, 50);
}
.btn-3 span:before,
.btn-3 span:after {
  position: absolute;
  content: "";
  left: 0;
  bottom: 0;
  background: rgb(230, 80, 50);
  transition: all 0.3s ease;
}
.btn-3 span:before {
  width: 2px;
  height: 0%;
}
.btn-3 span:after {
  width: 0%;
  height: 2px;
}
.btn-3 span:hover:before {
  height: 100%;
}
.btn-3 span:hover:after {
  width: 100%;
}
</style>