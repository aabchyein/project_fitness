<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.utils.Paginations" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>관리자 공지사항</title>
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
                        <!-- 회원관리 데이터 -->
                        <div class="col-10 mt-5 admin-content">
                            <% HashMap params=(HashMap) request.getAttribute("params"); String searchStr=(String)
                                params.getOrDefault("search", "" ); HashMap result=(HashMap)
                                request.getAttribute("result"); %>
                                <h1 style="text-align: center; margin-top: 1cm; margin-bottom: 1cm;"><strong>공지사항
                                        관리</strong></h1>
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-md-6">
                                            <form>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <select class="btn btn-outline-secondary custom-select"
                                                            type="button" id="search-option" name="search">
                                                            <option value="choose">선택</option>
                                                            <option value="NOTICE_TITLE"
                                                                <%=(searchStr.equals("NOTICE_TITLE")) ? "selected" : ""
                                                                %>
                                                                >제목
                                                            </option>
                                                            <option value="NOTICE_CONTENTS"
                                                                <%=(searchStr.equals("NOTICE_CONTENTS")) ? "selected"
                                                                : "" %>
                                                                >내용</option>
                                                            <option value="ID" <%=(searchStr.equals("ID")) ? "selected"
                                                                : "" %>>작성자</option>
                                                        </select>
                                                    </div>
                                                    <input type="text" class="form-control" name="words"
                                                        placeholder="검색어를 입력하세요" id="search-input">
                                                    <div class="input-group-append">
                                                        <button class="btn btn-primary" type="submit"
                                                            formaction="/notice/Notice" formmethod="get">검색</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <!-- 테이블 -->
                                <div class="text-center container">
                                    <div class="justify-content-between row p-5 m-3 h6 text-start">
                                        <div class="col">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th style=""><strong>번호</strong></th>
                                                        <th style=""><strong>제목</strong></th>
                                                        <th style="">작성자</th>
                                                        <th style="">날짜</th>
                                                        <th style="">조회수</th>
                                                        <th style="">수정</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% ArrayList resultList=(ArrayList)result.get("resultList"); for(int
                                                        i=0; i < resultList.size(); i=i+1){ HashMap
                                                        record=(HashMap)resultList.get(i); %>
                                                        <tr>
                                                            <td>
                                                                <%= i+1 %>
                                                            </td>
                                                            <td>
                                                                <%= record.get("NOTICE_TITLE") %>
                                                            </td>
                                                            <td>
                                                                <%= record.get("ID") %>
                                                            </td>
                                                            <td>
                                                                <%= record.get("NOTICE_DATE") %>
                                                            </td>
                                                            <td>
                                                                <%= record.get("NOTICE_VIEWS") %>
                                                            </td>
                                                            <form>
                                                                <td class="admin-actions">
                                                                    <form action="">

                                                                        <button type="submit" class="btn btn-secondary"
                                                                            formaction="#" formmethod="get">등록</button>
                                                                    </form>
                                                                    <form action="">
                                                                        <button class="btn btn-danger" formaction="#"
                                                                            formmethod="get">삭제</button>
                                                                    </form>
                                                                </td>
                                                            </form>
                                                        </tr>
                                                        <% } %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
<!-- 
                                등록 모달
                                <div class="modal fade" id="registrationModal" tabindex="-1"
                                    aria-labelledby="registrationModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="registrationModalLabel">게시글 등록</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <!-- 등록 폼 내용 -->
<!-- 
                                                <form>
                                                    <div class="mb-3">
                                                        <label for="name" class="form-label">작성자</label>
                                                        <input type="text" class="form-control" id="name"
                                                            placeholder="작성자를 입력하세요" readonly>>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="date" class="form-label">작성일자</label>
                                                        <input type="date" class="form-control" id="date">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="title" class="form-label">제목</label>
                                                        <input type="text" class="form-control" id="title"
                                                            placeholder="제목을 입력하세요" readonly>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="question" class="form-label">질문 내용</label>
                                                        <textarea class="form-control" id="question" rows="3"
                                                            placeholder="질문 내용을 입력하세요" readonly></textarea>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="answer" class="form-label">답변 내용</label>
                                                        <textarea class="form-control" id="answer" rows="3"
                                                            placeholder="답변 내용을 입력하세요"></textarea>
                                                    </div>

                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary"
                                                    data-bs-dismiss="modal">등록</button>

                                            </div>
                                        </div>
                                    </div>
                                </div> -->
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
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>