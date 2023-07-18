<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>운동 시설 찾아주는 홈페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./CSS/mainmenu.css">

  </head>

  <body>
    <!-- 상단 네비게이션 바 -->
    <%@ include file="/WEB-INF/views/Fitness/Admin_header.jsp" %>

      <!-- 검색창 -->
      <form class="d-flex col-lg-5">
        <input class="form-control search-input me-2" type="search" placeholder="원하시는 업체명이나 지역을 검색해 보세요"
          aria-label="Search">
        <button class="btn btn-outline-success" formaction="./Search.html">검색</button>
      </form>

      <div class="col-lg-4 text-lg-end">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="./gym.html">홈</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="./AdminPage.html">관리자</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="./Join.html">회원가입</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="./AdminLogin.html">
              <img src="./Image/house.jpg.png" alt="" style="width: 35px; height: 35px;  margin-top: -0.5em;">
            </a>
          </li>


        </ul>
      </div>
      </div>
      </nav>


      <!-- Carousel -->
      <div class="carousel-container">
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="./Image/헬스3.jpg" class="d-block w-100" alt="이미지1">
            </div>
            <div class="carousel-item">
              <img src="./Image/헬스4.jpg" class="d-block w-100" alt="이미지2">
            </div>
            <div class="carousel-item">
              <img src="./Image/헬스5.jpg" class="d-block w-100" alt="이미지3">
            </div>
            <div class="carousel-item">
              <img src="./Image/헬스6.jpg" class="d-block w-100" alt="이미지3">
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>


      <!-- Footer -->
      <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>

  </html>