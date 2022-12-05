<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./common/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%@ include file="./common/nav.jsp" %>
<div id="container" style="margin: 50px 20px 50px 20px">
		<div>
			<ul id="boardTypeSelect" class="nav nav-tabs">
			  <li class="nav-item">
			    <a id="btnBoardTypeNormal" class="nav-link active" data-toggle="tab" aria-current="page" href="${root}/view/board?boardType=normal">전체 게시판</a>
			  </li>
			  <li class="nav-item">
			    <a id="btnBoardTypeRealEstate" class="nav-link" data-toggle="tab"" href="${root}/view/board?boardType=realEstate">홍보 게시판</a>
			  </li>
			</ul>
		</div>
		
		<table id="table" class="table table-hover" style="margin-top: 20px;">
			<colgroup>
		        <col style="width: 10%" />
		        <col style="width: 10%" />
		        <col style="width: 10%" />
    		    <col style="width: 40%" />
      	        <col style="width: 10%" />     
		        <col style="width: 20%" />
	        </colgroup>
			<tr class="table-light" height="10">
				<th >no.</th>
				<td id="boardno">${board.bno}</td>
			
				<th>작성자</th>
				<td id="boardwriter">${board.boardwriter}</td>
				
				<th>작성일</th>
				<td id="boarddate">${board.boarddate}</td>
			</tr>
			<tr class="table-group-divider" height="15">
				<th>제목</th>
				<td colspan="5" id="boardtitle">${board.boardtitle}</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td id="boardcontent" colspan="5">${board.boardcontent}</td>
			</tr>
		</table>
		<div style="text-align: right;"><button type="button" class="btn btn-dark" style="margin-top:10px" onclick="location.href='${root}/view/board'">게시판 목록</button></div>		
		
		<div>
			<table id="comments" border="1">
				<tr>
					<td>작성된 댓글이 없습니다.</td>
				</tr>
			</table>
			<form id="sendForm">
				<input type="hidden" id="send-boardno" name="boardno">
				<input type="hidden" name="commentwriter" value="${ loginUser.uid }">
				<input type="text" name="commentcontent" placeholder="댓글 내용">
			</form>
			<button id="sendComment">댓글 작성</button>
		</div>
		
	</div>

	<script type="text/javascript">	
	let boardno = ${param.bno};
	
	async function getDetail() {	
		console.log(${param.bno} + " 넘어옴");
		let response = await fetch("${root}/board/read?bno=" + ${param.bno});
		let data = await response.json();
	
		document.getElementById("boardno").innerText = data.boardno;
		document.getElementById("boardtitle").innerText = data.boardtitle;
		document.getElementById("boardwriter").innerText = data.boardwriter;
		document.getElementById("boarddate").innerText = data.boarddate;
		document.getElementById("boardcontent").innerHTML = data.boardcontent;
	}
	
	async function getComments() {
		let response = await fetch("${root}/board/comment?bno=" + boardno);
		let data = await response.json();
		console.log('응답 데이터', data);
		
		if (data.length > 0) {
			let comments = '';
			for (let i = 0; i < data.length; i++) {
				comments += '<tr>';
				comments += '<td>' + data[i].commentwriter + '</td>';
				comments += '<td>' + data[i].commentcontent + '</td>';
				comments += '<td>' + data[i].commentdate + '</td>';
				comments += '</tr>';
			}
			document.getElementById('comments').innerHTML = comments;
		} 
	}
	
	getDetail();
	getComments();
	
	document.getElementById('sendComment').onclick = async function() {
		let url = '${root}/board/comment';
		
		document.getElementById('send-boardno').value = boardno;
		let sendForm = document.getElementById("sendForm");		
        let formData = new FormData(sendForm);
		console.log(formData);
        
		let response = await fetch(url, {
			method:"POST",
			body: formData,
 		});
		
		let result = await response.text();
		console.log('댓글쓰기 결과', result);
		getComments();	// 방금 댓글 하나 썼으니까 댓글 추가된 것 까지 다시 데이터 받아와서 뿌리기
	}
	</script>
<%@ include file="./common/footer.jsp" %>
</body>
</html>