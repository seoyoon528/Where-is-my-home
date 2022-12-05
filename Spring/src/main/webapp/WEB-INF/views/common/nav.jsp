<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- bootstrap 사용을 위한 link -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<!-- nav 시작 -->
<nav class="navbar navbar-expand-lg" style="background-color:rgb(39, 50, 56);">
	
		
		<div class="collapse navbar-collapse container-fluid justify-content-between" id="navbarText" style="margin-right: 80px">
			
		<ul class="navbar-nav">
		<div class="container-fluid">
			<a class="navbar-brand text-white" style="margin-left: 30px" href="${root}"><b>구해줘 HOMES</b></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarText" aria-controls="navbarText"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		</ul>
			
			<ul class="navbar-nav" style="align-items: center">

				<!-- ------------------login 한 경우 start------------------------------- -->
				<c:if test="${not empty sessionScope.loginUser}">
				<li class="nav-item text-white" style="margin-right: 15px">안녕하세요 <b>${loginUser.uname}</b>(${loginUser.uid})님 </li>	
				<li class="nav-item" style="padding-right: 15px"><a class="nav-link text-white" href="#" onclick="logout()"><b>Logout</b></a></li>
				<li class="nav-item" style="padding-right: 15px"><a class="nav-link text-white" href="${root}/view/userdetail?unum=${loginUser.unum}"><b>회원정보</b></a></li>
				</c:if>
				<!-- ------------------login 한 경우 end------------------------------- -->
				
			 	
			
				<!---------------------------- login 안 한 경우 start-------------------------- -->
				<c:if test="${empty sessionScope.loginUser}">
					<li class="nav-item" style="padding-right: 15px"><a class="nav-link text-white" data-bs-toggle="modal" data-bs-target="#loginModal" href="loginModal"><b>LogIn</b></a></li>
					<li class="nav-item" style="padding-right: 15px"><a class="nav-link text-white" href="${root}/view/signup" ><b>SignUp</b></a>
					</li>
				</c:if>
				
				 <!---------------------------------- 로그인 Modal start -------------------------------->
				<form id="sendLogin">
			    <div class="modal fade" id="loginModal" data-bs-backdrop="static" tabindex="-1">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title">로그인</mark></h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">

					            <div class="mb-3">
					              <label for="uid" class="form-label">아이디 : </label>
					              <input
					                type="text"
					                class="form-control"
					                id="uid"
					                name="uid"
					                placeholder="아이디"
					              />
					            </div>
					            <div id="idcheck-result"></div>
					            <div class="mb-3">
					              <label for="upw" class="form-label">비밀번호 : </label>
					              <input
					                type="password"
					                class="form-control"
					                id="upw"
					                name="upw"
					                placeholder="비밀번호"
					              />
					            </div>
			            
					      </div>
					      <div class="modal-footer">
					      	<input type="button" id="btn-login" class="btn btn-outline-primary" value="로그인"></button>
					        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal"><b>닫기</b></button>
					      </div>
					    </div>
					  </div>
					</div>
					
				</form>
				 <!---------------------------------- 로그인 Modal end -------------------------------->
				<!---------------------------- login 안 한 경우 end-------------------------- -->
			</ul>
				
			
		</div>
		
		<script type="text/javascript">
		
		//로그인 버튼 눌렀을 때 
		document.getElementById('btn-login').onclick = async function(){
			
			let sendForm = document.getElementById('sendLogin');
			let formData = new FormData(sendForm);
			let url = '${root}/user/login';
			
			let resp = await fetch(url, {
				method:'POST',
				body: formData,
			});
			
			let result = await resp.text();
			
			if(result=="success"){
				console.log(result);
				alert("로그인 성공");
				location.href="${root}/"
			}
			else{
				console.log(result);
				alert("ID나 PW를 확인해주세요.");
			}
		}
		
		//로그아웃 버튼 눌렀을 때
		async function logout(){
			let resp = await fetch('${root}/user/logout');
			let data = await resp.text();
			
			if(data=="success"){
				location.href="${root}/"
			}
		}
		</script>
</nav>