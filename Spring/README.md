# ๐ฉํ๋ก์ ํธ ์๊ฐ

---

### โ๏ธย **ํ๋ก์ ํธ ๋ช**

- ๊ตฌํด์ค ํ์ฆ(WhereIsMyHome): ์ ๊ตญ ์ํํธ ๋งค๋งค ์ค๊ฑฐ๋ ์กฐํ ์๋น์ค

### โ๏ธย **ํ๋ก์ ํธ ์ค๋ช**

- Spring Framework์ RestAPI๋ฅผ ํ์ฉํ์ฌ ์น ์๋ฒ๋ฅผ ๊ตฌ์ถํ๊ณ  myBatis Framework๋ฅผ ํ์ฉํ์ฌ DB๋ฅผ ์ฐ๋ํ๋ ํ๋ก์ ํธ์ด๋ค.

- ์นด์นด์ค Map API์ ๊ณต๊ณต ๋ฐ์ดํฐ ํฌํธ์ ์ํํธ ๋งค๋งค ์ค๊ฑฐ๋ ๋ฐ์ดํฐ๋ฅผ ํ์ฉํด ๊ธฐ๋ฅ์ ์ ๊ณตํ๋ค.

- ์ ๊ตญ์ ์ํํธ ๋งค๋งค ์ค๊ฑฐ๋ ๋ด์ญ ๋ฐ์ดํฐ๋ฅผ ๊ด๋ฆฌํ๊ณ , ์ฌ์ฉ์๊ฐ ์ํ๋ ์ง์ญ์ ๊ฒ์ํ  ์ ์๋๋ก ํ๋ค.

- ์ฌ์ฉ์๊ฐ ์ ํํ ์ง์ญ(๋)์ ์ํํธ ๋ฆฌ์คํธ๋ฅผ ์ง๋์ ํจ๊ป ๋ณด์ฌ์ฃผ๊ณ  ์ํํธ ์ด๋ฆ์ ํด๋ฆญ ์ ์ํํธ ์์ธ์ ๋ณด์ ๋งค๋งค ์๋ฃ๋ฅผ ํ์ด๋ธ ํํ๋ก ๋ณด์ฌ์ฃผ๋ฉฐ, ๋ฒํผ์ ๋๋ฅด๋ฉด ๋ค์ด๋ฒ์์ ์ํํธ๋ฅผ ๊ฒ์ํ ๊ฒฐ๊ณผ๋ฅผ ๋ณด์ฌ์ค๋ค.

- ๋ก๊ทธ์ธ์ ํด์ผ๋ง ๊ฒ์ํ์ ๊ธ์ ์ ์ ์ ์์ผ๋ฉฐ, ์ฌ์ฉ์๋ ๊ณ์  ์ ๋ณด๋ฅผ ์์ , ์ญ์ ํ  ์ ์๋ค. ๊ฒ์ํ ๊ธฐ๋ฅ์ ์ ๊ณตํ์ฌ ์๋น์ค ์ด์ฉ์ ๊ฐ์ ์์ ๋ก์ด ์ปค๋ฎค๋์ผ์ด์์ด ๊ฐ๋ฅํ๋ค.

### โ๏ธย **ํ๋ก์ ํธ ์ผ์ **

2022-11-02

### โ๏ธย **ํ์**

