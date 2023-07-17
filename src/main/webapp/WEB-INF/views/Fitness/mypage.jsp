<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>운동 시설 찾아주는 홈페이지</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="./CSS/mypage.css">
  <link rel="stylesheet" href="./CSS/mainmenu.css">
</head>

<body>
  <!-- 상단 네비게이션 바 -->
  <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>

  <!-- 마이페이지 -->
  <div class="container p-5">
    <div class="row">
      <div class="col-md-4">
        <h2>회원정보</h2>
        <div class="fs-5 fw-bold border-bottom border-3 border-dark border-opacity-50 pb-2 text-dark"></div>
        <table class="table boder-top">
          <tr>
            <th>이름</th>
            <td>홍길동</td>
          </tr>
          <tr>
            <th>아이디</th>
            <td>honggildong</td>
          </tr>
          <tr>
            <th>비밀번호</th>
            <td>1234</td>
          </tr>
          <tr>
            <th>생년월일</th>
            <td>1995-05-21</td>
          </tr>
          <tr>
            <th>성별</th>
            <td>남자</td>
          </tr>
          <tr>
            <th>휴대전화</th>
            <td>010-0000-0000</td>
          </tr>
          <tr>
            <th>이메일</th>
            <td>abcde@naver.com</td>
          </tr>
          <tr>
            <th>주소</th>
            <td>서울시 구로구 행복동</td>
          </tr>
        </table>
        <div class="text-lg-end">
          <a href="./mypageModify.html" type="submit" class="btn btn-secondary" style="opacity: 0.8;">회원정보수정</a>
        </div>
      </div>
      <div class="col-md-8">
      <h2>예약 내역</h2>
      <div class="fs-5 fw-bold border-bottom border-3 border-dark border-opacity-50 pb-2 text-dark"></div>
      <table class="table">
        <thead>
          <tr>
            <th>예약 날짜</th>
            <th>예약 시간</th>
            <th>센터명</th>
            <th>참고사항</th>
            <th>수정</th>
            <th>삭제</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>2023-07-10</td>
            <td>10:00 - 11:00</td>
            <td>센터명 표시</td>
            <td>참고 내용 표시</td>
            <th><button type="submit" class="btn btn-outline-secondary mx-1" style="opacity: 0.8;">수정</button></th>
            <th><button type="submit" class="btn btn-danger mx-1" style="opacity: 0.8;">삭제</button></th>
          </tr>
          <!-- 다른 예약 내역 추가 -->
        </tbody>
      </table>
      </div>
    </div>
  </div>
  

 <!-- Footer -->
 <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>