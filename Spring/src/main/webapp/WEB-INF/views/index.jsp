<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>FindHomes</title>
</head>
<body>
<%@ include file="./common/nav.jsp" %>
<div style="text-align: center; margin-bottom: 200px;">
    <!-- 메인 로고 & 버튼 -->
    <div id="main-container">
        <div id="main-logo" style="margin-top: 180px;">
            <h1 class="display-2" style="font-weight: bold;">구해줘 HOMES</h1>
            <h4 style="color: rgb(143, 143, 143);">전국 아파트 매매 실거래 조회 서비스</h3>
        </div>
        <div id="btn-index" style="margin-top: 50px;">
            <button id = "btnSearch" type="button" class="btn btn-secondary btn-lg" style="font-weight:bold;">실거래 조회</button>
            <button id = "btnCommunity" type="button" class="btn btn-secondary btn-lg" style="margin-left:20px; font-weight:bold;" onclick="location.href='${root}/view/board?boardType=normal'">커뮤니티</button>
        </div>    
    </div>
    
    <!-- 아파트 실거래 조회  -->
    <div id="apt-search" class="container" style="margin-top: 100px; visibility:hidden;">
        <div class="row col-md-12 justify-content-center mb-2">
            <div class="form-group col-md-2">
                <select class="form-select" id="sido">
                    <option value="">시 / 도</option>
                </select>
            </div>
            <div class="form-group col-md-2">
                <select class="form-select" id="gugun">
                    <option value="">구 / 군</option>
                </select>
            </div>
            <div class="form-group col-md-2">
                <select class="form-select" id="dong">
                    <option value="">동</option>
                </select>
            </div>
            <div class="form-group col-md-2">
                <button type="button" class="btn btn-outline-secondary" id="getBtn" style="font-weight:bold; padding: 5px 25px 5px 25px">조회</button>
            </div>
        </div>

        <div class="container" style="margin-top: 20px;">
            <div class="row">
                <!--지도 영역 start -->
                <div class="col-8">
                    <div id="map" style="width: 100%; height: 400px"></div>
                </div>
                <!--지도 영역 end -->
                
                <div class="col-4">
                    <!--정보 부분 start-->
                    <div>
                        <div class="row">
                            <div class="col" id="aptInfo">
                                <div data-bs-spy="scroll" data-bs-target="#list-example"
                                    data-offset="0" class="scrollspy-example">
                                    <ul class="list-group list-group-flush" id="aptList">
                                    	<li id="firstMsg" class="list-group-item" style="color:red;">시/도, 구/군, 동을 먼저 선택해주세요!</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--정보 부분 end-->
                </div>
            </div>
        </div>
    </div>

    <!-- 지도 영역 -->
    <script>
        var mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5, // 지도의 확대 레벨
        };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
        if (navigator.geolocation) {
          // GeoLocation을 이용해서 접속 위치를 얻어옵니다
          navigator.geolocation.getCurrentPosition(function (position) {
            var lat = position.coords.latitude, // 위도
              lon = position.coords.longitude; // 경도

            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
              message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);
          });
        } else {
          // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

          var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
            message = "geolocation을 사용할수 없어요..";

          displayMarker(locPosition, message);
        }
    	

        // 지도에 마커와 인포윈도우를 표시하는 함수입니다
        function displayMarker(locPosition, message) {
          // 마커를 생성합니다
          var marker = new kakao.maps.Marker({
            map: map,
            position: locPosition,
          });

          var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

          // 인포윈도우를 생성합니다
          var infowindow = new kakao.maps.InfoWindow({
            content: iwContent,
            removable: iwRemoveable,
          });

          // 인포윈도우를 마커위에 표시합니다
          infowindow.open(map, marker);

          // 지도 중심좌표를 접속위치로 변경합니다
          map.setCenter(locPosition);
        }
    	
      </script>
    <!--지도 영역 end -->
</div>
<%@ include file="./common/footer.jsp" %>
</body>

