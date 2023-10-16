<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.utils.Paginations" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>관리자 회원관리</title>
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
                       <!-- 관리자 전용 메뉴 -->
                       <%@ include file="\WEB-INF\views\Fitness\Admin\Admin_menu.jsp"%>
                        <!-- 회원관리 데이터  -->
                        <div class="col-9 mt-5 admin-content">
                            <h1 class="admin-header">회원 관리</h1>
                            <div class="admin-table">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th style="width: 9%;">번호</th>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>이메일</th>
                                            <th style="width: 30%;">확인</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        HashMap list=(HashMap)request.getAttribute("result");
                                        ArrayList lists = (ArrayList)list.get("resultList");
                                        for(int i=0; i < lists.size(); i=i+1) {
                                            HashMap record=(HashMap) lists.get(i);
                                        %>
                                        <form>
                                            <input type="hidden" name="ID" value='<%= record.get("ID") %>'>
                                            <input type="hidden" name="BOARD_ANSWER_ID" value='<%= record.get("BOARD_ANSWER_ID") %>'>
                                            <input type="hidden" name="BOARD_ID" value='<%= record.get("BOARD_ID") %>'>
                                            <tr>
                                                <td name="number">
                                                    <%= i+1 %>
                                                </td>
                                                <td name="name">
                                                    <%= record.get("NAME") %>
                                                </td>
                                                <td name="ID">
                                                    <%= record.get("ID") %>
                                                </td>
                                                <td name="address">
                                                    <%= record.get("EMAIL_ADDRESS") %>
                                                </td>
                                                <td class="admin-actions">
                                                    <button class="btn btn-secondary" id="" formaction="/adminPageDetail" formmethod="get">조회</button>
                                                    <!-- <button class="btn btn-danger" formaction="/adminPageDelete" formmethod="get">삭제</button> -->
                                                </td>
                                            </tr>
                                        </form>
                                        <% } %>
                                    </tbody>
                                </table>
                                <% String searchStr=(String)
                                list.getOrDefault("search", "" );
                                %>
                                <div class="container mt-3">
                                    <div class="row justify-content-center">
                                        <div class="col-md-6">
                                            <form>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <select class="btn btn-outline-secondary custom-select"
                                                            type="button" id="search-option" name="search">
                                                            <option value="choose">선택</option>
                                                            <option value="NAME"
                                                                <%=(searchStr.equals("NAME")) ? "selected" : ""
                                                                %>
                                                                >이름
                                                            </option>
                                                            <option value="ID" <%=(searchStr.equals("ID")) ? "selected"
                                                                : "" %>>아이디</option>
                                                        </select>
                                                    </div>
                                                    <input type="text" class="form-control" name="words"
                                                        placeholder="아이디 또는 이름을 검색하세요." id="search-input">
                                                    <div class="input-group-append">
                                                        <button class="btn btn-outline-primary" type="submit"
                                                            formaction="/adminPage" formmethod="get">검색</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 페이지 넘어가는 표시 -->
                            <% Paginations paginations=(Paginations)list.get("paginations"); %>
                            <% if ( paginations !=null){ %>
                                <div>
                                    <div class="text-center mt-4">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item">
                                                <a class="page-link"
                                                    href='/adminPage?currentPage=<%= paginations.getPreviousPage() %>&search=<%= list.getOrDefault("search", "") %>&words=<%= list.getOrDefault("words", "") %>'>Previous</a>
                                                </a>
                                            </li>

                                            <% for(int i=paginations.getBlockStart();i <=paginations.getBlockEnd();
                                                i=i+1){ %>
                                                <li class="page-item">
                                                    <a class="page-link"
                                                        href='/adminPage?currentPage=<%= i %>&search=<%= list.getOrDefault("search", "") %>&words=<%= list.getOrDefault("words", "") %>'>
                                                        <%= i %>
                                                    </a>
                                                </li>
                                                <% } %>
                                                    <li class="page-item">
                                                        <a class="page-link"
                                                            href='/adminPage?currentPage=<%= paginations.getNextPage() %>&search=<%= list.getOrDefault("search", "") %>&words=<%= list.getOrDefault("words", "") %>'>Next</a>
                                                        </a>
                                                    </li>
                                        </ul>
                                    </div>
                                </div>
                                <% } else { %>
                                    <% } %>
                        </div>
                    </div>
                </div>
                <!-- Footer -->
                <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        </body>

        </html>