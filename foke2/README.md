# 스프링 부트 기반 음식 주문 사이트와 엘라스틱서치를 활용한 정보 검색 및 데이터 분석과 머신러닝에 기반한 맛집 추천 시스템(23.06.17 ~ 23.07.17) 
- [목차](#fokefoke230617--230717)
  - [STACKS](#-stacks)
  - [기획의도](#%EA%B8%B0%ED%9A%8D%EC%9D%98%EB%8F%84)
  - [담당파트](#%EB%8B%B4%EB%8B%B9%ED%8C%8C%ED%8A%B8) 
      - [형상 관리](#-%ED%98%95%EC%83%81%EA%B4%80%EB%A6%AC---git-organizations-%EC%83%9D%EC%84%B1)
      - [데이터베이스 설계](#%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B2%A0%EC%9D%B4%EC%8A%A4-%EC%84%A4%EA%B3%84)
      - [실시간 1:1상담](#%EC%8B%A4%EC%8B%9C%EA%B0%84-11-%EC%83%81%EB%8B%B4)
      - [Cosine 유사도를 통해 차트, api, wordcloud를 활용한 맛집 추천](#cosine-%EC%9C%A0%EC%82%AC%EB%8F%84%EB%A5%BC-%ED%86%B5%ED%95%B4-%EC%B0%A8%ED%8A%B8-api-wordcloud%EB%A5%BC-%ED%99%9C%EC%9A%A9%ED%95%9C-%EB%A7%9B%EC%A7%91-%EC%B6%94%EC%B2%9C)
      - [Elasticsearch](#elasticsearch)
      - [배포](#deployment)
      - [상세옵션 선택 springboot로 변환](#%EC%83%81%EC%84%B8%EC%98%B5%EC%85%98-%EC%84%A0%ED%83%9D-springboot%EB%A1%9C-%EB%B3%80%ED%99%98)
  - [느낀점 및 아쉬웠던 부분](#%EB%8A%90%EB%82%80%EC%A0%90-%EB%B0%8F-%EC%95%84%EC%89%AC%EC%9B%A0%EB%8D%98-%EB%B6%80%EB%B6%84)
<br><br><br>

## 📚 STACKS
<div>
<h3>Frontend</h3>
<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
<img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
<img src="https://img.shields.io/badge/react-61DAFB?style=for-the-badge&logo=react&logoColor=black">
<img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
<img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
<img src="https://img.shields.io/badge/vite-646CFF?style=for-the-badge&logo=vite&logoColor=white">
<h3>Backend</h3>
<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">
<img src="https://img.shields.io/badge/python-3776AB?style=for-the-badge&logo=python&logoColor=white">
<img src="https://img.shields.io/badge/node.js-339933?style=for-the-badge&logo=Node.js&logoColor=white">
<img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white">
<img src="https://img.shields.io/badge/flask-000000?style=for-the-badge&logo=flask&logoColor=white">
<img src="https://img.shields.io/badge/lombok-000000?style=for-the-badge&logo=flask&logoColor=white">
<h3>Database</h3>
<img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/mongoDB-47A248?style=for-the-badge&logo=MongoDB&logoColor=white">
<h3>Tools & Services</h3>
<img src="https://img.shields.io/badge/linux-FCC624?style=for-the-badge&logo=linux&logoColor=black">
<img src="https://img.shields.io/badge/amazonec2-FF9900?style=for-the-badge&logo=amazc2&logoColor=white">
<img src="https://img.shields.io/badge/nginx-009639?style=for-the-badge&logo=nginx&logoColor=white">
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
<img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logogit&logoColor=white">
<img src="https://img.shields.io/badge/gradle-02303A?style=for-the-badge&logo=gradle&logoColor=white">
<img src="https://img.shields.io/badge/visualstudiocode-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white">
<img src="https://img.shields.io/badge/elasticstack-005571?style=for-the-badge&logo=elasticstack&logoColor=white">
<img src="https://img.shields.io/badge/elasticsearch-005571?style=for-the-badge&logo=asticsearch&logoColor=white">
<img src="https://img.shields.io/badge/mobaxterm-000000?style=for-the-badge&logo=mobx&logoColor=white">
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
### 👉 형상관리 - git organizations 생성
<div>
<img src='https://user-images.githubusercontent.com/127198819/253467341-720111bc-48c7-4d0c-aaca-b40c2d29edd8.png' width='40%'>
<img src='https://user-images.githubusercontent.com/127198819/253467524-d6b3dfde-998e-48af-93dd-42574b15c39e.png' width='40%'>
</div>

- main과 dev 브랜치로 나누어 dev에서 팀원들이 개발한 프로젝트를 자유롭게 올리고, 원본과 병합은 main에서 관리자가 실행
### 👉 데이터베이스 설계
### 👉 실시간 1:1 상담
  - `webflux`, `SSE`, `mongodb`를 이용한 실시간 채팅 상담 서비스
### 👉 Crawling과 Cosine 유사도를 통해 차트, api, wordcloud를 활용한 맛집 추천
- 백터 간 거리에 기반한 `Cosine`유사도를 비교하여 검색어와 유사율이 높으면서 네이버 별점 및 블로그 수 등 높은 맛집 추천
### 👉 Elasticsearch
- `Kibana`, `Logstash`를 이용하여 db연동 및 csv파일 데이터를 가져와 elasticsearch 쿼리를 통해 조회 및 출력.
### 👉 배포
- `aws`, `google cloud platpom` 등을 사용해 배포
### 👉 상세옵션 선택 `springboot`로 변환
- `thymeleaf`등을 활용하여 기존 FokeFoke 프로젝트를 `springboot`로 변환
<br><br><br>

## 데이터베이스 설계
### ERD

<img src='https://user-images.githubusercontent.com/127198819/271027444-bc6b5f4b-5493-4536-9494-0e03aa62e30c.png' width='60%'>

### 테이블 설명
- cart : 사용자가 선택한 상품 정보 저장(장바구니 ID, 회원 ID, 상품 수량 등)
- mamber : 회원 정보 저장(회원 ID, 비밀번호, 이름 등)
- product : 판매되는 제품 정보 저장(제품 ID, 이름, 가격 등)
- store : 매장 정보 저장(매장 ID, 이름, 주소 등)
- notice : 공지 게시판 정보 저장(공지 ID, 제목, 내용, 날짜 등)
- nutritional : 메뉴 영양성분 정보 저장(영양 ID, 제품 ID, 제품명, 무게 등)
- payment : 사용자 결제 내역 정보 저장(지불 ID, 회원 ID, 카트 ID, 매장 ID 등)
- stock : 매장별 재고 정보 저장(재고 ID, 매장 ID, 상품 ID, 재고량 등)

### 성능 최적화 전략
- 인덱싱 전략 : 사용자 ID(member.memberId), 상품 ID(product.productId), 매장ID(store.storeId)에 대해 인덱싱을 수행하여 조회 성능을 개선했습니다. - Duration/Fethch Time을 통해 시간 단축 확인.(0.013 sec -> 0.0021sec로 단축)
- 쿼리 최적화: JOIN 연산과 GROUP BY 연산을 활용하여 필요한 정보만 효율적으로 가져오는 쿼리를 작성하였습니다.
<br><br><br>

## 실시간 1:1 상담
<img src='https://user-images.githubusercontent.com/127198819/253440300-03f84e13-b0ea-4608-b74b-0a44188ce46e.gif'>

- 관리자가 보지 못한 메시지는 아이디별로 push알림 효과 구현.
- 실시간 1대1 상담 구현을 위해 `SSE`(Server-Sent Events)프로토콜, `WebFlux`, `MongoDB`를 활용
- 폴링과 웹소켓 대신 SSE를 사용해 리소스 사용을 감소시켰으며, Spring Framework 5.0의 WebFlux에서 비동기 및 이벤트 기반 처리로 적은 스레드 사용이 가능하도록 구현.
- MongoDB의 `@Tailable` 과 Capped 컬렉션을 이용해 데이터 처리가 빠르고 스트리밍 데이터 처리에 적합한 구조를 제공하여 실시간 채팅 애플리케이션 구축에 이상적인 환경을 만듦.
- 이렇게 변환된 Capped 컬렉션은 데이터의 고정된 크기를 할당받아, 데이터의 삽입 및 조회가 매우 빠르게 처리되며, 스트리밍 데이터 처리에 적합한 구조를 가지고 있어 실시간 채팅 애플리케이션 구현에 적합.
- 이를 통해 WebFlux와 결합하여 즉각적인 메시지 전달과 함께 사용자 간의 원활한 상호작용이 가능한 실시간 채팅 시스템을 구축

<br><br><br>

## Cosine 유사도를 통해 차트, api, wordcloud를 활용한 맛집 추천
- `muchine-learning`을 통한 맛집 추천과 차트, `wordcloud`등을 `react-router`를 통해 `SPA`(Single Page Application)을 만듦.
<div>
<img src='https://user-images.githubusercontent.com/127198819/252841021-3b9465d8-66ea-4d68-9a21-a6ca92b661ec.gif'>
<img src='https://user-images.githubusercontent.com/127198819/252830789-a001e135-6781-4b54-a043-b53e012f2602.gif' width="40.5%" height="40.5%">
</div>

-  [`공공데이터포털`](https://www.data.go.kr/)에서 '소상공인시장진흥공단_상가(상권)정보' 데이터 셋 다운
-  [상호명, 도로명주소, 상권업종대분류명, 상권업종중분류명, 상권업종소분류명 (대중소 분류명), 표준산업분류명, 행정동명 (흑석동 상도1동만 빼서 쓸 것임), 위도, 경도] 컬럼만 사용.
-  추가적으로 네이버 지도 리뷰를 `크롤링`하여 네이버 리뷰 별점, 리뷰 개수, 블로그 개수 컬럼을 만듦.
    -  `pandas`, `numpy`, `selenium`, `BeautifulSoup`를 사용 - [`recommend.ipynb`](https://github.com/fhazlt/T.P/blob/main/foke2/recommend.ipynb)
-  업종 유사율, 네이버 리뷰 별점, 리뷰 개수, 블로그 개수 높은순으로 출력
    - `MinMaxScaler`를 통해서 각 변수의 값의 범위를 맞춤.
    - `sklearn`에 `CountVectorizer`를 사용하여 '업종 컬럼'을 백터화하여 `cosine_similarity`를 통해 거리기반 유사도를 만듦.
    - 벡터화 진행 시 업종 유사도와 리뷰 수, 별점 수에 가중치를 부여하여 정렬 후 검색어에 따른 유사율, 별점등이 높은 맛집 추천.
    - 추천 결과물을 json형식으로 출력
- `react`를 통하여 차트, wordcloud, youtubeAPI 구현
    - React 프로젝트 생성 시 `Vite`를 사용하였는데, Vite는 Webpack 기반의 `create-react-app`보다 더 빠른 rollup 기반의 경량화된 프론트엔드 번들러.
    - 이로 인해 초기 빌드 시간이 줄어들었고 설정이 간소화되어, 작은 프로젝트에 적합.
    - 페이지 전체를 다시 로드하지 않고 변경 사항만 반영하는 `HMR`(Hot Module Replacement) 기능을 제공하여 개발 생산성이 향상.
    - 검색어를 `axios`를 통해 flask서버로 요청하여 머신러닝을 통해 추천 결과물을 응답받음
    - 해당 결과물을 통해 '네이버 별점', '네이버 별점 리뷰 수', '블로그 글자 수 ', '유사도', 네이버 블로그 수' 차트 생성(`react-chartjs-2`라이브러리 사용)
    - `fetch`를 통해 가게명으로 `elasticsearch`에 인덱스를 조회하여 블로그 리뷰 텍스트 조회 후 wordcloud생성(`react-wordcloud`라이브러리 사용)
    - `YouTub Data API v3`을 이용하여 가게명에 따른 youtube영상 조회 및 재생

<br><br><br>

## Elasticsearch
- `Logstash`, `Kibana`를 이용하여 db 연동 및 csv파일 인덱스 생성
    - `Logstash`를 통해 mysqlDB와 연동 - [`logstash.conf`](https://github.com/fhazlt/T.P/blob/main/foke2/logstash2.conf)
    - `Kibana`를 통해 csv파일 인덱스 생성
- `HTTP` 프로토콜을 사용하여 `REST API` 요청으로 엘라스틱서치와 정보 교환.
<img src='https://user-images.githubusercontent.com/127198819/252847744-0669ae31-d3d5-4f21-a320-75b081e5de4f.png' width='60%'>

- `react`의 `fetch`를 통하여 Elasticsearch 서버와 `POST`로 정보 교환
- Elasticsearch 쿼리를 사용하여 검색 출력 개수, 검색 필드 설정
<img src='https://user-images.githubusercontent.com/127198819/252847843-965ce5aa-8669-467f-8a8f-bd70345fb383.png' width='60%'>

- `javascript`의 `ajax`를 사용하여 elastic 서버와 `POST`로 정보 교환
- Elasticsearch 쿼리를 사용하여 검색 출력 개수, 검색 필드, 출력 우선순위 설정
    - 고객과 가장 가까운 매장을 검색하기 위해 위도 기반 우선 순위를 설정
    - `*`연산자를 통해 검색어가 들어가는 모든 매장, 지역 출력되도록 설정

<br><br><br>

## Deployment
- `flask`, `nginx`, `elastic`, `kibana`, `netty`, `mongodb` 배포를 진행.
- `AWS 인스턴스`에서 `ubuntu` 운영체제로 mobaXterm Tool을 사용하여 `nginx`와 `flask`를 실행.
   - react프로젝트를 build하여 git으로 가져옴
   - flask 포트와 elastic 포트를 허용하여 프로젝트 구동
- `Elasticsearch`와 `Kibana`, `Spring Framework`는 `rocky-linux`운영체제로 SSH키를 사용하여 Google Cloud Platform에서 배포
- `springframework`는 default가 `netty`서버이고 jar파일에 netty서버 구성요소가 이미 포함되어 있어서 build 후 바로 Google cloud platform 인스턴스를 통해 배포
- 각 구성 요소가 서로 다른 클라우드 플랫폼에서 운영되는 것을 강조함으로써, 프로젝트가 여러 가지 클라우드 환경에서 유연하게 작동할 수 있음을 보여주고자 하였음.

<br><br><br>

## 상세옵션 선택 springboot로 변환
- 기존에 했던 프로젝트를 `springboot`로 변환하여 `jsp`파일을 `html`로 바꾸고 `thymeleaf`를 적용시킴
- [자세한 설명](https://github.com/fhazlt/T.P/tree/main/foke1)

<br><br><br>

## 느낀점 및 아쉬웠던 부분
- 처음 프로젝트 시작할 때 구현하고 싶은 기능들을 다 구현해서 마음은 후련하였다.
- github는 깔끔하게 하기 위해서 main과 dev 두 개의 브랜치로 나눈 것이였는데 생각보다 log가 굉장히 지저분하게 남았다. 소규모여서 팀원별로 브렌치를 나누어서 팀장만 merge권한을 갖데 하는 등의 방법도 괜찮았을 것 같다.
- 실시간 1대1 상담에서 고객이 상담 메시지를 보낼 때마다 관리자가 보지 못한 메시지 수를 실시간으로 push알림이 가게 만들었다. 이 과정에서 push알림을 reset해야할 타이밍을 언제로 해야하는 지를 고민했다. 또한, `@Tailable`의 사용으로 `capped` 사용이 중요하였다. 카카오 채팅같은 경우에도 Mongodb같은 비정형db를 사용하는지 의문이 들었다. 
-  역시 Crawling은 쉽지 않다. 보기에는 간단해 보이지만 소스 안에서 규칙을 찾아도 오타나 없는 내용들이 있어서 변수가 많다. `try-catch`로 잘못된 부분을 잘 파악하고 걸러낸 뒤 따로 처리하는게 중요했다. 오래걸린 작업 중 하나이다.
-  배포 시 많은 서버를 배포해야해서 걱정이였지만, 하나를 배포하니 비슷한 과정이라 생각 되었고, `capped`를 설정하지 않아서 처음에 오류를 찾는데 시간이 걸리긴했다.
- Docker의 기본적인 강의는 들었지만, 실전 적용은 생각보다 낯설었다. docker로 배포하지 못한 아쉬움이 있다.