- **[ํฉ์ ์ฃผ](https://github.com/wjdwn03)**
- **[๋ฐ์์ค](https://github.com/seoyoon528)**

## ๐ ๋ชฉํ

---

- Spring Framework์ RestAPI๋ฅผ ํ์ฉํ์ฌ ์น ์๋ฒ๋ฅผ ๊ตฌ์ถํ  ์ ์๋ค.
- myBatis Framework๋ก DB๋ฅผ ์ฐ๋ํ์ฌ ์ ์ง๋ณด์์ฑ์ ๋์ผ ์ ์๋ค.
- ์๊ตฌ ์ฌํญ์ ๋ถ์ํ๊ณ  DB ๋ชจ๋ธ๋ง์ ํ  ์ ์๋ค.

## โญย ํ๋ก์ ํธ ๊ธฐ๋ฅ

---

### โ๏ธ ํ์ ๊ตฌํ ๊ธฐ๋ฅ

1. **์ฃผํ ์ค๊ฑฐ๋๊ฐ ์ ๋ณด ์์ง**
    - `**house` DB๋ฅผ ์์ฑํ ํ houseinfo, housedeal, dongcode, user, board, interest_info ํ์ด๋ธ์ ์์ฑํ๋ค.**
    - **๊ตญํ ๊ตํต๋ถ ๋งค๋งค ์ค๊ฑฐ๋๊ฐ ์ ๋ณด ๋ฐ์ดํฐ ๊ฐ๊ณต ํ DB ์ ์ฅ**
    - **โController - Service - Mapper - DTOโ๋ฅผ ๊ฑฐ์ณ์ INSERT, UPDATE, SELECT, DELETE๋ฅผ ์ํํ๊ณ  ๊ทธ ๊ฒฐ๊ณผ๋ฅผ DB์ ์ ์ฉ์ํค๊ฑฐ๋ jsp๋ฅผ ํตํด ํ๋ฉด์ผ๋ก ๋ณด์ฌ์ค๋ค.**
    
2. **์ฃผํ ์ค๊ฑฐ๋๊ฐ ๊ฒ์**
    - **์ ํํ ์ง์ญ์ ์ํํธ ๊ฑฐ๋ ์ ๋ณด ์กฐํ**
    
    - **์ด๊ธฐ ํ๋ฉด**
        
        ![Untitled](src/main/webapp/WEB-INF/img/Untitled.png)
        
    
    - ์ค๊ฑฐ๋ ์กฐํ ๋ฒํผ ํด๋ฆญ์ ์ค๊ฑฐ๋ ์กฐํ ๊ธฐ๋ฅ์ด display ๋๋ฉฐ ํ์ด์ง์ ์คํฌ๋กค์ด ์ด๋ํด ํฌ์ปค์ค๊ฐ ํ๋จ ์นด์นด์ค map์ผ๋ก ๋ง์ถฐ์ง๋ค.
    
   ![Untitled](src/main/webapp/WEB-INF/img/Untitled 1.png)
    
   ![Untitled](src/main/webapp/WEB-INF/img/Untitled 2.png)
    
    - **`์ค๊ฑฐ๋์กฐํ(btnSearch)`๋ฅผ ํด๋ฆญํ์๋ง์ ๋น๋๊ธฐ๋ก โ์๋โ ์ ๋ณด๋ฅผ ๊ฐ์ ธ์จ๋ค.**
        
        โ index.jsp์์ ๋น๋๊ธฐ ํต์ ์ ํ๋ค.
        
        โ **HouseServlet(action=โsidoโ) - HouseService(getSido()) - HouseDao(getSido()) - DB(dongcode ํ์ด๋ธ)** ์์๋๋ก ๋ค์ด๊ฐ์ โ์๋โ ์ ๋ณด๋ฅผ ๊ฐ์ ธ์จ๋ค.
        
    - **โ์๋โ ์ ๋ณด๊ฐ ์ ํ๋๋ฉด ์ ํ๋ ๊ฐ์ ๋ฐ๋ผ โ๊ตฌ๊ตฐโ์ ๋ณด๋ฅผ ๊ฐ์ ธ์จ๋ค.**
        
        โ index.jsp์์ โ์๋โ์ ๋ณด๊ฐ ์ ํ๋๋ฉด(change ์ด๋ฒคํธ ๋ฐ์) ๋น๋๊ธฐ ํต์ ์ ํ๋ค.
        
        โ **HouseController(action=โgugunโ) - HouseService(getGugun()) - HouseMapper(getGugun()) - DB(dongcode ํ์ด๋ธ)** ์์๋๋ก ๋ค์ด๊ฐ์ โ๊ตฌ๊ตฐโ ์ ๋ณด๋ฅผ ๊ฐ์ ธ์จ๋ค. ์ด๋, ์ ํ๋ โ์๋โ ๊ฐ์ด ํ์ํ๊ธฐ ๋๋ฌธ์ ํ๋ผ๋ฏธํฐ๋ก ๋๊ฒจ์ค์ผ ํ๋ค.
        
    - **โ๊ตฌ๊ตฐโ ์ ๋ณด๊ฐ ์ ํ๋๋ฉด ์ ํ๋ ๊ฐ์ ๋ฐ๋ผ โ๋โ์ ๋ณด๋ฅผ ๊ฐ์ ธ์จ๋ค.**
        
        โ index.jsp์์ โ๊ตฌ๊ตฐโ์ ๋ณด๊ฐ ์ ํ๋๋ฉด(change ์ด๋ฒคํธ ๋ฐ์) ๋น๋๊ธฐ ํต์ ์ ํ๋ค.
        
        โ **HouseController(action=โdongโ) - HouseService(getDong()) - HouseMapper(getDong()) - DB(dong ํ์ด๋ธ)** ์์๋๋ก ๋ค์ด๊ฐ์ โ๋โ ์ ๋ณด๋ฅผ ๊ฐ์ ธ์จ๋ค. ์ด๋, ์ ํ๋ โ์๋โ ๊ฐ๊ณผ โ๊ตฌ๊ตฐโ๊ฐ์ด ํ์ํ๊ธฐ ๋๋ฌธ์ ํ๋ผ๋ฏธํฐ๋ก ๋๊ฒจ์ค์ผ ํ๋ค.
        
    - **โ์กฐํ(getBtn)โ ๋ฒํผ์ ๋๋ฅด๋ฉด ๋น๋๊ธฐ๋ก ์ ํ๋ ์, ๊ตฌ๊ตฐ, ๋์ โ์ํํธ ๋ชฉ๋กโ์ ๊ฐ์ ธ์ค๊ณ  ์นด์นด์ค map์ ๋ง์ปค๋ก ์ํํธ ์์น๋ฅผ ํ์ํด์ค๋ค.**
        
        โ index.jsp์์ โ์กฐํ(getBtn)โ ๋ฒํผ์ด ๋๋ฆฌ๋ฉด(click ์ด๋ฒคํธ ๋ฐ์ ) ๋น๋๊ธฐ ํต์ ์ ํ๋ค.
        
        โ **HouseController(action=โlistโ) - HouseService(getApts()) - HouseMapper(getApts()) - DB(houseinfo ํ์ด๋ธ)** ์์๋๋ก ๋ค์ด๊ฐ์ โ์ํํธ ๋ชฉ๋กโ์ ๊ฐ์ ธ์จ๋ค. 
        
        โ ๋์ด์จ ์ํํธ ๋ชฉ๋ก์ ๋ฆฌ์คํธ ํํ๋ก ๋ณด์ฌ์ค๋ค.
        
 ![Untitled](src/main/webapp/WEB-INF/img/Untitled 3.png)
        
    
*  **์ํํธ ๋ช์ ํด๋ฆญํ๋ฉด ์ํํธ ์์ธ์ ๋ณด ํ์ด์ง๋ก ๋์ด๊ฐ houseinfo ํ์ด๋ธ์ ํด๋น aptCode๋ฅผ ๊ฐ์ง ์ํํธ์ ์์ธ์ ๋ณด๋ฅผ ๋ถ๋ฌ์จ๋ค.**

 ``` jsx
        async function readDetail() {
                console.log("${param.aptcode}");
                let response = await fetch("${root}/house/detail?aptcode=${param.aptcode}");
                let data = await response.json();
        
                // ์ํํธ ์ ๋ณด	//
                document.getElementById("aptName").innerText = data.houseInfo.apartmentName;
                document.getElementById("aptBuildYear").innerText = data.houseInfo.buildYear;
                document.getElementById("aptSido").innerText = data.dongCode.sidoName;
                document.getElementById("aptGugun").innerText = data.dongCode.gugunName;
                document.getElementById("aptDong").innerText = data.dongCode.dongName;
                document.getElementById("aptRoadName").innerText = data.houseInfo.roadName;
                document.getElementById("naverSearch").href =
                  "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=" +
                  data.dongCode.sidoName +
                  " " +
                  data.dongCode.gugunName +
                  " " +
                  data.dongCode.dongName +
                  " " +
                  data.houseInfo.roadName;
 ```
        
    
*  **houseInfo์์ ๊ฐ์ ธ์จ dongcode ๋ฐ์ดํฐ๋ฅผ ์ด์ฉํด dongCode ํ์ด๋ธ์์ ์ํํธ์ ๋๋ก๋ช ์ฃผ์๋ฅผ ๊ฐ์ ธ์ค๋ฉฐ dealList ํ์ด๋ธ์์ ์ ๋ฌ๋ฐ์ aptCode์ ์ผ์นํ๋ ์ํํธ ๋งค๋งค ์ ๋ณด ๋ชฉ๋ก์ ๋ชจ๋ ๊ฐ์ ธ์ ํ๋ฉด์ ๋ณด์ฌ์ค๋ค.**
        
 ```jsx
        // ๋งค๋งค ์ ๋ณด List //
                let tbody = ``;
                let idx = 1;
                data.dealList.forEach(function (d) {
                  console.log(d);
                  tbody += `
                      <tr>
                        <th scope="row">\${idx}</th>
                        <td>\${d.floor}์ธต</td>
                        <td>\${d.area}</td>
                        <td>\${d.dealAmount}</td>
                        <td>\${d.dealYear}.\${d.dealMonth}.\${d.dealDay}</td>
                      </tr>
                  `;
                  idx++;
                });
        
                document.querySelector("#dealList").innerHTML = tbody;
              }
```
        
    
*  **๊ฐ์ ธ์จ ๋ชจ๋  ๋ฐ์ดํฐ๋ฅผ ์ขํฉํ์ฌ ์ํํธ ์ด๋ฆ, ๊ฑด์ถ๋๋, ๋๋ก๋ช์ฃผ์, ์ํํธ ๊ฒ์ ๋ฒํผ์ ๋ณด์ฌ์ฃผ๊ณ  ํด๋น ์ํํธ์ ๊ฑฐ๋ ๋ชฉ๋ก์ ํ์ด๋ธ๋ก ๋ณด์ฌ์ค๋ค.**
    
![Untitled](src/main/webapp/WEB-INF/img/Untitled 4.png)
    

1. **ํ์ ๊ด๋ฆฌ**
- **ํ์ ๊ฐ์**
    
โ ๋ฉ์ธ ํ์ด์ง ์๋จ์ SignUp๋ฒํผ์ ๋๋ฅด๋ฉด `UserController`์์ `signup.jsp`๋ก ๋๊ฒจ์ค๋ค.
    
```java
    //ํ์๊ฐ์
    	@GetMapping("/signup")
    	public String signup() {
    		return "signup";
    	} 
```
    
โโ`**๊ฐ์ํ๊ธฐ**`โ ๋ฒํผ์ ๋๋ฅด๋ฉด signup.jsp์์ ์๋ ฅํ ๋ฐ์ดํฐ๋ค์ POST๋ฐฉ์์ผ๋ก UserController๋ก ๋ณด๋ด โUserService-UserMapper-DBโ๋ฅผ ๊ฑฐ์ณ์ userํ์ด๋ธ์ insertํ๊ฒ ๋๋ค.
    
![Untitled](src/main/webapp/WEB-INF/img/Untitled 5.png)
    

- **ํ์ ์ ๋ณด ์กฐํ**
    
โ ๋ก๊ทธ์ธ ํ ํ์ด์ง ์ฐ์ธก ์๋จ์ โํ์ ์ ๋ณดโ๋ฅผ ๋๋ฅด๋ฉด `userdetail.jsp` ๋ก ๋์ด๊ฐ๋ค.
    
![Untitled](src/main/webapp/WEB-INF/img/Untitled 6.png)
    
 โ userdetail.jsp๋ก ๋์ด๊ฐ๋ฉด ๋น๋๊ธฐ๋ก ํ์ ์ ๋ณด๋ฅผ ๊ฐ์ ธ์ค๊ณ  ๊ฐ์ ธ์จ ๋ฐ์ดํฐ๋ฅผ ๋ฐ๋ก ํ๋ฉด์ ๋ณด์ฌ์ค๋ค.
    
```jsx
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
    			utype.innerText = "์ผ๋ฐ์ฌ์ฉ์";
    		}else{
    			utype.innerText = "๋ถ๋์ฐ ๊ด๋ จ ์ข์ฌ์";
    		}
    	}
    	getUserInfo();
```
    

- **ํ์ ์ ๋ณด ์์ **
    
โ `userdetail.jsp`์์ `**ํ์ ์ ๋ณด ์์ ํ๊ธฐ`** ๋ฒํผ์ ๋๋ฅด๋ฉด ํ์๋ฒํธ(unum)๋ฅผ ํ๋ผ๋ฏธํฐ๋ก ๊ฐ์ด ๋๊ฒจ์ฃผ๋ฉด์ userModify.jsp๋ก ๋๊ฒจ์ค๋ค.
    
    `${root}/user/modify?unum=${loginUser.unum}`
    
```java
    //ํ์์ ๋ณด ์์  ํ์ด์ง๋ก ๋๊ธฐ๊ธฐ
    	@GetMapping("/modify")
    	public String modify() {
    		return "userModify";
    	}
 ```
    
โ ์ด๋ ๋ชจ๋  ํ์์ ๋น๋ฐ๋ฒํธ, ์ด๋ฆ, ์ฃผ์๋ง ๋ณ๊ฒฝํ  ์ ์๋๋ก ๋ค๋ฅธ ํญ๋ชฉ๋ค์ input ํ๊ทธ ์์ disabled์ฒ๋ฆฌํด ์ค๋ค.
    
    
 `<input type="text" name = "uid" aria-label="UserID" value="${loginUser.uid}" disabled/>`
    
โ UserMapper.xml์์ ํ๋ผ๋ฏธํฐ๋ก ๋ฐ์ unum๊ณผ ๊ฐ์ ํ์์ ์ ๋ณด๋ฅผ ์์ ํ๋ฏ๋ก inputํ๊ทธ์ hidden์ ์ ์ฉํ์ฌ ๋ฐ์ดํฐ๋ฅผ UserController-UserService-UserMapper-DB๋ฅผ ๊ฑฐ์ณ์ ์์ ํ๋๋ก ํ๋ค.
    
    `<input type="hidden" name="unum" value="${loginUser.unum}"/>`
    
![Untitled](src/main/webapp/WEB-INF/img/Untitled 7.png)
    
1. **๋ก๊ทธ์ธ ๊ด๋ฆฌ**
    - **๋ก๊ทธ์ธ/ ๋ก๊ทธ์์**
    
![Untitled](src/main/webapp/WEB-INF/img/Untitled 8.png)
    
โ ๋ฉ์ธ ํ๋ฉด์์ โLogInโ์ ์ ํํ๋ฉด ์์ด๋์ ํจ์ค์๋๋ฅผ ์ ์ ์ ์๋ ๋ชจ๋ฌ ์ฐฝ์ด ๋์จ๋ค.
    
![Untitled](src/main/webapp/WEB-INF/img/Untitled 9.png)
    
![Untitled](src/main/webapp/WEB-INF/img/Untitled 10.png)
    
๋ก๊ทธ์ธ์ ์ฑ๊ณตํ๋ฉด alert์ ๋์ฐ๊ณ  nav bar ๋ถ๋ถ์ด ๋ฐ๋๋ ๊ฒ์ ํ์ธํ  ์ ์๋ค.
    
![Untitled](src/main/webapp/WEB-INF/img/Untitled 11.png)
    
```html
    <form action="${root}/user/login" method="post">
    <div class="modal fade" id="loginModal" data-bs-backdrop="static" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title">๋ก๊ทธ์ธ</mark></h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="mb-3">
                    <label for="uid" class="form-label">์์ด๋ : </label>
                    <input
                    type="text"
                    class="form-control"
                    id="uid"
                    name="uid"
                    placeholder="์์ด๋"
                    />
                </div>
                <div id="idcheck-result"></div>
                <div class="mb-3">
                    <label for="upw" class="form-label">๋น๋ฐ๋ฒํธ : </label>
                    <input
                    type="password"
                    class="form-control"
                    id="upw"
                    name="upw"
                    placeholder="๋น๋ฐ๋ฒํธ"
                    />
                </div>
            </div>
            <div class="modal-footer">
            <button type="submit" id="btn-join" class="btn btn-outline-primary">๋ก๊ทธ์ธ</button>
            <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal"><b>๋ซ๊ธฐ</b></button>
            </div>
        </div>
        </div>
    </div>
    
</form>
 ```
    

### โ๏ธ ์ถ๊ฐ ๊ตฌํ ๊ธฐ๋ฅ

1. **์ ์ฒด ๊ฒ์ํ / ํ๋ณด ๊ฒ์ํ ๊ธฐ๋ฅ**
    - ๊ฒ์ํ ๊ธฐ๋ฅ์ ํตํด ์๋น์ค ์ด์ฉ์ ๊ฐ์ ์์ ๋ก์ด ์ปค๋ฎค๋์ผ์ด์์ด ๊ฐ๋ฅํ๋ค.
    - ๋ถ๋์ฐ ์ค๊ฐ์์๋ก ๊ฐ์ํ ํ์์ ํ๋ณด ๊ฒ์ํ์ ํ๋ณด ๊ธ์ ์์ฑํ  ์ ์๋ค.
    - ๋ก๊ทธ์ธ ํ ํ์์ด๋ผ๋ฉด ๋๊ตฌ๋ ๊ฒ์ํ์ ๊ธ์ ์์ฑํ  ์ ์๋ค.
    
![Untitled](src/main/webapp/WEB-INF/img/Untitled 12.png)
    
![Untitled](src/main/webapp/WEB-INF/img/Untitled 13.png)
    

1. **๋ค์ด๋ฒ ๊ฒ์ API ์ฌ์ฉ**
    - ์ํํธ ์์ธ์ ๋ณด ํ์ด์ง์์ โ๊ฒ์ ๊ฒฐ๊ณผ ๋ณด๊ธฐโ ๋ฒํผ ํด๋ฆญ ์ ๋ค์ด๋ฒ ๊ฒ์์ฐฝ์ ์ํํธ์ ๋๋ก๋ช ์ฃผ์๊ฐ ์๋์ผ๋ก ๊ฒ์๋๋ค.
    - ์ฌ์ฉ์๋ ์ด๋ฅผ ์ด์ฉํด ์ํํธ ์ฃผ๋ณ์ ํ๊ฒฝ ์ ๋ณด๋ฅผ ์ป์ ์ ์๋ค.

![Untitled](src/main/webapp/WEB-INF/img/Untitled 14.png)

![Untitled](src/main/webapp/WEB-INF/img/Untitled 15.png)

## ๐ก ์ฌ์ฉํ API

---

- **๊ตญํ ๊ตํต๋ถ ์ํํธ/ ์ฐ๋ฆฝ๋ค์ธ๋ ์ค๊ฑฐ๋๊ฐ ์๋ฃ** - ๊ณต๊ณต ๋ฐ์ดํฐ ํฌํ
    
    ([https://www.data.go.kr/dataset/3050988/openapi.do](https://www.data.go.kr/dataset/3050988/openapi.do))
    

- **๊ตญํ ๊ตํต๋ถ_์ํํธ๋งค๋งค ์ค๊ฑฐ๋ ์์ธ ์๋ฃ** โ ๊ณต๊ณต ๋ฐ์ดํฐ ํฌํ
    
    ([https://www.data.go.kr/iim/api/selectAPIAcountView.do](https://www.data.go.kr/iim/api/selectAPIAcountView.do))
    

## ๐พ ์ฌ์ฉํ ๋ฐ์ดํฐ๋ฒ ์ด์ค

---

- **[ houseinfo ]** - ์ํํธ ์ ๋ณด ํ์ด๋ธ
    
    
    |  | ์ํํธ๋ฒํธ | ๊ฑด์ถ๋๋ | ๋๋ก๋ช | ๋๋ก๋ช๋ณธ๋ถ | ๋๋ก๋ช๋ถ๋ถ | ๋๋ก๋ชseq | ๋๋ก๋ช์ง๋ฒ์ฝ๋ | ๋๋ก๋ช์ฝ๋ | ๋์ด๋ฆ | ๋ณธ๋ถ | ๋ถ๋ถ | ์๊ตฌ๊ตฐ์ฝ๋ | eubmyundongCode | ๋์ฝ๋ | ํ ์ง์ฝ๋ | ์ํํธ์ด๋ฆ | ์ง๋ฒ | ๊ฒฝ๋ | ์๋ |
    | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
    | ์ปฌ๋ผ๋ช | aptCode | aptName | roadName | roadNameBonbun | roadNameBubun | roadNameSeq | roadNameBasementCode | roadNameCode | dong | bonbun | bubun | sigunguCode | eubmyundongCode | dongCode | landCode | apartmentName | jibun | lng | lat |
    | ๋ฐ์ดํฐํ์ | bigint | int | varchar(40) | varchar(5) | varchar(5) | varchar(2) | varchar(1) | varchar(7) | varchar(40) | varchar(4) | varchar(4) | varchar(5) | varchar(5) | varchar(10) | varchar(1) | varchar(40) | varchar(10) | varchar(30) | varchar(30) |
    | Constraint | primary key | default null | default null | default null | default null | default null | default null | default null | default null | default null | default null | default null | default null | default null | default null | default null | default null | default null | default null |
    |  |  |  |  |  |  |  |  |  |  |  |  |  |  | foreign key |  |  |  |  |  |
    |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
    
    ```sql
    CREATE TABLE `houseinfo` (
      `aptCode` bigint NOT NULL,
      `buildYear` int DEFAULT NULL,
      `roadName` varchar(40) DEFAULT NULL,
      `roadNameBonbun` varchar(5) DEFAULT NULL,
      `roadNameBubun` varchar(5) DEFAULT NULL,
      `roadNameSeq` varchar(2) DEFAULT NULL,
      `roadNameBasementCode` varchar(1) DEFAULT NULL,
      `roadNameCode` varchar(7) DEFAULT NULL,
      `dong` varchar(40) DEFAULT NULL,
      `bonbun` varchar(4) DEFAULT NULL,
      `bubun` varchar(4) DEFAULT NULL,
      `sigunguCode` varchar(5) DEFAULT NULL,
      `eubmyundongCode` varchar(5) DEFAULT NULL,
      `dongCode` varchar(10) DEFAULT NULL,
      `landCode` varchar(1) DEFAULT NULL,
      `apartmentName` varchar(40) DEFAULT NULL,
      `jibun` varchar(10) DEFAULT NULL,
      `lng` varchar(30) DEFAULT NULL,
      `lat` varchar(30) DEFAULT NULL,
      PRIMARY KEY (`aptCode`),
      UNIQUE KEY `UNIQUE` (`buildYear`,`apartmentName`,`jibun`,`sigunguCode`,`eubmyundongCode`) /*!80000 INVISIBLE */,
      KEY `houseinfo_dongCode_dongcode_dongCode_fk_idx` (`dongCode`) /*!80000 INVISIBLE */,
      CONSTRAINT `houseinfo_dongCode_dongcode_dongCode_fk` FOREIGN KEY (`dongCode`) REFERENCES `dongcode` (`dongCode`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    ```
    
- **[ housedeal ]** - ์ํํธ ๋งค๋งค ์ ๋ณด ํ์ด๋ธ
    
    
    |  | ๋งค๋งค๋ฒํธ | ๊ฑฐ๋๊ธ์ก | ๊ฑฐ๋๋๋ | ๊ฑฐ๋์ | ๊ฑฐ๋์ผ | ๋ฉด์  | ์ธต |  | ์ํํธ์ฝ๋ |
    | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
    | ์ปฌ๋ผ๋ช | no | dealAmount | dealYear | dealMonth | dealDay | area | floor | cancelDealType | aptCode |
    | ๋ฐ์ดํฐํ์ | bigint | varchar(20) | int | int | int | varchar(20) | varchar(4) | varchar(1) | bigint |
    | Constraint |  |  |  |  |  |  |  |  | primary key |
    |  | default null | default null | default null | default null | default null | default null | default null | default null | default null |
    |  |  |  |  |  |  |  |  |  | foreign key |

```sql
CREATE TABLE `housedeal` (
  `no` bigint NOT NULL,
  `dealAmount` varchar(20) DEFAULT NULL,
  `dealYear` int DEFAULT NULL,
  `dealMonth` int DEFAULT NULL,
  `dealDay` int DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `floor` varchar(4) DEFAULT NULL,
  `cancelDealType` varchar(1) DEFAULT NULL,
  `aptCode` bigint DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `housedeal_aptCode_houseinfo_aptCode_fk_idx` (`aptCode`),
  CONSTRAINT `housedeal_aptCode_houseinfo_aptCode_fk` FOREIGN KEY (`aptCode`) REFERENCES `houseinfo` (`aptCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```

- **[ dongcode]** - ์ ๊ตญ์ ๋ ์ฝ๋
    
    
    |  | ๋์ฝ๋ | ์/๋ ์ด๋ฆ | ๊ตฌ/๊ตฐ ์ด๋ฆ | ๋ ์ด๋ฆ |
    | --- | --- | --- | --- | --- |
    | ์ปฌ๋ผ๋ช | dongCode | sidoName | gugunName | dongName |
    | ๋ฐ์ดํฐํ์ | varchar(10) | varchar(30) | varchar(30) | varchar(30) |
    | Constraint | not null | default null | default null | default null |
    |  | primary key |  |  |  |
    
    ```sql
    CREATE TABLE `dongcode` (
      `dongCode` varchar(10) NOT NULL,
      `sidoName` varchar(30) DEFAULT NULL,
      `gugunName` varchar(30) DEFAULT NULL,
      `dongName` varchar(30) DEFAULT NULL,
      PRIMARY KEY (`dongCode`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    ```
    

- **[ user ] -** ํ์ ์ ๋ณด ํ์ด๋ธ
    
    
    |  | ํ์๋ฒํธ | ํ์์์ด๋ | ํ์๋น๋ฐ๋ฒํธ | ํ์์ด๋ฆ | ํ์์ฃผ์ | ํ์ ํ์ |
    | --- | --- | --- | --- | --- | --- | --- |
    | ์ปฌ๋ผ๋ช | unum | uid | upw | uname | uaddr | utype |
    | ๋ฐ์ดํฐํ์ | int (auto_increment) | varchar(40) | varchar(40) | varchar(40) | varchar(40) | varchar(20) |
    | Constraint | primary key | unique  | not null | not null | not null | not null |
    |  |  | not null |  |  |  |  |
    
    ```sql
    create table user (
        unum int auto_increment primary key,
        uid varchar(40) unique not null,
        upw varchar(40) not null,
        uname varchar(40) not null,
        uaddr varchar(40) not null,
        utype varchar(20) not null
    );
    ```
    

- **[ board ]** - ๊ฒ์ํ ํ์ด๋ธ
    
    
    |  | ๊ฒ์๊ธ๋ฒํธ | ๊ฒ์๊ธ ์์ฑ์ ํ์ | ๊ฒ์๊ธ์์ฑ์ | ๊ฒ์๊ธ์ ๋ชฉ | ๊ฒ์๊ธ๋ด์ฉ | ๊ฒ์๊ธ์์ฑ์ผ์ |
    | --- | --- | --- | --- | --- | --- | --- |
    | ์ปฌ๋ผ๋ช | boardno | boardtype | boardwriter | boardtitle | boardcontent | boarddate |
    | ๋ฐ์ดํฐํ์ | int (auto_increment) | varchar(20) | varchar(20) | varchar(100) | varchar(200) | date |
    | Constraint | primary key | not null | foreign key (references userinfo(userid)) | not null | default null | not null |
    |  |  |  | on delete cascade |  |  |  |
    
    ```sql
    create table board (
        boardno int auto_increment,
        boardtype varchar(20) not null,
        boardwriter varchar(20) not null,
        boardtitle varchar(100) not null,
        boardcontent varchar(200) DEFAULT null,
        boarddate date not null,
        primary key (`boardno`),
        foreign key (`boardwriter`) references `user`(`uid`)
        on delete cascade
    );
    ```
    

## ๐ ํ๋ก์ ํธ ๊ตฌ์ฑ

---

[ **์ฃผํ ๋งค๋งค ์ค๊ฑฐ๋๊ฐ ์ ๋ณด ]**

- DTO
    - HouseInfoDTO.java
    - HouseDealDTO.java
    - DonCodeDTO.java
    - BaseAddressDTO.java
- DAO
    - HouseMapper.java
    - HouseMapper.xml
- Service
    - HouseService.java
- Controller
    - HouseController.java
- jsp
    - index.jsp
    - detail.jsp

**[ ์ฌ์ฉ์ ์ ๋ณด ]**

- DTO
    - UserDTO.java
- DAO
    - UserMapper.java
    - UserMapper.xml
- Service
    - UserService.java
- Controller
    - UserController.java
- jsp
    - signup.jsp
    - userdetail.jsp
    - userModify.jsp

**[ ๊ฒ์ํ ]**

- DTO
    - BoardDTO.java
- DAO
    - BoardMapper.java
    - BoardMapper.xml
- Service
    - BoardService.java
- Controller
    - BoardController.java
- jsp
    - boardList.jsp
    

**[ Config ]**

- DatabaseConfig.java

**[ include ]**

- header.jsp
- footer.jsp
- nav.jsp
