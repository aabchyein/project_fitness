<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<%@ page import = "com.the_glory.project_fitness.UniqueID.UniqueID" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>관리자 게시판 페이지</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                crossorigin="anonymous" />
            <link rel="stylesheet" href="/CSS/AdminPage.css">
            <link rel="stylesheet" href="/CSS/mainmenu.css">
        </head>

        <body>
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
                                        <a href="/fitness/AdminBoardAll" class="text-decoration-none nav-link">게시판 관리</a>
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

                       
                        <!-- 게시판 답변 등록 폼 -->
                        <div class="col-9 mt-5 admin-content">
                            <h1 class="admin-header text-center">게시판 답변 등록</h1>
                            <div class="container">
                                <% HashMap record=(HashMap)request.getAttribute("record"); %>
                                <% HashMap result=(HashMap)request.getAttribute("params"); %>
                                
                             
                                        <div class="mb-3">
                                            <label for="name" class="form-label">작성자</label>
                                            <input type="text" class="form-control" value='<%= record.get("ID") %>'  readonly>
                                        </div>

                                        <div class="mb-3">
                                            <label for="question" class="form-label">질문 내용</label>
                                            <input type="text" class="form-control" value='<%= record.get("CONTENTS") %>' readonly>
                                        </div>
                                        
                                        <%       
                                        UniqueID uniqueid = new UniqueID();
                                        String uuid = uniqueid.generatUuid();
                                        %>
                                    <form id="answer-form">

                                        <div class="mb-3">
                                            <label for="answer" class="form-label">답변 내용</label>
                                            <input type="text" class="form-control" id="answer" name="ANSWER"
                                                placeholder="답변 내용을 입력하세요">
                                        </div>
                                        
                                        <div>
                                            <input type="hidden" name="ADMIN_ID" value='<%= result.get("ADMIN_ID") %>'>
                                        </div>
                                        <div>
                                            <input type="hidden" name="BOARD_ANSWER_ID" value="<%= uuid %>">
                                        </div>
                                        <div>
                                            <input type="hidden" name="BOARD_ID" value='<%= result.get("BOARD_ID") %>'>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary" formaction="/fitness/insertAndSelectSearch"formmethod="get">등록</button>
                                        </div>
                                    </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- footer -->
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