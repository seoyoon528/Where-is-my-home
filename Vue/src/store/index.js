import Vue from "vue";
import Vuex from "vuex";
import http from "@/util/http-common";
import jwtDecode from "jwt-decode";
import router from "@/router";
import createPersistedState from "vuex-persistedstate";

// import axios from "axios";

Vue.use(Vuex);

export default new Vuex.Store({
  plugins: [
    createPersistedState({
      storage: sessionStorage, //store를 session storage에 유지
    }),
  ],
  state: {
    sidos: [],
    guguns: [],
    dongs: [],
    houses: [],
    dongCode: null,
    dongAptCount: null,
    threeApt: [],
    house: null,
    isLogin: false,
    isLoginError: false,
    userInfo: null,
    isValidToken: false,
    newslist: [],
  },
  getters: {
    lats(state) {
      let lats = [];
      for (let i = 0; i < state.houses.length; i++) {
        lats.push(state.houses[i].lat);
      }
      return lats;
    },
    lngs(state) {
      let lngs = [];
      for (let i = 0; i < state.houses.length; i++) {
        lngs.push(state.houses[i].lng);
      }
      return lngs;
    },
    checkUserInfo: function (state) {
      return state.userInfo;
    },
    checkToken: function (state) {
      return state.isValidToken;
    },
    area(state) {
      let avgArea = 0;
      let areaSum = 0;
      for (let i = 0; i < state.house.dealList.length; i++) {
        areaSum = areaSum + parseInt(state.house.dealList[i].area);
      }
      avgArea = areaSum / state.house.dealList.length;
      return avgArea.toFixed(3);
    },
    house: (state) => state.house,

    top5News(state) {
      return state.newslist.slice(0, 5);
    },
  },

  mutations: {
    CLEAR_SIDO_LIST(state) {
      state.sidos = [{ value: null, text: "선택하세요" }];
    },
    CLEAR_GUGUN_LIST(state) {
      state.guguns = [{ value: null, text: "선택하세요" }];
    },
    CLEAR_DONG_LIST(state) {
      state.dongs = [{ value: null, text: "선택하세요" }];
    },
    CLEAR_APT_LIST(state) {
      state.houses = [];
      state.house = null;
      state.lats = [];
      state.lngs = [];
    },
    SET_SIDO_LIST(state, sidos) {
      console.log(sidos);
      sidos.forEach((sido) => {
        state.sidos.push({ value: sido.sidoCodeVal, text: sido.sidoName });
      });
    },
    SET_GUGUN_LIST(state, guguns) {
      for (let i = 1; i < guguns.length; i++) {
        state.guguns.push({ value: guguns[i].gugunCodeVal, text: guguns[i].gugunName });
      }
    },
    SET_DONG_LIST(state, dongs) {
      console.log(dongs);
      for (let i = 1; i < dongs.length; i++) {
        state.dongs.push({ value: dongs[i].dongCodeVal, text: dongs[i].dongName });
      }
    },
    SET_APT_LIST(state, houses) {
      state.houses = houses;
    },
    SET_DONG_CODE(state, dongCode) {
      state.dongCode = dongCode;
    },
    SET_APT_ITEM(state, house) {
      state.house = house;
      console.log("house => ", state.house);
    },
    SET_IS_LOGIN(state, isLogin) {
      state.isLogin = isLogin;
    },
    SET_IS_LOGIN_ERROR(state, isLoginError) {
      state.isLoginError = isLoginError;
    },
    SET_IS_VALID_TOKEN(state, isValidToken) {
      state.isValidToken = isValidToken;
    },
    SET_USER_INFO(state, userInfo) {
      state.isLogin = true;
      state.userInfo = userInfo;
    },
    SET_SEARCH_NAVER_NEWS(state, news) {
      state.newslist = news;
    },
    SET_TOTAL_DONG_APT_COUNT(state, dongAptCount) {
      state.dongAptCount = dongAptCount;
    },
    SET_TOP_THREE_APT(state, threeApt) {
      console.log(threeApt);
      state.threeApt = threeApt;
    },
  },
  actions: {
    getSidoList({ commit }) {
      console.log("Sido index.js 넘어옴");
      http
        .get("house/sido")
        .then((resp) => {
          console.log("index.js 넘어옴", resp.data);
          commit("SET_SIDO_LIST", resp.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },

    getGugunList({ commit }, sidoCodeVal) {
      console.log("Gugun index.js 넘어옴");
      http
        .get("house/gugun?sido=" + sidoCodeVal)
        .then((resp) => {
          commit("SET_GUGUN_LIST", resp.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },

    getDongList({ commit }, { sidoCodeVal, gugunCodeVal }) {
      console.log("Dong index.js 넘어옴");
      http
        .get("house/dong?sido=" + sidoCodeVal + "&gugun=" + gugunCodeVal)
        .then((resp) => {
          commit("SET_DONG_LIST", resp.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },

    getAptList({ commit }, { sidoCodeVal, gugunCodeVal, dongCodeVal }) {
      console.log("House index.js 넘어옴");
      http
        .get("house/list?sido=" + sidoCodeVal + "&gugun=" + gugunCodeVal + "&dong=" + dongCodeVal)
        .then((resp) => {
          commit("SET_APT_LIST", resp.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },

    getDongCode({ commit }, { sidoCodeVal, gugunCodeVal, dongCodeVal }) {
      console.log("DongCode index.js 넘어옴");
      http
        .get("house/dongCode?sido=" + sidoCodeVal + "&gugun=" + gugunCodeVal + "&dong=" + dongCodeVal)
        .then((resp) => {
          console.log("호출 후 찍힌 값", resp.data);
          commit("SET_DONG_CODE", resp.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },

    getTotalDongAptCount({ commit }, dongCode) {
      console.log("vuex 넘어옴 total dong apt count");
      http
        .get("house/totalDongAptCount?dongCode=" + dongCode)
        .then((resp) => {
          commit("SET_TOTAL_DONG_APT_COUNT", resp.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },

    getTop3AptList({ commit }, dongCode) {
      http
        .get("house/top3AptList?dongCode=" + dongCode)
        .then((resp) => {
          commit("SET_TOP_THREE_APT", resp.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },

    async userLogin({ commit }, user) {
      console.log("id, pw넘어옴.");
      await http
        .post("user/login?uid=" + user.uid + "&upw=" + user.upw)
        .then((resp) => {
          if (resp.data.message === "success") {
            let accessToken = resp.data["access-token"];
            let refreshToken = resp.data["refresh-token"];
            // console.log("store/index.js 에서 login success token created!!!! >> ", accessToken, refreshToken);

            ///////////////////////////////////isLogin 변경 전
            // console.log("store/index.js에서 변경 전 isLogin : ", this.state.isLogin);
            /////////////////////////////////////isLogin 변경 후
            commit("SET_IS_LOGIN", true);
            // console.log("store/index.js에서 변경 후 isLogin : ", this.state.isLogin); ////////////////true로 바뀌는거 확인함. ////////////여기까지는 잘 됨.

            commit("SET_IS_LOGIN_ERROR", false);
            commit("SET_IS_VALID_TOKEN", true);
            sessionStorage.setItem("access-token", accessToken);
            sessionStorage.setItem("refresh-token", refreshToken);
          } else {
            commit("SET_IS_LOGIN", false);
            commit("SET_IS_LOGIN_ERROR", true);
            commit("SET_IS_VALID_TOKEN", false);
          }
        })
        .catch((error) => {
          console.log("로그인에러남!!!!!!!!!!!!!!!");
          console.log(error);
        });
    },
    async getUserInfo({ commit, dispatch }, token) {
      let decodeToken = jwtDecode(token);
      console.log("2. getUserInfo() decodeToken :: ", decodeToken);
      http.defaults.headers["access-token"] = sessionStorage.getItem("access-token");
      await http.get("user/userinfo?uid=" + decodeToken.uid).then(
        (resp) => {
          if (resp.data.message === "success") {
            commit("SET_USER_INFO", resp.data.userInfo);
            console.log("3. getUserInfo data >> ", resp.data);
          } else {
            console.log("유저 정보 없음!!!!");
          }
        },
        async (error) => {
          console.log("getUserInfo() error code [토큰 만료되어 사용 불가능.] ::: ", error.status);
          commit("SET_IS_VALID_TOKEN", false);
          await dispatch("tokenRegeneration");
        }
      );
    },
    async tokenRegeneration({ commit, state }) {
      let _this = this;
      console.log("토큰 재발급 >> 기존 토큰 정보 : {}", sessionStorage.getItem("access-token"));
      http.defaults.headers["refresh-token"] = sessionStorage.getItem("refresh-token"); //axios header에 refresh-token 셋팅
      await http
        .post("user/refresh", JSON.stringify(state.userInfo))
        .then((resp) => {
          if (resp.data.message === "success") {
            let accessToken = resp.data["access-token"];
            console.log("재발급 완료 >> 새로운 토큰 : {}", accessToken);
            sessionStorage.setItem("access-token", accessToken);
            commit("SET_IS_VALID_TOKEN", true);
          }
        })
        .catch(async (error) => {
          // HttpStatus.UNAUTHORIZE(401) : RefreshToken 기간 만료 >> 다시 로그인!!!!
          if (error.response.status === 401) {
            console.log("갱신 실패");
            // 다시 로그인 전 DB에 저장된 RefreshToken 제거.
            await http
              .get(`user/logout/${_this.state.userInfo.uid}`)
              .then((resp) => {
                if (resp.data.message === "success") {
                  console.log("리프레시 토큰 제거 성공");
                } else {
                  console.log("리프레시 토큰 제거 실패");
                }
                alert("RefreshToken 기간 만료!!! 다시 로그인해 주세요.");
                commit("SET_IS_LOGIN", false);
                commit("SET_USER_INFO", null);
                commit("SET_IS_VALID_TOKEN", false);
                router.push({ name: "login" });
              })
              .catch((error) => {
                console.log(error);
                commit("SET_IS_LOGIN", false);
                commit("SET_USER_INFO", null);
              });
          }
        });
    },
    async userLogout({ commit }, uid) {
      await http.get(`user/logout/${uid}`).then(
        (resp) => {
          if (resp.data.message === "success") {
            commit("SET_IS_LOGIN", false);
            commit("SET_USER_INFO", null);
            commit("SET_IS_VALID_TOKEN", false);
            window.open("/", "_self");
          } else {
            console.log("유저 정보 없음!!!!");
          }
        },
        (error) => {
          console.log(error);
        }
      );
    },

    getAptItem({ commit }, aptCode) {
      console.log("HouseItem index.js 넘어옴");
      console.log("AptCode", aptCode);
      http
        .get("house/detail?aptcode=" + aptCode)
        .then((resp) => {
          console.log(resp.data);
          commit("SET_APT_ITEM", resp.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },

    userSignUp({ commit }, user) {
      console.log(commit);
      /////////////////////vuex로 비동기처리
      console.log(JSON.stringify(user));
      http
        .post("user/signup", JSON.stringify(user))
        .then((resp) => {
          console.log(resp.data);
          if (resp.data === "success") {
            alert("회원가입 성공");
            router.push({ path: "/" });
          } else {
            alert("ID 또는 PW를 다시 확인해주세요.");
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },

    searchNaverNews({ commit }, payload) {
      http.get("naver/news?keyword=" + payload).then(({ data }) => {
        console.log(data);
        commit("SET_SEARCH_NAVER_NEWS", data.items);
      });
    },

    async userModify({ commit }, payload) {
      console.log(payload);
      commit("SET_USER_INFO", payload);
      await http
        .put("user/modify", payload)
        .then((resp) => {
          console.log("응답", resp.data);
          if (resp.data == "success") {
            alert("회원정보 수정 성공");
            router.push({ path: "/user/myPage" });
          } else {
            alert("회원 정보를 다시 확인해주세요.");
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },

  modules: {},
});
