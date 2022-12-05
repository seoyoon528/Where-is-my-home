import axios from "axios";

export default axios.create({
  baseURL: "http://localhost:8888/homes/",
  headers: {
    // Front -> Back으로 보내는 데이터 형식 (파일 업로드 기능이 있는 경우 Header setting하면 안됌!!)
    "Content-Type": "application/json;charset=utf-8",
  },
});
