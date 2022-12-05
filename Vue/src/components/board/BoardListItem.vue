<template>
  <div>
    <div style="width: 60%; margin: 0 auto; margin-top: 30px">
      <!----게시판 종류 보여주기 start------>
      <v-row style="margin-top: 100px" justify="center" class="gray--text">
        <h6>
          {{ isShow }}
        </h6>
      </v-row>
      <!----게시판 종류 보여주기 end------>

      <!----제목 보여주기 start------>
      <v-row style="margin-top: 25px" justify="center">
        <h1>
          <b>{{ board.boardtitle }}</b>
        </h1>
      </v-row>
      <v-divider />
      <!----제목 보여주기 end------>

      <div>
        <!-- <v-col cols="12" md="2"> -->

        <!----------아바타, 작성자, 작성일 보여주기 start----->
        <v-row style="margin-top: 30px" no-gutters>
          <v-col class="d-inline-flex">
            <v-row>
              <v-col
                align="center"
                width="40"
                class="d-inline-flex"
                sm="1"
                d-flex
              >
                <v-avatar color="#7D8F56" size="40" class="white--text"
                  ><h4>{{ initial }}</h4></v-avatar
                >
              </v-col>

              <v-col sm="9">
                <v-row>
                  <h5 style="color: rgb(140, 140, 140)">
                    {{ board.boardwriter }}
                  </h5>
                </v-row>
                <v-row>
                  <h6>{{ userInfo.uaddr }}</h6>
                </v-row>
              </v-col>
            </v-row>
          </v-col>
          <v-col sm="2">
            <h6>{{ board.boarddate }}</h6>
          </v-col>
        </v-row>
        <v-divider />
        <!----------아바타, 작성자, 작성일 보여주기 end----->

        <!----------------- 내용 보여주기 start---------->

        <v-row style="margin-top: 50px; margin-left: 40px">
          <v-sheet min-height="300px">
            <h6 v-html="board.boardcontent"></h6>
          </v-sheet>
        </v-row>
        <!----------------- 내용 보여주기 end---------->
      </div>

      <!------------ 수정, 삭제 버튼 start ------------->
      <v-row
        class="d-flex flex-row-reverse mb-3"
        v-if="userInfo.uid == board.boardwriter"
      >
        <v-btn
          color="#FFA07A"
          outlined
          small
          fab
          dark
          class="ml-2"
          @click="boardDelete"
        >
          <v-img src="@/assets/trash.png" width="20" height="100%"></v-img>
        </v-btn>

        <v-btn
          color="success"
          outlined
          small
          fab
          light
          @click="boardUpdate"
          v-if="userInfo.uid == board.boardwriter"
        >
          <v-img src="@/assets/wrench.png" width="20" height="100%"></v-img>
        </v-btn>
      </v-row>
      <!------------ 수정, 삭제 버튼 end ------------->

      <board-comment></board-comment>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import axios from "axios";
import BoardComment from "@/components/board/BoardComment.vue";
export default {
  components: {
    BoardComment,
  },
  data() {
    return {
      board: {},
      initial: "",
      isShow: "",
      dialog: false,
    };
  },
  computed: {
    ...mapState(["userInfo"]),
  },
  created() {
    console.log("receive params", this.$route.params.boardno);
    this.findboard(this.$route.params.boardno);
  },
  methods: {
    findboard(boardno) {
      axios({
        method: "get",
        url: "http://localhost:8888/homes/board/read?bno=" + boardno,
      }).then((resp) => {
        console.log("BoardListItem Component created", resp.data);
        this.board = resp.data;

        ///////boardwriter에서 이니셜 추출
        this.initial = this.board.boardwriter.substr(0, 1);

        if (this.board.boardtype == "normal") {
          this.isShow = "일반 게시판";
        }
        if (this.board.boardtype == "realEstate") {
          this.isShow = "부동산 홍보 게시판";
        }
        console.log("로그인 한 사용자 아이디: ", this.userInfo.uid);
      });
    },

    //////////////////////////////삭제버튼 눌렀을 때 호출하는 메소드
    boardDelete() {
      //////로그인 id랑 게시글 작성자가 다른 경우
      if (confirm("정말 삭제하시겠습니까?")) {
        axios({
          method: "delete",
          url:
            "http://localhost:8888/homes/board?boardno=" +
            this.$route.params.boardno,
        })
          .then((resp) => {
            console.log(resp.data);
            this.$router.push({ path: "/board" });
          })
          .catch((error) => {
            console.log(error);
          });
      }
    },
    /////////////////////////////수정버튼 눌렀을 때 호출하는 메소드
    boardUpdate() {
      if (this.userInfo.uid !== this.board.boardwriter) {
        alert("게시글 작성자만 수정할 수 있습니다.");
      }
      //////로그인 id랑 게시글 작성자가 같은 경우
      else {
        this.$router.push({
          path: "/board/boardUpdate/" + this.$route.params.boardno,
        });
      }
    },
  },
};
</script>

<style>
</style>
