<%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.utils.Paginations" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

</head>

<body class="bg-light">
    <header>
        <!-- 상단 네비게이션 바 -->
        <%@ include file="/WEB-INF/views/Fitness/Header.jsp" %> 
    </header>
    
    <%
    HashMap params = (HashMap) request.getAttribute("params");
    String searchStr = (String) params.getOrDefault("search", "");
    HashMap result = (HashMap) request.getAttribute("result");
    %>
    <div class="container">
        <!-- 관리자 페이지 content -->
        <div class="row g-20 vh-50">
            <nav class="p-5 bg-dark navbar-dark d-md-block col-2">
                <div>
                    <ul class="list-unstyled navbar-nav">
                        <li class="d-flex align-items-center">
                            <a href="./admin_users.html" class="text-decoration-none nav-link fs-5 fw-bold">관리자페이지</a>
                        </li>
                        <li class="d-flex align-items-center">
                            <a href="./AdminPage.html" class="text-decoration-none nav-link">회원 관리</a>
                        </li>
                        <li class="d-flex align-items-center">
                            <a href="../Fitness/common_noticePage_test.jsp" class="text-decoration-none nav-link">게시판 관리</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- 회원관리 데이터 -->
            <div class="col-10 admin-content">
                <h1 class="admin-header">게시판 관리</h1>
                <div class="admin-table">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 9%;">번호</th>
                                <th style="width: 20%;">이름</th>
                                <th>년도</th>
                                <th style="width: 27%;">자동차 ID</th>
                                <th style="width: 10%;">회사 ID</th>
                                <th>상세정보</th>
                                <th>삭제</th>
                                <form>
                                <th><button class="btn btn-secondary" formaction="/carInfor/insertAndcome" formmethod="get">등록</button></th>
                                <th><button class="btn btn-secondary" formaction="/carInfor/selectDetail/{CAR_INFOR_ID}" formmethod="get">버튼</button></th>
                                </form>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                            ArrayList resultList = (ArrayList)result.get("resultList");
                            for(int i=0; i < resultList.size(); i=i+1){
                            HashMap record = (HashMap)resultList.get(i);
                            %>
                            <form >
                                <input type="hidden" name="CAR_INFOR_ID" value='<%= record.get("CAR_INFOR_ID") %>' id="">
                            <tr>
                                <td><%= i+1 %></td>
                                <td><%= record.get("CAR_NAME") %></td>
                                <td><%= record.get("YEAR") %></td>                      
                                <td><%= record.get("CAR_INFOR_ID") %></td>
                                <td><%= record.get("COMPANY_ID") %></td>
                                <td><button class="btn btn-danger" formaction='/carInfor/selectDetail/<%= record.get("CAR_INFOR_ID") %>' formmethod="get" >상세정보</button></td>
                                <td><button class="btn btn-danger" formaction="/carInfor/deleteAndSelectSearch" formmethod="get" onclick="alert()">삭제</button></td>
                                </td>
                            </tr>
                            <!-- 다른 게시글 데이터 추가 -->
                            </form>
                            <%
                            }
                            %>
                        </tbody>
                    </table>
                </div>
                <!-- 페이지 넘어가는 표시 -->
                <!-- <div class="text-center mt-4">
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
                </div> -->

                <%
                Paginations paginations = (Paginations)result.get("paginations"); 
                %>
                <div>총 갯수 : <%= paginations.getTotalCount() %></div>
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="/carInfor/selectSearch?currentPage=<%= paginations.getPreviousPage() %>">Previous</a>
                        </li>

                        <%
                        for(int i=paginations.getBlockStart();i <= paginations.getBlockEnd(); i=i+1){
                        %>
                        <li class="page-item">
                            <a class="page-link" href="/carInfor/selectSearch?currentPage=<%= i %>"><%= i %></a>
                        </li>
                        <%
                        }
                        %>
                        <!--li class="page-item">
                            <a class="page-link" href="/carInfor/map/selectSearch?currentPage=1">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="/carInfor/map/selectSearch?currentPage=2">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="/carInfor/map/selectSearch?currentPage=3">3</a>
                        </li-->

                        <li class="page-item">
                            <a class="page-link" href="/carInfor/selectSearch?currentPage=<%= paginations.getNextPage() %>">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    </div>


    <!-- Footer -->
    <footer >
        <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %> 
    </footer>




    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>