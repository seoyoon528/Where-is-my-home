<template>
  <div>
    <v-container fluid grid-list-xl>
      <v-layout wrap align-center elevation="8">
        <div style="width: 60%; margin: 0 auto; margin-top: 100px">
          <!-----------------------제목 start--------------------------->
          <h2 style="text-align: center">WRITE</h2>
          <v-flex xs10 d-flex style="margin: 0 auto; margin-top: 20px">
            <v-text-field
              v-model="subject"
              placeholder="제목을 입력해주세요."
              height="70px"
              clearable
              class="writeTitle"
              ref="title"
            ></v-text-field>
          </v-flex>
          <!-----------------------제목 end--------------------------->
          <!-----------------------내용 start--------------------------->
          <v-row>
            <v-col cols="12" md="1"></v-col>
            <v-col cols="12" md="10">
              <ckeditor
                :editor="editor"
                v-model="editorData"
                :config="editorConfig"
              />
              <!-- <div id="editor"></div> -->
            </v-col>
            <v-col cols="12" md="1"></v-col>
          </v-row>

          <v-row>
            <v-col style="text-align: center">
              <v-btn
                @click="btnWrite"
                class="white--text"
                rounded
                color="rgba(255, 100, 69, 1)"
                style="
                  padding-top: 9px;
                  justify-content: center;
                  text-align: center;
                  font-size: 14px;
                "
                ><h6 style="font-family: JejuGothic">작성하기</h6>
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
  name: "CKEditor",
  components: {
    ckeditor: CKEditor.component,
  },
  data: () => ({
    editor: ClassicEditor,
    editorData: "",
    editorConfig: {
      // The configuration of the editor.
      language: "ko",
      ckfinder: {
        // Upload the images to the server using the CKFinder QuickUpload command.
        uploadUrl:
          "https://ckeditor.com/apps/ckfinder/3.5.0/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json",
        withCredentials: true,
        // Define the CKFinder configuration (if necessary).
        options: {
          resourceType: "Images",
        },
      },
    },

    articleno: 0,
    userid: "",
    subject: "",
    content: "",
    msg: "",
    valid: true,
  }),
  computed: {
    ...mapState(["userInfo"]),
  },
  methods: {
    btnWrite() {
      let _this = this;
      let err = true;
      let msg = "";
      !_this.subject &&
        ((msg = "제목을 입력해주세요"),
        (err = false),
        this.$refs.title.focus());
      if (!err) alert(msg);
      else {
        console.log(this.$route.params.boardtype);
        axios({
          method: "POST",
          url: "http://localhost:8888/homes/board/",
          data: {
            boardtype: this.$route.params.boardtype,
            boardtitle: _this.subject,
            boardwriter: this.userInfo.uid,
            boardcontent: _this.editorData,
          },
        }).then((resp) => {
          console.log("BoardList Component created", resp.data);
          this.$router.push({ path: "/board" });
        });
      }
    },
  },
};
</script>

<style scoped>
.ck-content {
  min-height: 180px;
}
.writeTitle {
  font-size: 2.5ch;
}
</style>