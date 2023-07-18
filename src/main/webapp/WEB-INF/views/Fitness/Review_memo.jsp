<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="./CSS/mainmenu.css">
    <title>리뷰 작성</title>
  </head>

  <body>
    <!-- 상단 네비게이션 바 -->
    <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>

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
            <a class="nav-link" href="./Login2.html">예약</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="communityDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">커뮤니티</a>
            <div class="dropdown-menu" aria-labelledby="communityDropdown">
              <a class="dropdown-item" href="./notice.html">게시판</a>
              <a class="dropdown-item" href="./Review.html">후기</a>
            </div>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="./Logout.html">로그아웃</a>
          </li>
        </ul>
      </div>
      </nav>

      <!-- 리뷰 작성 -->
      <div class="container p-5">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title text-center">Review 작성</h5>
            <form id="reviewForm">
              <div class="form-group">
                <label for="id">ID:</label>
                <input class="form-control" type="text" name="id" id="id" required>
              </div>
              <div class="form-group">
                <label for="facility">시설명:</label>
                <input class="form-control" type="text" name="facility" id="facility" required>
              </div>
              <div class="form-group">
                <label for="content">내용:</label>
                <textarea class="form-control" id="content" rows="5" required></textarea>
              </div>
              <div class="form-group">
                <label for="rating">별점:</label>
                <div class="rating-dropdown">
                  <select id="rating" required>
                    <option value="" disabled selected hidden>별점을 선택하세요</option>
                    <option value="5">★★★★★</option>
                    <option value="4">★★★★</option>
                    <option value="3">★★★</option>
                    <option value="2">★★</option>
                    <option value="1">★</option>
                  </select>
                  <div class="stars">
                    <label for="rating5"></label>
                    <label for="rating4"></label>
                    <label for="rating3"></label>
                    <label for="rating2"></label>
                    <label for="rating1"></label>
                  </div>
                </div>
              </div>


              <div class="row">
                <div class="col-md-12 text-center">
                  <button type="submit" class="btn btn-primary" onclick="move();">작성 완료</button>
                </div>
              </div>

            </form>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>


        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  </body>
  <script>
    const ratingDropdown = document.querySelector('.rating-dropdown');
    const ratingSelect = ratingDropdown.querySelector('select');
    const ratingStars = ratingDropdown.querySelectorAll('label');

    ratingStars.forEach((star, index) => {
      star.addEventListener('click', () => {
        ratingSelect.value = index + 1;
        ratingStars.forEach((s, i) => {
          s.classList.remove('active');
          if (i <= index) {
            s.classList.add('active');
            move();
          }
        });
      });
    });

    function move() {
      window.location.href = "./Review.html"
    }
  </script>

  </html>