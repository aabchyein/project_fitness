<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>관리자 회원관리 페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous" />
        <link rel="stylesheet" href="/CSS/AdminPage.css">
        <link rel="stylesheet" href="/CSS/mainmenu.css">

    </head>

    <body class="bg-light">
            <!-- 상단 네비게이션 바 -->
            <%@ include file="/WEB-INF/views/Fitness/Admin_header.jsp" %>

        <div class="container-fluid">
            <!-- 관리자 페이지 content -->
            <div class="row g-20 vh-50">
                <nav class="p-5 bg-dark navbar-dark d-md-block col-2 ">
                    <div>
                        <ul class="list-unstyled navbar-nav">
                            <li class="d-flex align-items-center">
                                <a href="#" class="text-decoration-none nav-link fs-5 fw-bold">관리자페이지</a>
                            </li>
                            <li class="d-flex align-items-center">
                                <a href="/AdminPage.html" class="text-decoration-none nav-link">회원 관리</a>
                            </li>
                            <li class="d-flex align-items-center">
                                <a href="/NoticePage.html" class="text-decoration-none nav-link">게시판 관리</a>
                            </li>
                            <li class="d-flex align-items-center">
                                <a href="/NoticePage.html" class="text-decoration-none nav-link">공지사항 관리</a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <!-- 회원관리 데이터  -->
                <div class="col-9 admin-content">
                    <h1 class="admin-header">회원 관리</h1>
                    <div class="admin-table">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th style="width: 9%;">관리번호</th>
                                    <th>이름</th>
                                    <th>아이디</th>
                                    <th>메일아이디</th>
                                    <th style="width: 30%;">확인</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>홍길동</td>
                                    <td>honggildong</td>
                                    <td>honggildong@gmail.com</td>
                                    <td class="admin-actions">
                                        <button class="btn btn-secondary" id="detailBtn">조회</button>
                                        <button class="btn btn-danger">삭제</button>
                                    </td>
                                </tr>
                                <!-- 다른 회원 데이터 추가 -->
                                <tr>
                                    <td>2</td>
                                    <td>김철수</td>
                                    <td>kimcheolsu</td>
                                    <td>kimcheolsu@gmail.com</td>
                                    <td class="admin-actions">
                                        <button class="btn btn-secondary" id="detailBtn">조회</button>
                                        <button class="btn btn-danger">삭제</button>
                                    </td>
                                </tr>
                                <!-- 추가 회원 데이터 -->
                                <tr>
                                    <td>3</td>
                                    <td>이영희</td>
                                    <td>leeyounghee</td>
                                    <td>leeyounghee@gmail.com</td>
                                    <td class="admin-actions">
                                        <button class="btn btn-secondary" id="detailBtn">조회</button>
                                        <button class="btn btn-danger">삭제</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>박민수</td>
                                    <td>parkminsus</td>
                                    <td>parkminsus@gmail.com</td>
                                    <td class="admin-actions">
                                        <button class="btn btn-secondary" id="detailBtn">조회</button>
                                        <button class="btn btn-danger">삭제</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>김지영</td>
                                    <td>kimjiyoung</td>
                                    <td>kimjiyoung@gmail.com</td>
                                    <td class="admin-actions">
                                        <button class="btn btn-secondary" id="detailBtn">조회</button>
                                        <button class="btn btn-danger">삭제</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>이철호</td>
                                    <td>leechulho</td>
                                    <td>leechulho@gmail.com</td>
                                    <td class="admin-actions">
                                        <button class="btn btn-secondary" id="detailBtn">조회</button>
                                        <button class="btn btn-danger">삭제</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>정민지</td>
                                    <td>jeongminji</td>
                                    <td>jeongminji@gmail.com</td>
                                    <td class="admin-actions">
                                        <button class="btn btn-secondary" id="detailBtn">조회</button>
                                        <button class="btn btn-danger">삭제</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>신동훈</td>
                                    <td>shindonghoon</td>
                                    <td>shindonghoon@gmail.com</td>
                                    <td class="admin-actions">
                                        <button class="btn btn-secondary" id="detailBtn">조회</button>
                                        <button class="btn btn-danger">삭제</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>9</td>
                                    <td>황미영</td>
                                    <td>hwangmiyoung</td>
                                    <td>hwangmiyoung@gmail.com</td>
                                    <td class="admin-actions">
                                        <button class="btn btn-secondary" id="detailBtn">조회</button>
                                        <button class="btn btn-danger">삭제</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>10</td>
                                    <td>장승호</td>
                                    <td>jangseungho</td>
                                    <td>jangseungho@gmail.com</td>
                                    <td class="admin-actions">
                                        <button class="btn btn-secondary" id="detailBtn">조회</button>
                                        <button class="btn btn-danger">삭제</button>
                                    </td>
                                </tr>
                            </tbody>

                        </table>


                    </div>
                    <div id="detailModal" class="modal">
                        <div class="modal-content">
                            <span class="close">&times;</span>
                            <h2>상세조회</h2>
                            <!-- 상세조회 내용을 표시할 요소들을 추가 -->
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <td>이름</td>
                                        <td>아이디</td>
                                        <td>닉네임</td>
                                        <td>이메일</td>
                                        <td>휴대폰번호</td>
                                        <td>전화번호</td>
                                        <td>주소</td>
                                        <td>참고항목</td>

                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>홍길동</td>
                                        <td>honggildong</td>
                                        <td>길동아!</td>
                                        <td>honggildong@gmail.com</td>
                                        <td>010-5325-3568</td>
                                        <td>02-358-3544</td>
                                        <td>서울시</td>
                                        <td>건강함</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
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
        <!-- Footer -->
        <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

            <script>
                // 버튼 클릭 시 모달 열기
                document.getElementById("detailBtn").addEventListener("click", function () {
                    document.getElementById("detailModal").style.display = "block";
                });

                // 모달 닫기 버튼 클릭 시 모달 닫기
                document.getElementsByClassName("close")[0].addEventListener("click", function () {
                    document.getElementById("detailModal").style.display = "none";
                });
                0
                // 모달 외부 클릭 시 모달 닫기
                window.addEventListener("click", function (event) {
                    var modal = document.getElementById("detailModal");
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                });
            </script>


            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                crossorigin="anonymous"></script>

            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>