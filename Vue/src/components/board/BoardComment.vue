<template>
  <div>
    <!----------------댓글 입력  start------------------>
    <hr />
    <v-row style="width: 95%; margin: 0 auto; margin-top: 40px">
      <v-text-field
        v-model="ccontent"
        outlined
        rows="1"
        row-height="20"
        placeholder="댓글을 남겨주세요."
        type="text"
        @keydown.enter.prevent="btnCommentWrite"
        color="#FF6445"
        clearable
      >
        <template v-slot:prepend>
          <img
            id="img-logo"
            src="@/assets/smile.png"
            width="30px"
            height="100%"
            style="margin-right: 10px; margin-top: -5px"
          />
        </template>
        <template v-slot:append>
          <b @click="btnCommentWrite" class="grey--text">입력</b>
        </template>
      </v-text-field>
    </v-row>
    <!----------------댓글 입력  end------------------>

    <!--------------댓글 가져오는 부분 start----------------->
    <v-row
      v-for="(comment, idx) in comments"
      :key="idx"
      align="center"
      class="px-2"
    >
      <v-col cols="1" align-self="center" style="text-align: right">
        <img src="@/assets/sun.png" width="40px" alt="" />
      </v-col>

      <v-col cols="11">
        <v-row justify="space-between">
          <v-col>
            <h5>{{ comment.commentwriter }}</h5>
          </v-col>
          <v-col align-self="end" style="text-align: end">
            <span>{{ comment.commentdate }}</span>
          </v-col>
        </v-row>
        <v-row justify="space-between">
          <v-col>
            <p style="color: ">{{ comment.commentcontent }}</p>
          </v-col>
          <!-----------------------------삭제버튼 start---------------------------->
          <v-col
            style="text-align: end"
            v-if="userInfo.uid == comment.commentwriter"
          >
            <v-row justify="end">
              <img
                src="@/assets/trash-bin.png"
                style="width: 60px"
                @click="commentDelete(comment.commentno)"
              />
            </v-row>
          </v-col>
          <!-----------------------------삭제버튼 end---------------------------->
        </v-row>
      </v-col>
      <v-divider />
    </v-row>

    <!--------------댓글 가져오는 부분 end----------------->
  </div>
</template>

<script>
import axios from "axios";
import { mapState } from "vuex";

export default {
  data() {
    return {
      bno: 0,
      cwriter: "",
      ccontent: "",
      comments: [],
      initial: "",
      dialog: false,
    };
  },
  created() {
    this.getComment();
  },
  computed: {
    ...mapState(["userInfo"]),
  },
  methods: {
    ////////////////////////댓글달기 버튼 눌렀을 때 실행
    btnCommentWrite() {
      let _this = this;
      axios({
        method: "POST",
        url: "http://localhost:8888/homes/board/comment",
        data: {
          boardno: this.$route.params.boardno,
          commentwriter: this.userInfo.uid,
          commentcontent: _this.ccontent,
        },
      }).then((resp) => {
        console.log("Comment Write result : ", resp.data);
        _this.getComment();
      });
      _this.cwriter = "";
      _this.ccontent = "";
      console.log(this.$route.params.boardno);
    },
    ///////////////////////////////댓글 가져오는 메소드
    getComment() {
      // let _this = this;
      axios({
        method: "get",
        url:
          "http://localhost:8888/homes/board/comment?bno=" +
          this.$route.params.boardno,
      }).then((resp) => {
        console.log("Comment Component created", resp.data);
        this.comments = resp.data;
      });
    },
    ///////////////////댓글 삭제 dialog창에서 예 눌렀을 때 실행되는 메소드
    commentDelete(commentno) {
      if (confirm("정말 삭제하시겠습니까?")) {
        axios({
          method: "delete",
          url:
            "http://localhost:8888/homes/board/comment?commentno=" + commentno,
        })
          .then((resp) => {
            console.log(resp.data);
            this.getComment();
          })
          .catch((error) => {
            console.log(error);
          });
        alert("삭제 완료되었습니다.");
      }
    },
  },
};
</script>

<style>
</style>