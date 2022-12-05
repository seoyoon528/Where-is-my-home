<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<%@ include file="./common/nav.jsp" %>

<div style="text-align: center; margin-top:70px">
<div style="display: inline-block; text-align: center">
<ul class="list-group list-group-horizontal-md" style="width: 500px">
  <li class="list-group-item" style="width: 500px"><b>회원 번호</b></li>
  <li class="list-group-item" id="unum" style="width: 500px"><b></b></li>
</ul>

<ul class="list-group list-group-horizontal-md"  style="width: 500px">
  <li class="list-group-item" style="width: 500px"><b>이름</b></li>
  <li class="list-group-item" id="uname" style="width: 500px"><b></b></li>
</ul>
<ul class="list-group list-group-horizontal-md"  style="width: 500px">
  <li class="list-group-item" style="width: 500px"><b>아이디</b></li>
  <li class="list-group-item" id="uid" style="width: 500px">${loginUser.uid}</li>
</ul>
<ul class="list-group list-group-horizontal-md"  style="width: 500px">
  <li class="list-group-item" style="width: 500px"><b>주소</b></li>
  <li class="list-group-item" id="uaddr" style="width: 500px"><b></b></li>
</ul>
<ul class="list-group list-group-horizontal-md"  style="width: 500px">
  <li class="list-group-item" style="width: 500px"><b>사용자 타입</b></li>
  <li class="list-group-item" id="utype" style="width: 500px"><b></b></li>
</ul>
</div>
</div>
<div style="text-align: center"><button type="submit" class="btn btn-dark" style="margin-top:50px" onclick="location.href='${root}/view/modify?unum=${loginUser.unum}'">회원 정보 수정하기</button></div>

<script type="text/javascript">
	
	//회원정보 창에 들어가자마자 바로 비동기로 회원정보를 가져오게 하는 비동기 함수
	async function getUserInfo(){
		let resp = await fetch('${root}/user/userinfo?unum=${param.unum}');
		let data = await resp.json();
		
		console.log(data.uid);
		let unum = document.getElementById('unum');
		unum.innerText = data.unum;

		let uname = document.getElementById('uname');
		uname.innerText = data.uname;
		
		let uid = document.getElementById('uid');
		uid.innerText = data.uid;
		console.log(uid);

		let uaddr = document.getElementById('uaddr');
		uaddr.innerText = data.uaddr;
		
		let utype = document.getElementById('utype');
		if(data.utype=="normal"){
			utype.innerText = "일반사용자";
		}else{
			utype.innerText = "부동산 관련 종사자";
		}
	}
	getUserInfo();

	
</script>

<%@ include file="./common/footer.jsp" %>
</body>
</html>