<template>
  <div>
    <v-container fluid grid-list-xl>
      <v-layout wrap align-center elevation="8">
        <div style="width: 60%; margin: 0 auto; margin-top: 100px">
          <!-----------------------제목 start--------------------------->
          <h2 style="text-align: center">수정</h2>
          <v-flex xs10 d-flex style="margin: 0 auto; margin-top: 20px">
            <v-text-field
              v-model="board.boardtitle"
              placeholder="${board.boardtitle}"
              height="70px"
              clearable
              class="writeTitle"
            ></v-text-field>
          </v-flex>
          <!-----------------------제목 end--------------------------->
          <!-----------------------내용 start--------------------------->
          <v-row>
            <v-col cols="12" md="1"></v-col>
            <v-col cols="12" md="10">
              <ckeditor
                :editor="editor"
                v-model="board.boardcontent"
                :config="editorConfig"
              />
            </v-col>
            <v-col cols="12" md="1"></v-col>
          </v-row>

          <v-row>
            <v-col style="text-align: center">
              <v-btn
                :disabled="!valid"
                variant="primary"
                color="primary"
                dark
                class="m-1"
                @click="btnUpdate"
                style="justify-content: center; text-align: center"
                rounded
              >
                <div>수정하기</div>
              </v-btn>
            </v-col>
          </v-row>
          <!-----------------------내용 end--------------------------->
        </div>
      </v-layout>
    </v-container>
  </div>
</template>

<script>
import axios from "axios";
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";
import CKEditor from "@ckeditor/ckeditor5-vue";
import { mapState } from "vuex";
export default {
  components: {
    ckeditor: CKEditor.component,
  },

  data() {
    return {
      board: {},
      editor: ClassicEditor,
      editorData: "",
      editorConfig: {
        // The configuration of the editor.
        //height: "500px",
        language: "ko",
        // Upload the images to the server using the CKFinder QuickUpload command.
        uploadUrl:
          "https://ckeditor.com/apps/ckfinder/3.5.0/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json",
        withCredentials: true,
        // Define the CKFinder configuration (if necessary).
        options: {
          resourceType: "Images",
        },
      },
      subject: "",
      content: "",
      valid: true,
    };
  },
  created() {
    console.log("receive params", this.$route.params.boardno);
    this.findboard(this.$route.params.boardno);
  },
  computed: {
    ...mapState(["userInfo"]),
  },
  methods: {
    //////////////////////////게시글 정보 가져오는 메소드
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
        // //boardcontent html태그 적용시키기
        // let content = this.board.boardcontent;
        // document.getElementById("content").innerHTML = content;
      });
    },
    /////////////////////////수정하기 버튼 눌렀을 때 실행되는 메소드
    btnUpdate() {
      axios({
        method: "PUT",
        url: "http://localhost:8888/homes/board/",
        data: {
          boardno: this.$route.params.boardno,
          boardtitle: this.board.boardtitle,
          boardwriter: this.userInfo.uid,
          boardcontent: this.board.boardcontent,
        },
      })
        .then((resp) => {
          console.log("게시글 수정 결과", resp.data);
          alert("게시글 수정을 완료하였습니다.");
          this.$router.push({ path: "/board" });
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>

<style>
.ck-content {
  min-height: 180px;
}
.writeTitle {
  font-size: 2.5ch;
}
</style>