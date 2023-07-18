<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/CSS/mainmenu.css">
  </head>

  <body>
    <!-- 상단 네비게이션 바 -->
    <%@ include file="/WEB-INF/views/Fitness/Header.jsp" %>

      <div class="container p-5">
        <h2 class="text-center fw-bold p-3">회원 가입</h2>
        <p class="text-center "><em class="required">*</em> 해당 표시가 돼있는 항목은 필수 입력사항입니다.</p>
        <form>
          <div class="mb-3">
            <label for="inputName" class="form-label"><em class="required">*</em> 이름</label>
            <input type="text" class="form-control" id="inputName" name="name" required>
          </div>
          <div class="mb-3">
            <label for="inputUsername" class="form-label"><em class="required">*</em> 아이디</label>
            <input type="text" class="form-control" id="inputUsername" name="ID" required>
          </div>
          <div class="mb-3">
            <label for="inputPassword" class="form-label"><em class="required">*</em> 비밀번호</label>
            <input type="password" class="form-control" id="inputPassword" name="password" required>
          </div>
          <div class="mb-3">
            <label for="inputConfirmPassword" class="form-label"><em class="required">*</em> 비밀번호 확인</label>
            <input type="password" class="form-control" id="inputConfirmPassword" name="confirmpassword" required>
          </div>
          <div class="mb-3">
            <label for="gender">성별</label>
            <br>
            <div class="form-check form-check-inline row">
              <div class="col-sm-10 mb-3">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="gender" id="gender_male" value="male">
                  <label class="form-check-label" for="gender_male">남성</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="gender" id="gender_female" value="female">
                  <label class="form-check-label" for="gender_female">여성</label>
                </div>
              </div>
            </div>
            <div class="mb-3">
              <label for="birthdate">생년월일:</label>
              <input type="text" class="form-control" id="birthdate" name="birthdate" placeholder="YYYY-MM-DD"
                oninput="formatDate(this)">
            </div>
            <div class="mb-3">
              <label for="inputPhoneNumber" class="form-label">휴대폰번호</label>
              <div class="input-group">
                <input type="tel" class="form-control" id="inputPhoneNumber" name="phonenumber">
                <div class="input-group-append">
                  <span class="input-group-text">
                    <div class="input-group-text">
                      <input type="checkbox" aria-label="SMS Subscription">
                    </div>SMS 수신여부
                  </span>
                </div>
              </div>
            </div>
            <div class="mb-3">
              <label for="inputEmail" class="form-label"><em class="required">*</em> 이메일</label>
              <div class="input-group">
                <input type="email" class="form-control" id="inputEmail" name="email" required>
                <div class="input-group-append">
                  <span class="input-group-text">
                    <div class="input-group-text">
                      <input type="checkbox" aria-label="Email Subscription">
                    </div>메일 수신여부
                  </span>
                </div>
              </div>
            </div>
            <div class="mb-3">
              <label for="inputZip" class="form-label">주소</label>
              <div class="input-group">
                <input type="text" class="form-control" id="inputAddress" name="address">
              </div>
            </div>
            <div class="text-end">
              <button type="button" class="btn btn-dark" onclick="window.location.href='gym.html'">회원가입</button>
            </div>
          </div>
        </form>
      </div>

      <!-- Footer -->
      <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>
        <link rel="stylesheet" href="/js/join.js">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>

  </html>