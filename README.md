# :pushpin: 설문조사 API 
> 설문조사 시스템_db모델링 실습 (요구분석, 논리적 모델링, 물리적 모델링, 쿼리) 

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
이 서비스의 핵심 기능은 

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

</div>
</details>

