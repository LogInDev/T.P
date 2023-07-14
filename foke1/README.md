# FokeFoke(23.04.03 ~ 23.05.02)
- [목차](#fokefoke230403--230502)
    - [STACKS](#-stacks)
    - [기획의도](#%EA%B8%B0%ED%9A%8D%EC%9D%98%EB%8F%84)
    - [담당파트](#%EB%8B%B4%EB%8B%B9%ED%8C%8C%ED%8A%B8)
        - 카테고리 별 메뉴 출력
        - 메인메뉴별 상세 옵션 커스텀
        - `추천 꿀 조합`
        - 옵션 수정 및 수량, 금액 변경
        - 메인 메뉴 상세 설명 페이지 생성
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
<img src="https://img.shields.io/badge/mybatis-000000?style=for-the-badge&logo=mybatis&logoColor=white">
<img src="https://img.shields.io/badge/lombok-000000?style=for-the-badge&logo=flask&logoColor=white">
<h3>Database</h3>
<img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
<h3>Tools & Services</h3>
<img src="https://img.shields.io/badge/apachetomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
<img src="https://img.shields.io/badge/apachemaven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white">
<img src="https://img.shields.io/badge/visualstudiocode-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white">
</div>

## 기획의도
<img src='https://user-images.githubusercontent.com/127198819/252628401-f83926ef-b184-459e-82b9-a17a0bba9801.png' width="30%" height="30%">

- 매장별 음식 주문 사이트
- Fast + Poke를 합쳐 빠르고 신선한 포케 샐러드를 전한다는 의미.
- 로고의 모양은 포케포케의 대표 메뉴인 연어 샐러드의 연어를 표현하였으며, 말풍선 모양으로 고객과 끊임 없이 소통하겠다는 포케포케의 다짐이 들어있음.
- 고객별 취향에 따라 옵션을 커스텀 할 수 있도록 구성 
<br><br><br>

## 담당파트
### 👉 카테고리 별 메뉴 출력
- 카테고리별로 값을 주어 해당하는 메뉴를 출력
### 👉 메인메뉴별 상세 옵션 커스텀
- 모달창을 활용하여 여러 옵션들을 원하는대로 선택하여 db에 저장함
### 👉 `추천 꿀 조합`
- 메인메뉴별 꿀 조합을 추천해줌
### 👉 옵션 수정 및 수량, 금액 변경
- `AJAX`를 이용하여 변경된 내용을 바로 확인 가능하게 함.
### 👉 메인 메뉴 상세 설명 페이지 생성
- 메인 메뉴의 사진 및 메뉴 설명, 영양정보등을 출력

## 카테고리 별 메뉴 출력
<img src='https://user-images.githubusercontent.com/127198819/253457518-294aa7c6-bcc4-4ec1-86a1-f8ae16985d7b.gif'>

- 카테고리별로 값을 설정하여 contrller에서 해당 값에 따라 if문을 통해 옵션 선택 중에도 원하는 카테고리 별 메뉴 볼 수 있도록 구현
<br><br><br>

## 메인메뉴별 상세 옵션 커스텀
<img src='https://user-images.githubusercontent.com/127198819/253463833-18edfae3-be9c-41d9-9f39-881f399a26b0.gif'>

- 모달창 효과를 이용하여 옵션 선택을 더 편리하게 구현
- radio와 checkbox를 통해 옵션을 취향에 따라 선택 가능하도록 구현
- 유효성 검사를 통해 필수 선택 요소와 최대 선택 가능 개수 제한
- topping처럼 여러 값을 넘겨야 하는 것은 controller에서 if문과 for문을 통해 dto객체로 만듦.
  <br><br><br>

## 추천 꿀 조합
<img src='https://user-images.githubusercontent.com/127198819/253463212-966d6589-7482-43e0-aad2-b76b83167053.gif'>

- 모달창 사용
- 미리 상품별 추천 꿀 조합을 db에 저장해 두어 해당 상품 별 꿀 조합을 출력
- 토핑과 소스는 변경이 불가하지만 베이스는 선택가능하도록 radio버튼 이용
- 상세 옵션 변경 페이지에서 추천 꿀 조합은 필수 선택 수정 불가하도록 설정
<br><br><br>

## 옵션 수정 및 수량, 금액 변경
<img src='https://user-images.githubusercontent.com/127198819/253464525-f8a6d75b-1fd3-4cad-a5d3-dd68220219af.gif'>

- 선택한 옵션을 볼 수 있도록 구현
- 이전페이지와 마찬가지로 모달창으로 구현하여 옵션수정 가능하게함.(단, `추천 꿀 조합`은 필수 옵션 수정 불가)
- `적용`버튼 클릭 시에만 선택 옵션 적용. `X`로 종료 시 이전 선택 옵션 유지
- 변경된 옵션 `AJAX`로 바로바로 출력되도록 설정
- 금액 변동 옵션 변경시 변경된 금액 `AJAX`로 바로 적용
- 수량에 따른 금액 변동 가능
<br><br><br>

## 메인 메뉴 상세 설명 페이지 생성
<img src='https://user-images.githubusercontent.com/127198819/253465492-f16cdaaf-81c6-4777-a534-b6f4edf18c7c.gif'>

- 메인 메뉴에서 메뉴 선택 시 상세설명 페이지로 이동. 
  
