<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.HashMap, java.util.ArrayList" %>
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
            <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>

                <div class="container-fluid">
                    <!-- 관리자 페이지 content -->
                    <div class="row g-20 vh-50">
                        <nav class="p-5 bg-dark navbar-dark d-md-block col-2 ">
                            <div>
                                <ul class="list-unstyled navbar-nav">
                                    <li class="d-flex align-items-center">
                                        <a href="/" class="text-decoration-none nav-link fs-5 fw-bold">관리자페이지</a>
                                    </li>
                                    <li class="d-flex align-items-center">
                                        <a href="/adminPage" class="text-decoration-none nav-link">회원 관리</a>
                                    </li>
                                    <li class="d-flex align-items-center">
                                        <a href="/adminReserve" class="text-decoration-none nav-link">예약 관리</a>
                                    </li>
                                    <li class="d-flex align-items-center">
                                        <a href="/fitness/AdminBoardAll" class="text-decoration-none nav-link">게시판
                                            관리</a>
                                    </li>
                                    <li class="d-flex align-items-center">
                                        <a href="/Adminnotice" class="text-decoration-none nav-link">공지사항 관리</a>
                                    </li>
                                    <li class="d-flex align-items-center">
                                        <a href="/adminPowerSetting" class="text-decoration-none nav-link">관리자 설정</a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                    <div class="col-10 mt-5 admin-content">
                        <h1 class="admin-header">관리자 설정</h1>
                        <div class="container admin-table">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>아이디</th>
                                        <th>ADMIN</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="text" name="ID">
                                        </td>
                                        <td>
                                            <input type="text" name="UNIQUE_ID">
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


                <!-- Footer -->
                <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                        crossorigin="anonymous"></script>

                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>