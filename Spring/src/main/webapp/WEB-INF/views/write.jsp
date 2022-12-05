<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="./common/header.jsp" %>
	<script src="https://cdn.ckeditor.com/ckeditor5/35.2.1/classic/ckeditor.js"></script>
  </head>

	<body>
	<%@ include file="./common/nav.jsp" %>
      <div class="row justify-content-center">
	   	<form id="sendForm">
		<table class="table">
			<td><input type="hidden" name="boardtype" value="${ param.boardType }"></td>			
			<td><input type="hidden" name="boardwriter" value="${ loginUser.uid }"></td>
			<tr>
				<th>제목</th>
				<td><input type="text" name="boardtitle"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><div id="editor"><input type="hidden" id="content" name="boardcontent"></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" id="btn-send" class="btn btn-dark" value="작성 완료">
				</th>
			</tr>	
		</table>
		</form>
	</div>
		
	<script>
	// 글 작성 시 CK 에디터 사용
	console.log("${param.boardType}")
	let editor;
    ClassicEditor
        .create( document.querySelector( '#editor' ))
        .then(newEditor=>{
        	editor = newEditor;
        })
        .catch( error => {
            console.error( error );
        } );
	
	document.getElementById("btn-send").onclick = async function () {
		document.getElementById('content').value = editor.getData(); 
		let sendForm = document.getElementById("sendForm");
        let formData = new FormData(sendForm);
        let url = "${root}/board";
		console.log(formData);
        
        let resp = await fetch(url, {
          method: "POST",
          body: formData,
        }); // 비동기 요청해서 응답 받기
        console.log(resp);
        
        let result = await resp.text(); // 응답에서 텍스트 (or JSON) 추출하기
        alert(result);		// success or error
        
         if (result == "success") {
 			console.log("왔다!")
         	location.href="${root}/view/board";
          }
      };
	</script>
	<%@ include file="./common/footer.jsp" %>
	</body>
	</html>