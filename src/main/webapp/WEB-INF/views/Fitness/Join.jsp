<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>운동 시설 찾아주는 홈페이지</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/CSS/mainmenu.css">
</head>


<body>
<!-- 상단 네비게이션 바 -->
    <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>
  
    <div class="container p-5">
        <h2 class="text-center fw-bold p-3">회원 가입</h2>
        <p class="text-center "><em class="required">*</em> 해당 표시가 돼있는 항목은 필수 입력사항입니다.</p>
        <form>
            
          <div class="mb-3">
            <label for="inputUsername" class="form-label"><em class="required">*</em> 아이디</label>
            <input type="text" class="form-control" id="inputUsername" required>
          </div>
          <div class="mb-3">
            <label for="inputPassword" class="form-label"><em class="required">*</em> 비밀번호</label>
            <input type="password" class="form-control" id="inputPassword" required>
          </div>
          <div class="mb-3">
            <label for="inputConfirmPassword" class="form-label"><em class="required">*</em> 비밀번호 확인</label>
            <input type="password" class="form-control" id="inputConfirmPassword" required>
          </div>
          <div class="mb-3">
            <label for="inputName" class="form-label"><em class="required">*</em> 이름</label>
            <input type="text" class="form-control" id="inputName" required>
          </div>
          <div class="mb-3">
            <label for="inputNickname" class="form-label"><em class="required">*</em> 닉네임</label>
            <input type="text" class="form-control" id="inputNickname" required>
          </div>
          <div class="mb-3">
            <label for="inputEmail" class="form-label"><em class="required">*</em> 이메일</label>
            <div class="input-group">
              <input type="email" class="form-control" id="inputEmail" required>
              <div class="input-group-append">
                <span class="input-group-text"><div class="input-group-text">
                    <input type="checkbox" aria-label="Email Subscription">
                  </div>메일 수신여부</span>
                
              </div>
            </div>
          </div>
          <div class="mb-3">
            <label for="inputPhoneNumber" class="form-label">휴대폰번호</label>
            <div class="input-group">
              <input type="tel" class="form-control" id="inputPhoneNumber">
              <div class="input-group-append">
                <span class="input-group-text"> <div class="input-group-text">
                    <input type="checkbox" aria-label="SMS Subscription">
                  </div>SMS 수신여부</span>
                
              </div>
            </div>
          </div>
          <div class="mb-3">
            <label for="inputTel" class="form-label">전화번호</label>
            <input type="tel" class="form-control" id="inputTel">
          </div>
          <div class="mb-3">
            <label for="inputZip" class="form-label">우편번호</label>
            <div class="input-group">
              <input type="text" class="form-control" id="inputZip">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">주소검색</button>
              </div>
            </div>
          </div>
          <div class="mb-3">
            <label for="inputAddress" class="form-label">기본주소</label>
            <input type="text" class="form-control" id="inputAddress">
          </div>
          <div class="mb-3">
            <label for="inputAddress2" class="form-label">상세주소</label>
            <input type="text" class="form-control" id="inputAddress2">
          </div>
          <div class="mb-3">
            <label for="inputNote" class="form-label">참고항목</label>
            <textarea class="form-control" id="inputNote" rows="2"></textarea>
          </div>
          <div class="text-end">
          <button type="button" class="btn btn-dark" onclick="window.location.href='gym.html'">회원가입</button>
          </div>
        </form>
      </div>

 <!-- footer -->
 <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>