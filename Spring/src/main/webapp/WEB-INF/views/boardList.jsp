<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<%@ include file="./common/nav.jsp" %>
	<div id="container" style="margin: 50px 20px 50px 20px">
		<div>
			<ul id="boardTypeSelect" class="nav nav-tabs">
			  <li class="nav-item">
			    <a id="btnBoardTypeNormal" data-toggle="tab" class="nav-link active" href="${root}/view/board?boardType=normal">전체 게시판</a>
			  </li>
			  <li class="nav-item">
			    <a id="btnBoardTypeRealEstate" data-toggle="tab" class="nav-link" href="${root}/view/board?boardType=realEstate">홍보 게시판</a>
			  </li>
			</ul>
		</div>
		
		<table id="table" class="table table-hover" style="margin-top: 20px;">
			<thead>
			<tr class="table-light">
				<th>no.</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			</thead>
			<tbody id="boardList" class="table-group-divider">
			<tr>
		        <td colspan="5">작성된 게시글이 없습니다.</td>
		     </tr>
			</tbody>
		</table>
		<div id="div-page"></div>
		<div style="text-align: right;"><button type="submit" class="btn btn-dark" style="margin-top:10px" onclick="location.href='${root}/view/write?uid=${loginUser.uid}&boardType=${param.boardType }'">글 작성하기</button></div>
	</div>
	
   <script type="text/javascript"> 
      function getPage(page) {
        if (!page) page = 1;
        
        let data = fetch("${root}/board/list?page=" + page + "&boardType=${param.boardType}")
          .then((resp) => resp.json())
          .then((data) => {
            console.log(data);
            // 맨 위 tr 빼고 그 아래 싹 다 지운 다음 새로운 목록 보여주기!
             document.querySelectorAll("tr:not(:first-child)").forEach((e) => e.remove());
            
            
            let tbody = ``;
            for (let i = 0; i < data.boardList.length; i++) {
              let board = data.boardList[i];
              console.log(board);
              
              tbody += `
                  <tr>
                    <th scope="row">\${board.boardno}</th>
                    <td><a href="${root}/view/detail?bno=\${board.boardno}">\${board.boardtitle}</a></td>
                    <td>\${board.boardwriter}</td>
                    <td>\${board.boarddate}</td>
                  </tr>
              `;
            }
             document.querySelector("#boardList").innerHTML = tbody;

            let divPage = document.getElementById("div-page");
            divPage.innerHTML = "";
            if (data.startPage > 1) {
              let before = document.createElement("a");
              before.innerText = "[이전]";
              before.setAttribute("href", "#");
              before.setAttribute("id", "a-before");
              before.setAttribute("onclick", "getPage(" + (data.startPage - 1) + ")");
              divPage.appendChild(before);
            }

            for (let i = data.startPage; i <= data.endPage; i++) {
              let page = document.createElement("a");
              page.innerText = "[" + i + "]";
              page.setAttribute("href", "#");
              page.setAttribute("id", "a-before");
              page.setAttribute("onclick", "getPage(" + i + ")");
              divPage.appendChild(page);
            }

            if (data.endPage < data.totalPage) {
              let after = document.createElement("a");
              after.innerText = "[다음]";
              after.setAttribute("href", "#");
              after.setAttribute("id", "a-after");
              after.setAttribute("onclick", "getPage(" + (data.end + 1) + ")");
              divPage.appendChild(after);
            }
          });
      }
      getPage();
    </script>
<%@ include file="./common/footer.jsp" %>
</body>
</html>