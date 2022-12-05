<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%@ include file="./common/nav.jsp" %>

<form id="sendForm" >
<div class="container p-4">
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">ID</span>
  <input type="text" class="form-control" name = "uid" placeholder="UserID" aria-label="UserID" aria-describedby="basic-addon1">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">PASSWORD</span>
  <input type="password" class="form-control" name = "upw" placeholder="Password" aria-label="UserPassword" aria-describedby="basic-addon1">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">이름</span>
  <input type="text" class="form-control" name = "uname" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
</div>
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">주소</span>
  <input type="text" class="form-control" name = "uaddr" placeholder="UserAddress" aria-label="UserAddress" aria-describedby="basic-addon1">
</div>
<select class="form-select" aria-label="Default select example" name="utype">
  <option selected>사용자 타입을 선택하세요</option>
  <option value="normal">일반사용자</option>
  <option value="realEstate">부동산 관련 종사자</option>
</select>

<div style="text-align:center"><input type="button" class="btn btn-dark" style="margin-top: 10px" id="btn-signup" value="가입하기"></input></div>
</div>
</form>

<%@ include file="./common/footer.jsp" %>

<script type="text/javascript">
	
	//가입하기 버튼 눌렀을 때
	document.getElementById('btn-signup').onclick = async function(){
		
		let sendForm = document.getElementById('sendForm');
		let formData = new FormData(sendForm);
		let url = '${root}/user/signup';
		
		let resp = await fetch(url, {
			method:'POST',
			body: formData,
		});
		
		let result = await resp.text();
		
		if(result=="success"){
			console.log(result);
			alert("회원가입 성공");
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