<script>
	let btnSearch = document.getElementById("btnSearch");
   	let aptSearchDiv = document.getElementById("apt-search");
   	btnSearch.addEventListener("click", function() {
		if (aptSearchDiv.style.visibility !== 'hidden') {
			aptSearchDiv.style.visibility = 'hidden';
		}
		else {
			aptSearchDiv.style.visibility = 'visible';
			aptSearchDiv.scrollIntoView();
			
		}
	})
	
    window.onload = async function(){
        let response = await fetch("house/sido");
        let data = await response.json();
        console.log(data);
        let temp="<option>시 / 도 </option>";
        for(let i = 0; i < data.length; i++){
            temp += "<option >" + data[i].sidoName + "</option>";
        }
        document.getElementById("sido").innerHTML = temp;
    }
    
    let SIDO = document.getElementById("sido");
    SIDO.addEventListener("change", async function(){
    	let firstMsg = document.querySelector("#firstMsg");
    	if (firstMsg.style.visibility !== 'hidden') {
    		firstMsg.style.visibility = 'hidden';
    	}
    	
        let sidoVal =this[this.selectedIndex].value;
        console.log("sidoVal : " + sidoVal);
        let response = await fetch("house/gugun?sido="+sidoVal);
        let data = await response.json();
        console.log(data);
        let temp="<option>구 / 군</option>";
        for(let i = 1; i < data.length; i++){
            temp += "<option >" + data[i].gugunName + "</option>";
        }
        document.getElementById("gugun").innerHTML = temp;
    })
    let GUGUN = document.getElementById("gugun");
    GUGUN.addEventListener("change", async function(){
        let sidoVal =SIDO[SIDO.selectedIndex].value;
        let gugunVal =this[this.selectedIndex].value;
        let response = await fetch("house/dong?sido="+sidoVal+"&gugun="+gugunVal);
        let data = await response.json();
        console.log(data);
        let temp="<option>동</option>";
        for(let i = 1; i < data.length; i++){
            temp += "<option >" + data[i].dongName + "</option>";
        }
        document.getElementById("dong").innerHTML = temp;
    })
    
    let getBTN = document.getElementById("getBtn");
    let lats=[];
    let lngs=[];
    
    getBTN.addEventListener("click", async function(){
		lats=[];
		lngs=[];
        let sidoVal =SIDO[SIDO.selectedIndex].value;
        let gugunVal =GUGUN[GUGUN.selectedIndex].value;
        let DONG = document.getElementById("dong");
        let dongVal = DONG[DONG.selectedIndex].value;
        let response = await fetch("house/list?sido="+sidoVal+"&gugun="+gugunVal+"&dong="+dongVal);
        let data = await response.json();
        console.log("apt를 가져왔나요...?")
        console.log(data);
        let INFO = document.getElementById("aptList");
    
        let temp = ``;
        if(data.length > 0){
        for(let i = 0; i < data.length; i++){
            let item = data[i];
            console.log(item.aptCode);
            temp+= `
                <li class= "list-group-item" style="text-align:center; padding: 10px;">
                  <h6><a href="${root}/view/detail?aptcode=\${item.aptCode}" style="font-weight:bold;">\${item.apartmentName}</a></h6>
                  <div style="margin-top : 20px; ">도로명: \${item.roadName}</div>
                  <div>건축년도: \${item.buildYear}</div>
                  <button type="button" class="btn btn-danger btn-sm" onclick="likeClick(\${item.aptCode})" style="margin: 15px 0 15px 0;">좋아요</button>
                </li>
              `
            lats.push(item.lat);
            lngs.push(item.lng);
        }
        INFO.innerHTML = temp;
        let apt_info = document.querySelector("#aptInfo");
          apt_info.setAttribute("style", "border: 2px solid rgb(143, 143, 143); width:100%; height:400px; overflow:scroll");
      
        //마커이미지
        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
    
        for (let i = 0; i < lats.length; i++) {
    
            // 마커 이미지의 이미지 크기 입니다
            var imageSize = new kakao.maps.Size(24, 35);
    
            // 마커 이미지를 생성합니다    
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
    
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map : map, // 마커를 표시할 지도
                position : new kakao.maps.LatLng(lats[i], lngs[i]), // 마커를 표시할 위치
                title : 'hi', // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage
            // 마커 이미지 
            });
        }
        var locPosition = new kakao.maps.LatLng(lats[0], lngs[0]); //좋아요 목록 첫번째 아파트의 위치 지정
        map.setCenter(locPosition); // 지도 중심좌표를 지정한 곳으로 변경
    
        // 지도에 확대 축소 컨트롤을 생성한다
        var zoomControl = new kakao.maps.ZoomControl();
    
        // 지도의 우측에 확대 축소 컨트롤을 추가한다
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        
        } else {
        INFO.innerHTML = `<li class="list-group-item" style="color: red;">등록된 아파트 거래정보가 없습니다.</li>`;
        }
    })
    async function likeClick(code){
        console.log(code);
        let response = await fetch("user?action=like&aptcode="+code);
        let data = await response.text();
        console.log(data);
        if(data == "-1"){
            alert("로그인 먼저 해주세요!!");
        }
    }
</script>
</html>