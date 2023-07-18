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
    <%@ include file="/WEB-INF/views/Fitness/LoginHeader.jsp" %>

      <!-- 검색창 -->
      <form class="d-flex col-lg-5">
        <input class="form-control search-input me-2" type="search" placeholder="검색" aria-label="Search">
        <button class="btn btn-outline-success" type="submit" formaction="./Search.html">검색</button>
      </form>
      <div class="col-lg-4 text-lg-end">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="./gym_login.html">홈</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="./reserve.html">예약</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="communityDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">커뮤니티</a>
            <div class="dropdown-menu" aria-labelledby="communityDropdown">
              <a class="dropdown-item" href="./notice.html">게시판</a>
              <a class="dropdown-item" href="./notice.html">후기</a>
            </div>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="./Login.html" id="loginDropdown" role="button"
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로그아웃</a>
            <div class="dropdown-menu" aria-labelledby="loginDropdown">
              <a class="dropdown-item" href="./Logout.html">로그아웃</a>
              <a class="dropdown-item" href="./mypage.html">마이페이지</a>

            </div>
          </li>
        </ul>
      </div>
      </nav>
      <!-- 마이페이지 -->
      <div class="container p-5">
        <h2 class="text-center fw-bold p-3">회원 정보 수정</h2>
        <div class="card-body">
          <form class="m-4">
            <div class="mb-3">
              <label for="id" class="form-label">아이디</label>
              <em class="required" style="color:red">*</em>
              <input type="text" id="id" class="form-control" value="Park" readonly>
            </div>
            <div class="mb-3">
              <label for="name" class="form-label">이름</label>
              <em class="required" style="color:red">*</em>
              <input type="text" id="name" class="form-control" value="홍길동">
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">비밀번호</label>
              <em class="required" style="color:red">*</em>
              <input type="password" id="password" class="form-control" value="1234">
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">비밀번호 확인</label>
              <em class="required" style="color:red">*</em>
              <input type="password" id="passwordcheck" class="form-control" value="1234">
            </div>
            <div class="mb-3">
              <label for="birthdate" class="form-label">생년월일</label>
              <input type="date" id="birthdate" class="form-control" value="1995-05-21">
            </div>
            <div class="mb-3">
              <label for="gender" class="form-label">성별</label>
              <select id="gender" class="form-control">
                <option value="남자">남자</option>
                <option value="여자">여자</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="phone" class="form-label">휴대전화</label>
              <input type="text" id="phone" class="form-control" value="010-0000-0000">
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">이메일</label>
              <input type="email" id="email" class="form-control" value="abcde@naver.com">
            </div>
            <div class="mb-3">
              <label for="address" class="form-label">주소</label>
              <input type="text" id="address" class="form-control" value="서울시 구로구 행복동">
            </div>
          </form>
        </div>
        <div class="card-footer d-flex justify-content-end">
          <a href="./mypage.html" type="button" class="btn btn-secondary me-2">취소</a>
          <button type="submit" class="btn btn-dark" data-toggle="modal" data-target="#completionModal"
            onclick="showConfirmation()">
            완료
          </button>
        </div>
      </div>
      </div>
      </div>


      <!-- Footer -->
      <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script>
          function showConfirmation() {
            // Perform any necessary validation or checks before showing the confirmation alert
            const name = document.getElementById("name").value;
            const password = document.getElementById("password").value;
            const passwordcheck = document.getElementById("passwordcheck").value;
            const gender = document.getElementById("gender").value;
            const phone = document.getElementById("phone").value;
            const email = document.getElementById("email").value;
            const address = document.getElementById("address").value;


            if (name && password && passwordcheck && gender && phone && email && address) {
              // All fields are filled, show confirmation alert
              alert("정보 변경이 완료되었습니다");
              move();
            } else {
              // Show error message or perform any necessary actions if the fields are not filled
              alert("정보를 입력해주세요");
            }
          }

          function move() {
            window.location.href = "./mypage.html";
          }
        </script>
  </body>

  </html>