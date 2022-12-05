<template>
  <div>
    <v-container fluid grid-list-xl>
      <v-layout wrap align-center elevation="8">
        <div style="width: 70%; margin: 0 auto">
          <!------------------------게시판 TAB start-------------------------------->
          <v-tabs
            height="70px"
            v-model="tab"
            grow
            background-color="white"
            color="#FF6445"
            slider-color="tomato"
            style="margin-top: 50px"
          >
            <v-tab
              v-for="item in items"
              :key="item.tab"
              @click="getBoard(item, page)"
            >
              <h5>
                <b>{{ item.tab }}</b>
              </h5>
            </v-tab>
          </v-tabs>

          <!------------------------게시판 TAB end-------------------------------->
          <v-tabs-items v-model="tab">
            <v-tab-item v-for="(item, idx) in items" :key="idx" eager>
              <v-flex xs12 order-sm4 d-flex flex-row-reverse>
                <v-btn
                  @click="write(item)"
                  style="
                    margin-bottom: 20px;
                    margin-top: 10px;
                    margin-right: 20px;
                  "
                  ><b
                    ><img
                      id="img-logo"
                      src="@/assets/edit.png"
                      width="25px"
                      height="100%"
                    />
                    글 작성하기</b
                  ></v-btn
                >
              </v-flex>
              <v-card class="pa-3" outlined>
                <!------------------------게시판 리스트 start-------------------------------->
                <v-simple-table id="board-list" fluid align="center">
                  <template v-slot:default>
                    <colgroup>
                      <v-col style="width: 10%" />
                      <v-col style="width: 50%" />
                      <v-col style="width: 15%" />
                      <v-col style="width: 10%" />
                      <v-col style="width: 15%" />
                    </colgroup>
                    <thead>
                      <tr>
                        <th class="text-center font-weight-bold">
                          <span class="head-span">#</span>
                        </th>
                        <th class="text-center font-weight-bold">
                          <span class="head-span">제목</span>
                        </th>
                        <th class="text-center font-weight-bold">
                          <span class="head-span">작성자</span>
                        </th>
                        <th class="text-center font-weight-bold">
                          <span class="head-span">작성일</span>
                        </th>
                      </tr>
                    </thead>
                    <tbody class="text-center" ref="boardList">
                      <tr
                        v-for="(board, idx) in boards"
                        :key="idx"
                        v-on:click="titleClick(board.boardno)"
                      >
                        <td>{{ board.boardno }}</td>
                        <td>
                          {{ board.boardtitle }}
                        </td>
                        <td>{{ board.boardwriter }}</td>
                        <td>{{ board.boarddate }}</td>
                      </tr>
                    </tbody>
                  </template>
                </v-simple-table>
                <!------------------------게시판 리스트 end-------------------------------->
              </v-card>
              <!------------------------Pagination start-------------------------------->
              <div
                class="text-center"
                style="margin-top: 10px; margin-bottom: 10px"
              >
                <v-pagination
                  v-model="page"
                  :length="pages.totalPage"
                  :total-visible="6"
                  @input="getPagination(page, item)"
                  circle
                  color="#FF6445"
                  light
                ></v-pagination>
              </div>
              <!------------------------Pagination end-------------------------------->
            </v-tab-item>
          </v-tabs-items>
        </div>
      </v-layout>
    </v-container>
  </div>
</template>

<script>
import axios from "axios";
import { mapState } from "vuex";
export default {
  data() {
    return {
      boards: "",
      pages: [],
      tab: null,
      items: [
        { tab: "일반", content: "normal" },
        { tab: "부동산 홍보", content: "realEstate" },
      ],
      boardType: "",
      currentTab: 0,
      page: 1,
    };
  },
  created() {
    let num = 1;
    this.getBoard({ content: "normal" }, num);
  },
  computed: {
    ...mapState(["userInfo"]),
  },
  methods: {
    ///////////////////////////////////////////////////////////게시판 상세조회
    titleClick(boardno) {
      this.$router.push({ path: "/board/view/" + boardno });
    },
    ////////////////////////////////////////////////////////////게시판 탭 눌렀을 때 실행
    getBoard(boardType, page) {
      let _this = this;
      console.log(boardType.content);
      axios({
        method: "get",
        url:
          "http://localhost:8888/homes/board/list?page=" +
          page +
          "&boardType=" +
          boardType.content,
      }).then((resp) => {
        console.log("BoardList Component created", resp.data);
        _this.boards = resp.data.boardList;

        _this.pages = {
          startPage: resp.data.startPage,
          totalPage: resp.data.totalPage,
          endPage: resp.data.endPage,
          currPage: resp.data.currPage,
        };
        // _this.pages = resp.date;
        console.log(_this.pages);
      });
    },
    ////////////////////////////////////////////////////////////페이지 번호 눌렀을 때 실행
    getPagination(page, boardType) {
      console.log(this.page);
      this.getBoard(boardType, page);
    },
    ////////////////////////////////////////////////////////////글 작성하기 버튼 눌렀을 때 실행
    write(boardType) {
      /////boardType.content가 realEstate고 사용자 타입이 normal 인 경우 홍보 게시판에 글을 작성할 수 없도록 하기
      if (
        boardType.content == "realEstate" &&
        this.userInfo.utype != "realEstate"
      ) {
        alert("부동산 홍보 게시판에 글을 작성할 수 없는 계정입니다.");
      }
      /////////////boardType이 normal 이거나 부동산 관련 종사자이면서 boardType.content가 realEstate인 경우
      else {
        this.$router.push({ path: "/board/write/" + boardType.content });
      }
    },
  },
};
</script>

<style scoped>
.head-span {
  font-size: 15px;
}

#board-list {
  padding: 0 20px 0 20px;
}
</style>