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
                                

                                <!-- 테이블 -->
                                <form action="">
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
                                                        <% ArrayList resultList=(ArrayList)result.get("resultList");
                                                            for(int i=0; i < resultList.size(); i=i+1){ HashMap
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
                                                                            <input type="hidden" name="NOTICE_ID" value="<%= record.get("NOTICE_ID") %>">
                                                                            <input type="hidden" name="NOTICE_TITLE" value="<%= record.get("NOTICE_TITLE") %>">
                                                                            <input type="hidden" name="NOTICE_CONTENTS" value="<%= record.get("NOTICE_CONTENTS") %>">

                                                                            <button type="submit"
                                                                                class="btn btn-secondary" formaction="/AdminnoticeUpdata"
                                                                                formmethod="get">수정</button>
                                                                        </form>
                                                                        <form action="">
                                                                            <input type="hidden" name="NOTICE_ID"
                                                                                value="<%= record.get(" NOTICE_ID") %>">
                                                                            <button type="submit" class="btn btn-danger"
                                                                                formaction="/AdminnoticeDelete"
                                                                                formmethod="get">삭제</button>
                                                                        </form>
                                                                    </td>
                                                                </form>
                                                            </tr>
                                                            <% } %>
                                                            
                                                    </tbody>
                                                    

                                                </table>
                                                <div class="container mt-2">
                                                    <a href="/guest/boardmemo" class="btn btn-outline-success">글작성</a>
                                                  </div>
                                                <div class="container mt-3">
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
                                                                        <button class="btn btn-outline-primary" type="submit"
                                                                            formaction="/Adminnotice" formmethod="get">검색</button>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!-- 페이지 넘어가는 표시 -->
                                <% Paginations paginations=(Paginations)result.get("paginations"); %>
                                    <% if ( paginations !=null){ %>
                                        <div>
                                            <div class="text-center mt-4">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item">
                                                        <a class="page-link"
                                                            href='/Adminnotice?currentPage=<%= paginations.getPreviousPage() %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>'>Previous</a>
                                                        </a>
                                                    </li>

                                                    <% for(int i=paginations.getBlockStart();i
                                                        <=paginations.getBlockEnd(); i=i+1){ %>
                                                        <li class="page-item">
                                                            <a class="page-link"
                                                                href='/Adminnotice?currentPage=<%= i %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>'>
                                                                <%= i %>
                                                            </a>
                                                        </li>
                                                        <% } %>
                                                            <li class="page-item">
                                                                <a class="page-link"
                                                                    href='/Adminnotice?currentPage=<%= paginations.getNextPage() %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>'>Next</a>
                                                                </a>
                                                            </li>
                                                </ul>
                                            </div>
                                        </div>
                        </div>
                        <% } else { %>
                            <% } %>

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