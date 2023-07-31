# [THE GLORY] 1차 프로젝트 (Project_Fitness)
### ■ 프로젝트 기간 : 2023.07.07 - 2023.07.28
### ■ 팀원 : 김민정, 김혜인, 봉원희, 임거산
### ■ 사이트 : [ProjectFitness](https://project-fitness-ddxja.run.goorm.site/)
### ![main](src/main/resources/static/Image/README/main.png)
### ■ 프로젝트 소개
   : 이 프로젝트는 무엇이고 왜 필요한지 간략하게 소개합니다.
   1. 합리적인 가격 정보 부재
   2. 헬스케어 시설의 리뷰를 찾기 어려움
   3. 상담 예약 기능의 미비<br> 위 불편사항을 해소하기 위해 이용자가 원하는 시설을 쉽고 빠르게 검색하고 상담 예약까지 할 수 있도록 도와주는 사이트
### ■ Stacks
* 사용언어 : HTML, CSS, JavaScript, Java
* 기술 : JSP, JQuery, Ajax
* 프레임워크 : SpringBoot, Spring Security, Bootstrap
* 개발툴 : Visual Studio Code
* DB: MySQL, MyBatis
-------------------------------
# 프로젝트 진행
### ■ [의뢰서](https://drive.google.com/file/d/1lblekpdEg2pe1_rxwwxioMyzvDHQJ29q/view?usp=drive_link)
![image](https://github.com/estskyway/project_fitness/assets/132973368/cf90839b-4581-40fa-92bd-08112727f565)
### ■ [NamingRule](src/main/resources/static/Image/README/네이밍룰.png) ![NamingRule](src/main/resources/static/Image/README/네이밍룰.png)
### ■ [DB구성](DOCS/database/Fitness/main.png) ![ERD](https://github.com/estskyway/project_fitness/assets/132973368/bf9c3d9a-1869-49f0-ac34-dfd82b0d03ce)
### ■ [요구사항 정의서](https://docs.google.com/spreadsheets/d/1jdIUc4vH_-bnxaLaqOzVPo4ezpznmvHz/edit?usp=sharing&ouid=109657498147653913589&rtpof=true&sd=true)
![image](https://github.com/estskyway/project_fitness/assets/132973368/8c641b6a-4aa5-4ed0-a29b-fba95e4d8e99)
### ■ 팀원별 구현 기능
-**김민정**
|프론트엔드|백엔드|
|----------|-------|
|(**로그인**) 로그아웃/후기작성/회원정보수정/상담예약/회원정보<br>(**관리자**) 게시판관리/회원정보관리/공지사항관리/메인화면/로그인/로그아웃|(**비로그인**) 메인화면<br>(**관리자**) 게시판관리/공지사항관리|

-**김혜인**
|프론트엔드|백엔드|
|----------|-------|
|(**비로그인**) 메인화면/회원가입/로그인/게시판/검색화면<br>(**로그인**) 메인화면/게시판/게시물작성/후기화면/검색화면|(**비로그인**) 검색화면<br>(**로그인**) 후기화면/후기작성화면/회원정보수정/상담예약<br>(**관리자**) 예약관리|

-**봉원희**
|프론트엔드|백엔드|
|----------|-------|
|(**관리자**) 관리자권한부여|(**비로그인**) 회원가입/로그인<br>(**로그인**) 메인화면/검색화면/로그아웃/회원정보/관리자권한부여|

-**임거산**
|프론트엔드|백엔드|
|----------|-------|
||**기초코드작성** <br>(**비로그인**) 게시판<br>(**로그인**) 메인화면/게시판/게시물작성|

### ■ 화면 구성
1. 검색
   ![SEARCH](https://github.com/estskyway/project_fitness/assets/132973368/7cb548d6-3480-4ef8-a881-9a6ee93b13f3)
2. 로그인/로그아웃
   
4. 로그인/로그아웃
5. 회원가입
6. 마이페이지
7. 커뮤니티
8. 관리자
### ■ 주요 기능
### ■ 주요 코드

### ■ [구현 영상](https://www.youtube.com/watch?v=XolvrvT9olQ&feature=youtu.be)

### ■ 차후 구현 예정 기능   
* 메뉴 : 메뉴바 하단에 운동별 카테고리 추가 후 클릭 시 지역별로 검색 결과가 도출될 수 있게 구성할 예정

# 프로젝트 종료
### 느낀점
  - 봉원희 (PM)<br>PM으로써 프로젝트 의뢰 PPT 부터 순탄하지 못한 시작을 하게된 점에 대한 미안한 마음을 가지고 프로젝트를 시작하게 되었습니다. 그러함에도 1차 성과가 어느정도 마무리 된듯한 결과를 볼 수 있어서 한결 마음이 가벼워지는 것을 느낍니다. 확실이 프로젝트를 진행하면서 많은 것을 다시금 배우고 느끼는 계기가 되었습니다. 기본적인 CRUD 구성을 하는 것은 물론이고, 후기 항목에서 업체명을 이용하여 네이버맵으로 직접적인 링크를 적용하는 것, 처음으로 데이터베이스를 구성해 점, MYPAGE를 작성할때 예약내용이 없는 상태에서 나오는 에러를 발생하지 않게 하는 법 등 진행을 하면서 수업 진행만으로 알 수 없는 또 다른 상황에 대해 고민할 수 있었던 점에서 힘들었지만 좋았습니다. 길다고 생각했던 3주간의 프로젝트가 순식간에 지나갔고 진행하는 과정에서 잘 따라와준 팀원들에게 감사하고, 2차에는 더 나아진 구성을 보여 주었으면 좋겠습니다.
  - 김민정
  - 김혜인
  - 임거산
