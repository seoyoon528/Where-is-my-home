import Vue from "vue";
import VueRouter from "vue-router";
import AppMain from "@/views/AppMain.vue";
import AppBoard from "@/views/AppBoard.vue";
import BoardListItem from "@/components/board/BoardListItem.vue";
import HouseDeal from "@/components/house/HouseDeal.vue";
import BoardWrite from "@/components/board/BoardWrite.vue";
import UserLogin from "@/components/user/UserLogin.vue";
import store from "@/store";
import HouseDealDetail from "@/components/house/HouseDealDetail.vue";
import AppUser from "@/views/AppUser.vue";
import SignUp from "@/components/user/SignUp.vue";
import MyPage from "@/components/user/MyPage.vue";
import BoardUpdate from "@/components/board/BoardUpdate.vue";
import UserModify from "@/components/user/UserModify.vue";

Vue.use(VueRouter);

const onlyAuthUser = async (to, from, next) => {
  const checkUserInfo = store.getters["checkUserInfo"];
  const checkToken = store.getters["checkToken"];
  let token = sessionStorage.getItem("access-token");
  console.log("로그인 처리 전", checkUserInfo, token);

  if (checkUserInfo != null && token) {
    console.log("토큰 유효성 체크하러 가자!!!!");
    await store.dispatch("getUserInfo", token);
  }
  if (!checkToken || checkUserInfo === null) {
    alert("로그인이 필요한 페이지입니다..");
    // next({ name: "login" });
    router.push({ name: "userLogin" });
  } else {
    console.log("로그인 했다!!!!!!!!!!!!!.");
    next();
  }
};

const routes = [
  {
    path: "/",
    name: "main",
    component: AppMain,
  },
  {
    path: "/board",
    name: "board",
    component: AppBoard,
    redirect: "/board/list",
    children: [
      {
        path: "list",
        name: "boardList",
        component: () => import("@/components/board/BoardList"),
      },
      {
        path: "write/:boardtype",
        name: "boardWrite",
        beforeEnter: onlyAuthUser,
        component: BoardWrite,
      },
      {
        path: "view/:boardno",
        name: "boardListItem",
        beforeEnter: onlyAuthUser,
        component: BoardListItem,
      },
      {
        path: "boardUpdate/:boardno",
        name: "boardUpdate",
        beforeEnter: onlyAuthUser,
        component: BoardUpdate,
      },
    ],
  },
  {
    path: "/houseDeal",
    name: "houseDeal",
    component: HouseDeal,
  },
  {
    path: "/user",
    name: "user",
    component: AppUser,
    redirect: "/user/userLogin",
    children: [
      {
        path: "userLogin",
        name: "userLogin",
        component: UserLogin,
      },
      {
        path: "signUp",
        name: "signUp",
        component: SignUp,
      },
      {
        path: "myPage",
        name: "myPage",
        component: MyPage,
      },
      {
        path: "userModify",
        name: "userModify",
        component: UserModify,
      },
    ],
  },
  {
    path: "/houseDealDetail/:aptCode",
    name: "houseDealDetail",
    component: HouseDealDetail,
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
