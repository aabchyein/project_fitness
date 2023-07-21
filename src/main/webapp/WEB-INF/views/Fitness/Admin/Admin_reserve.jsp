
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관리자 게시판 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <link rel="stylesheet" href="./CSS/AdminPage.css">
    <link rel="stylesheet" href="./CSS/mainmenu.css">
</head>

<body>
        <!-- 상단 네비게이션 바 -->
        <nav class="navbar navbar-expand-lg bg-black">
            <div class="container">
                <a class="navbar-brand" href="./gym.html">
                    <img src="./Image/로고1.png" alt="로고" height="80">
                </a>
                <!-- 검색창 -->
                <div class="col-lg-4 text-lg-end">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="./gym.html">홈</a>
                        </li>
                       
                        <li class="nav-item">
                            <a class="nav-link" href="./AdminPage.html">관리자</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="loginDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로그아웃</a>
                            <div class="dropdown-menu" aria-labelledby="loginDropdown">
                                <a class="dropdown-item" href="./Logout.html">로그아웃</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./AdminLogin.html">
                                <img src="./Image/house.jpg.png"
                                    style="width: 35px; height: 35px;  margin-top: -0.5em;">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

    <div class="container-fluid">
        <!-- 관리자 페이지 content -->
        <div class="row g-20 vh-50">
            <nav class="p-5 bg-dark navbar-dark d-md-block col-2">
                <div>
                    <ul class="list-unstyled navbar-nav">
                        <li class="d-flex align-items-center">
                            <a href="./AdminPage.html"
                                class="text-decoration-none nav-link fs-5 fw-bold">관리자페이지</a>
                        </li>
                        <li class="d-flex align-items-center">
                            <a href="./AdminPage.html" class="text-decoration-none nav-link">회원 관리</a>
                        </li>
                        <li class="d-flex align-items-center">
                            <a href="./Admin_reserve.jsp" class="text-decoration-none nav-link">예약 관리</a>
                        </li>
                        <li class="d-flex align-items-center">
                            <a href="./Admin_board.html" class="text-decoration-none nav-link">게시판 관리</a>
                        </li>
                        <li class="d-flex align-items-center">
                            <a href="./Admin_notice.html" class="text-decoration-none nav-link">공지사항 관리</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- 회원관리 데이터 -->
            <div class="col-10 mt-5 admin-content">
                <h1 class="admin-header">예약 관리</h1>
                <div class="admin-table">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>이름</th>
                                <th>아이디</th>
                                <th>예약날짜</th>
                                <th>예약시간</th>
                                <th>센터명</th>
                                <th>참고사항</th>
                                <th>확인</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>홍길동</td>
                                <td>honggildong</td>
                                <td>2023-07-01</td>
                                <td>10:00-11:00</td>
                                <td>구로센터</td>
                                <td>처음 운동 시작</td>
                                <td class="admin-actions">
                                    <button class="btn btn-light">수정</button>
                                    <button class="btn btn-danger">삭제</button>
                                </td>
                            </tr>
                        </tbody>

                         </table>
                </div>
                <!-- 페이지 넘어가는 표시 -->
                <div class="text-center mt-4">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&lt;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&gt;</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- 등록 모달 -->
    <div class="modal fade" id="registrationModal" tabindex="-1" aria-labelledby="registrationModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="registrationModalLabel">게시글 등록</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- 등록 폼 내용 -->
                 
                    <form>
                        <div class="mb-3">
                            <label for="name" class="form-label">작성자</label>
                            <input type="text" class="form-control" id="name" placeholder="작성자를 입력하세요">
                        </div>
                        <div class="mb-3">
                            <label for="date" class="form-label">작성일자</label>
                            <input type="date" class="form-control" id="date">
                        </div>
                        <div class="mb-3">
                            <label for="title" class="form-label">제목</label>
                            <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요">
                        </div>
                        <div class="mb-3">
                            <label for="question" class="form-label">질문 내용</label>
                            <textarea class="form-control" id="question" rows="3" placeholder="질문 내용을 입력하세요"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="answer" class="form-label">답변 내용</label>
                            <textarea class="form-control" id="answer" rows="3" placeholder="답변 내용을 입력하세요"></textarea>
                        </div>
                        
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">등록</button>
                    
                </div>
            </div>
        </div>
    </div>

   <!-- Footer -->
   <footer class="footer container-fluid text-white">
    <div class="row">
      <div class="col-10 justify-content-center">
        <div>
          <div class="footer-content">
            <div class="footer-section links" style="text-align: left;">
              <a href="#">홈 | </a></li>
              <a href="#"> 서비스 |</a></li>
              <a href="#"> 제품 | </a></li>
              <a href="#"> 블로그</a></li>
            </div>
          </div>
        </div>
        <div class="footer-center" style="text-align: left;">
          <p>더글로리Co.| 대표:백구 | 개인정보보호책임자 : 백구 | 사업자등록번호 : 23-202307121</P>
          <p>통신판매신고번호 : 2023-직업학교-0711 | 주소 : 서울시 구로구</p>
        </div>
        <div class="footer-bottom" style="text-align: left;">
          <p>저작권 © 더글로리Co. All rights reserved.</p>
        </div>

      </div>
      <div class="col-2" style="text-align: left;">
        <div id="callcenter">
          <P>고객센터 : 09 ~ 18시</P>
        </div>
        <div id="infors">
          <p>전화번호 : 032-1587-4824</p>
          <P>E-MAIL : theGlroy@glroy.com</P>
        </div>
      </div>
    </div>
  </footer>
    <script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>