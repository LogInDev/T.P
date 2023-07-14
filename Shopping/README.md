# WebShopping(23.03.07 ~ 23.03.17)
- 목차
  - [STACKS](#-stacks)
  - [기획의도](#%EA%B8%B0%ED%9A%8D%EC%9D%98%EB%8F%84)
  - [담당파트](#%EB%8B%B4%EB%8B%B9%ED%8C%8C%ED%8A%B8)
 <br><br><br>
 
## 📚 STACKS
<div>
  <h3>Frontend</h3>
<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
<img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
<img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
<h3>Backend</h3>
<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">
<img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white">
<img src="https://img.shields.io/badge/lombok-000000?style=for-the-badge&logo=flask&logoColor=white">
<h3>Database</h3>
<img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
<h3>Tools & Services</h3>
<img src="https://img.shields.io/badge/apachetomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
<img src="https://img.shields.io/badge/apachemaven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white">
<img src="https://img.shields.io/badge/visualstudiocode-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white">
</div>

## 기획의도
- ‘명품을 더 가깝게, 고객과 더 가깝게’라는 목표로 쇼핑몰 제작. 고객과 소통을 원활하게 하는 쇼핑몰. 
- MVC패턴을 통해 유지 보수와 결합 시 수월하게 함.
<br><br><br>

## 담당파트
### 👉 회원 가입 · 수정 · 탈퇴
### 👉 게시판 등록 · 수정 · 삭제 
### 👉 관리자 페이지
<br><br><br>

## 회원 가입 · 수정 · 탈퇴
### 회원 가입
<img src='https://user-images.githubusercontent.com/127198819/253482697-6c9cbad3-a7ae-4412-8cbe-835414c1b2aa.gif'>

- `ID중복체크`를 필수로 하여 `AJAX`를 사용하여 해당 아이디가 중복일 경우 `등록`버튼을 `disabled`처리 하고 중복이 아닌 경우 `disabled` 처리를 해제함.
- 유효성 검사를 추가하여 필수 항목을 작성하지 않으면 회원가입을 불가능하게 함.
- `주소찾기API`를 추가하여 실제 주소와 가깝게 하도록 구현.
<br><br><br>

### 회원 수정 · 탈퇴
<div>
<img src='https://user-images.githubusercontent.com/127198819/253490916-f1819de0-f460-4cba-895d-f5797c293f10.gif' width='40%'>
<img src='https://user-images.githubusercontent.com/127198819/253491460-2aceecc6-ed55-4b9c-af17-ab2289dee772.gif' width='40%'>
</div>

- 회원 정보 수정 가능
- 비밀번호와 비밀번호 확인과 일치하지 않으면 수정 불가하도록 유효성 검사 추가
- 탈퇴된 아이디는 로그인 불가
<br><br><br>

## 게시판 등록 · 수정 · 삭제 
### 게시판 출력, 페이징, 검색
<img src='https://user-images.githubusercontent.com/127198819/253493378-9551d3c4-959b-4775-a437-aa2d375d9239.gif'>

- `web.xml`에 페이지 당 나올 게시물 수와 페이지 단추 개수를  `context-param`으로 설정하여 `application`객체 사용
- 제목, 본문, 글쓴이별로 검색 가능하게 구현
- 한 페이지당 게시물 수와 검색 결과로 출력된 게시물 수 출력
<br><br><br>

### 게시물 등록 · 수정 · 삭제 
<img src='https://user-images.githubusercontent.com/127198819/253495983-98d5d6be-ad51-425f-86f7-7e77cf679eb9.gif'>

- 게시물 등록, 수정, 삭제 가능
<br><br><br>
 
 ## 관리자 페이지
 - 로그인한 ID를 session 담아 관리자인지 회원인지 확인. 모든 페이지에서 회원확인(비회원일 시 이용불가)
 ### 게시물 수정 · 삭제, 답변 등록 · 수정 · 삭제 
 <img src='https://user-images.githubusercontent.com/127198819/253497869-1b21865f-52b6-42e2-8bd2-ff4c024033bc.gif'>
 
 - 회원 게시물 수정 · 삭제 가능
 - 회원 게시물에 답변 등록 · 수정 · 삭제 
<br><br><br>

 ### 상품 등록 · 수정 · 삭제 
 <div>
   <img src='https://user-images.githubusercontent.com/127198819/253499550-fa909845-a9dd-442f-83d2-3c55eb5d4b6e.gif' width='40%'>
   <img src='https://user-images.githubusercontent.com/127198819/253499924-5caa4962-af74-460f-bc28-4bb641d2cc99.gif' width='40%'>
 </div>

- 관리자로 로그인 한 경우에만 `상품등록`메뉴 생성
- 미리 영어로 변환할 파일 만들어서 `bundle`로 적용
- '가격'란은 숫자만 입력되게 유효성 검사 구현
- 상품명, 사진 등 수정, 삭제 구현





























