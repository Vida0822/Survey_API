# :pushpin: 설문조사 사이트 DB 설계
> 설문조사 시스템_db모델링 실습 (요구분석, 논리적 모델링, 물리적 모델링) 

</br>

## 1. 제작 기간 & 참여 인원
- 2023.03.29 ~ 2023.03.30
- 팀 과제

</br>

## 2. ERD 설계

* **erd** 
![erd](https://github.com/Vida0822/Survey_DBModeling/assets/132312673/58e8d030-3de1-404e-8b4c-fdf6ecdceb54)
<br>

* **eXERD**
![eXERD](https://github.com/Vida0822/Survey_DBModeling/assets/132312673/662b0a87-c099-48c6-a754-15c370b468a8)

<details>
<summary><b> 개체 및 속성 펼치기 </b></summary>
<div markdown="1">
<br>  
1. 설문조사(t_Poll) : [설문코드], 질문, 시작일 , 종료일 , 답변 항목수 , 총 참여자수, 작성일, 작성자(관리자코드) <br>
2. 설문항목(t_PollSub) : [답변항목SEQ], 답변항목, 답변항목선택수 , 설문코드(외래키) 		<br>
3. 회원 : [회원코드] , 회원ID, 비밀번호, 회원명, 휴대폰, 주소 <br>
4. 투표자(t_Voter): [투표코드], 사용자이름, 투표일, 설문코드(외래키) , 답변항목코드(외래키) , 회원코드 (외래키) <br>
5. 관리자 : [관리자코드], 관리자ID, 관리자명, 비밀번호, 휴대폰, 주소 <br>

</div>
</details>
<br>

## 3. 핵심 기능
이 서비스의 핵심 기능은 컨텐츠 등록 기능입니다.  
사용자는 단지 컨텐츠의 카테고리를 선택하고, URL만 입력하면 끝입니다.  
이 단순한 기능의 흐름을 보면, 서비스가 어떻게 동작하는지 알 수 있습니다.  

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 전체 흐름
![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow1.png)

### 4.2. 사용자 요청
![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_vue.png)

- **URL 정규식 체크** :pushpin: [코드 확인](https://github.com/Integerous/goQuality/blob/b587bbff4dce02e3bec4f4787151a9b6fa326319/frontend/src/components/PostInput.vue#L67)
  - Vue.js로 렌더링된 화면단에서, 사용자가 등록을 시도한 URL의 모양새를 정규식으로 확인합니다.
  - URL의 모양새가 아닌 경우, 에러 메세지를 띄웁니다.

- **Axios 비동기 요청** :pushpin: [코드 확인]()
  - URL의 모양새인 경우, 컨텐츠를 등록하는 POST 요청을 비동기로 날립니다.

### 4.3. Controller

![](https://zuminternet.github.io/images/portal/post/2019-04-22-ZUM-Pilot-integer/flow_controller.png)

- **요청 처리** :pushpin: [코드 확인](https://github.com/Integerous/goQuality/blob/b2c5e60761b6308f14eebe98ccdb1949de6c4b99/src/main/java/goQuality/integerous/controller/PostRestController.java#L55)
  - Controller에서는 요청을 화면단에서 넘어온 요청을 받고, Service 계층에 로직 처리를 위임합니다.

- **결과 응답** :pushpin: [코드 확인]()
  - Service 계층에서 넘어온 로직 처리 결과(메세지)를 화면단에 응답해줍니다.


