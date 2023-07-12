# FokeFoke(23.06.17 ~ 23.07.17)
- [목차](fokefoke230617--230717)
  - [STACKS](#-stacks)
  - [기획의도](#%EA%B8%B0%ED%9A%8D%EC%9D%98%EB%8F%84)
  - [담당파트](#%EB%8B%B4%EB%8B%B9%ED%8C%8C%ED%8A%B8)
  - [실시간 1:1상담]()
  - [Cosine 유사도를 통해 차트, api, wordcloud를 활용한 맛집 추천]()
  - [Elasticsearch]()
  - [배포]()
  - [상세옵션 선택 springboot로 변환]()
<br><br><br>

## 📚 STACKS
<div>
  <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> 
  <img src="https://img.shields.io/badge/python-3776AB?style=for-the-badge&logo=python&logoColor=white"> 
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
  <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">  
  <img src="https://img.shields.io/badge/mongoDB-47A248?style=for-the-badge&logo=MongoDB&logoColor=white">
  <img src="https://img.shields.io/badge/react-61DAFB?style=for-the-badge&logo=react&logoColor=black"> 
  <img src="https://img.shields.io/badge/node.js-339933?style=for-the-badge&logo=Node.js&logoColor=white">
  <img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white"> 
  <img src="https://img.shields.io/badge/flask-000000?style=for-the-badge&logo=flask&logoColor=white">
  <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
  <img src="https://img.shields.io/badge/linux-FCC624?style=for-the-badge&logo=linux&logoColor=black"> 
  <img src="https://img.shields.io/badge/amazonec2-FF9900?style=for-the-badge&logo=amazonec2&logoColor=white"> 
  <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
  <img src="https://img.shields.io/badge/gradle-02303A?style=for-the-badge&logo=gradle&logoColor=white">
  <img src="https://img.shields.io/badge/vite-646CFF?style=for-the-badge&logo=vite&logoColor=white">
  <img src="https://img.shields.io/badge/lombok-000000?style=for-the-badge&logo=flask&logoColor=white">
  <img src="https://img.shields.io/badge/visualstudiocode-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white">
  <img src="https://img.shields.io/badge/elasticstack-005571?style=for-the-badge&logo=elasticstack&logoColor=white">
  <img src="https://img.shields.io/badge/elasticsearch-005571?style=for-the-badge&logo=elasticsearch&logoColor=white">
</div>
<br><br><br>

## 기획의도
<img src='https://user-images.githubusercontent.com/127198819/252628401-f83926ef-b184-459e-82b9-a17a0bba9801.png' width="30%" height="30%">

- 매장별 음식 주문 사이트
- Fast + Poke를 합쳐 빠르고 신선한 포케 샐러드를 전한다는 의미.
- 로고의 모양은 포케포케의 대표 메뉴인 연어 샐러드의 연어를 표현하였으며, 말풍선 모양으로 고객과 끊임 없이 소통하겠다는 포케포케의 다짐이 들어있음.
- 고객별 취향에 따라 옵션을 커스텀 할 수 있도록 구성 
- 기존에 했던 FokeFoke프로젝트를 Springboot로 변환하고 다양한 기술 스펙트럼이 있는 것을 보여주는 것이 목표
<br><br><br>

## 담당파트
### 👉 실시간 1:1상담
- webflux와 mongodb를 이용한 실시간 채팅 상담 서비스
### 👉 Cosine 유사도를 통해 차트, api, wordcloud를 활용한 맛집 추천
- 검색어와 Cosine유사도를 비교하여 유사율이 높으면서 네이버 별점 및 블로그 수 등 높은 맛집 추천
### 👉 Elasticsearch
- Kibana, Logstash를 이용하여 db연동 및 csv파일 데이터를 가져와 elasticsearch 쿼리를 통해 조회 및 출력.
### 👉 배포
- aws, google cloud platpom 등을 사용해 배포
### 👉 상세옵션 선택 springboot로 변환
- thymeleaf등을 활용하여 기존 FokeFoke 프로젝트를 springboot로 변환
<br><br><br>

## 실시간 1:1상담

<br><br><br>

## Cosine 유사도를 통해 차트, api, wordcloud를 활용한 맛집 추천
<div>
  
<img src='https://user-images.githubusercontent.com/127198819/252830789-a001e135-6781-4b54-a043-b53e012f2602.gif' width="30%" height="30%">
</div>

-  `[공공데이터포털](https://www.data.go.kr/)`에서 '소상공인시장진흥공단_상가(상권)정보' 데이터 셋을 다운받음
-  [상호명, 도로명주소, 상권업종대분류명, 상권업종중분류명, 상권업종소분류명 (대중소 분류명), 표준산업분류명, 행정동명 (흑석동 상도1동만 빼서 쓸 것임), 위도, 경도] 컬럼만 사용.
-  추가적으로 네이버 지도 리뷰를 `크롤링(recommend.ipynb)`하여 리뷰 별점, 리뷰 개수, 블로그 개수 컬럼을 만듦.
  -  `pandas`, `numpy`, `selenium`, `를 사용하여 
-  

<br><br><br>

## Elasticsearch

<br><br><br>

## 배포

<br><br><br>

## 상세옵션 선택 springboot로 변환

<br><br><br>



