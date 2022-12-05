<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="./common/nav.jsp" %>

<form id="sendModify">
<div class="container p-4">
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">ID</span>
  <input type="text" class="form-control" name = "uid" aria-label="UserID" aria-describedby="basic-addon1" value="${loginUser.uid}" disabled/>
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">PASSWORD</span>
  <input type="password" class="form-control" name = "upw" placeholder="${loginUser.upw}" aria-label="UserPassword" aria-describedby="basic-addon1">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">이름</span>
  <input type="text" class="form-control" name = "uname" placeholder="${loginUser.uname}" aria-label="Username" aria-describedby="basic-addon1">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">주소</span>
  <input type="text" class="form-control" name = "uaddr" placeholder="${loginUser.uaddr}" aria-label="UserAddress" aria-describedby="basic-addon1">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">사용자 타입</span>
  <input type="text" class="form-control" name = "utype" aria-label="UserID" aria-describedby="basic-addon1" value="${loginUser.utype}" disabled/>
</div>
<!-- unum으로 회원정보를 수정해서 hidden값으로 같이 넘겨줌 -->
<input type="hidden" name="unum" value="${loginUser.unum}"/>
<div style="text-align:center"><input type="button" class="btn btn-dark" style="margin-top: 10px" value="수정하기" id="btn-modify"></input></div>
</div>
</form>

<%@ include file="./common/footer.jsp" %>

<script type="text/javascript">

//수정하기 버튼 눌렀을 때
document.getElementById('btn-modify').onclick = async function(){
	
	let sendForm = document.getElementById('sendModify');
	let formData = new FormData(sendForm);
	let url = '${root}/user/modify';
	
	let resp = await fetch(url, {
		method:'PUT',
		body: formData,
	});
	
	let result = await resp.text();
	
	if(result=="success"){
		console.log(result);
		alert("수정 성공!!")
		location.href="${root}/"
	}
	else{
		console.log(result);
		alert("ID나 PW를 확인해주세요.");
	}
}

</script>
</body>
</html>