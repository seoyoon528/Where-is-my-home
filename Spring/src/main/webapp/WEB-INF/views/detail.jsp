<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="./common/header.jsp" %>
  </head>
  <body>
    <%@ include file="./common/nav.jsp" %> <%-- 페이지만의 내용 --%>
    <div class="container p-4">
      <div>
        <div class="card" style="padding: 20px">
          <h5 class="card-header">아파트 정보</h5>
          <div class="card-body">
            <h4 class="card-title" id="aptName">${houseInfo.apartmentName }</h4>
            <ul class="list-group list-group-flush" style="margin-top: 20px">
              <li class="list-group-item">
                건축년도 : <span id="aptBuildYear">${houseInfo.buildYear }</span>
              </li>
              <li class="list-group-item">
                도로명 주소 : <span id="aptSido">${dongCode.sidoName}</span>
                <span id="aptGugun">${dongCode.gugunName}</span>
                <span id="aptDong">${dongCode.dongName}</span>
                <span id="aptRoadName">${houseInfo.roadName }</span>
              </li>
            </ul>
            <a id="naverSearch" class="btn btn-primary" style="float: right">검색 결과 보기</a>
            <a id="naverAgencySearch" class="btn btn-warning" style="float: right; margin-right: 10px">주변 부동산 보기</a>
          </div>
        </div>
      </div>
      <!-- 	apart 정보 끝	 -->
      <div>
        <table class="table table-striped" style="margin-top: 30px">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">층</th>
              <th scope="col">면적</th>
              <th scope="col">거래 금액</th>
              <th scope="col">거래 일자</th>
            </tr>
          </thead>
          <tbody id="dealList">
            <!-- <c:forEach items="${dealList }" var="d">
              <c:set var="num" value="${num+1 }"></c:set>
              <tr>
                <th scope="row">${num }</th>
                <td>${d.floor }층</td>
                <td>${d.area }</td>
                <td>${d.dealAmount }</td>
                <td>${d.dealYear }.${d.dealMonth }.${d.dealDay }</td>
              </tr>
            </c:forEach> -->
          </tbody>
        </table>
      </div>
    </div>
    <script type="text/javascript">
      async function readDetail() {
        console.log("${param.aptcode}");
        let response = await fetch("${root}/house/detail?aptcode=${param.aptcode}");
        let data = await response.json();
        console.log(data.dongCode);
        console.log(data.dealList);
        console.log(data.houseInfo);

        // 아파트 정보	//
        document.getElementById("aptName").innerText = data.houseInfo.apartmentName;
        document.getElementById("aptBuildYear").innerText = data.houseInfo.buildYear;
        document.getElementById("aptSido").innerText = data.dongCode.sidoName;
        document.getElementById("aptGugun").innerText = data.dongCode.gugunName;
        document.getElementById("aptDong").innerText = data.dongCode.dongName;
        document.getElementById("aptRoadName").innerText = data.houseInfo.roadName;
        document.getElementById("naverAgencySearch").href =  
	       	"https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=" +
	        data.dongCode.sidoName +
	        " " +
	        data.dongCode.gugunName +
	        " " +
	        data.dongCode.dongName +
	        " 부동산";
        document.getElementById("naverSearch").href =
          "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=" +
          data.dongCode.sidoName +
          " " +
          data.dongCode.gugunName +
          " " +
          data.dongCode.dongName +
          " " +
          data.houseInfo.roadName;

        // 매매 정보 List //
        let tbody = ``;
        let idx = 1;
        data.dealList.forEach(function (d) {
          console.log(d);
          tbody += `
              <tr>
                <th scope="row">\${idx}</th>
                <td>\${d.floor}층</td>
                <td>\${d.area}</td>
                <td>\${d.dealAmount}</td>
                <td>\${d.dealYear}.\${d.dealMonth}.\${d.dealDay}</td>
              </tr>
          `;
          idx++;
        });

        document.querySelector("#dealList").innerHTML = tbody;
      }

      readDetail();
    </script>
  </body>
</html>
