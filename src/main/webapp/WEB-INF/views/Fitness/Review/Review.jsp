<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.utils.Paginations" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>리뷰 페이지</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

        <link rel="stylesheet" href="/CSS/mainmenu.css">
        <link rel="stylesheet" href="/CSS/reviews.css">
      </head>

      <body>
        <sec:authentication property="principal" var="userDetailsBean" />
        <!-- 상단 네비게이션 바 -->
        <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>


          <!-- 검색 부분 -->
          <% HashMap params=(HashMap) request.getAttribute("params"); 
          String searchStr=(String)params.getOrDefault("search", "" );
          %>
          <h1 style="text-align: center; margin-top: 1cm; margin-bottom: 1cm;"><strong>REVIEW</strong></h1>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-md-6">
                <form action="">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <select class="btn btn-outline-secondary custom-select" type="button" id="search-option"
                        name="search">
                        <option value="choose">선택</option>
                        <option value="COMPANY_NAME" <%=(searchStr.equals("COMPANY_NAME")) ? "selected" : "" %>
                          >업체명
                        </option>
                        <option value="ID" <%=(searchStr.equals("ID")) ? "selected" : "" %>>작성자</option>
                      </select>
                    </div>
                    <input type="text" class="form-control" name="words" placeholder="검색어를 입력하세요" id="search-input">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="submit" formaction="/Review" formmethod="get">검색</button>
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
                      <th>번호</th>
                      <th>업체명</th>
                      <th>리뷰</th>
                      <th>작성자</th>
                      <th>별점</th>
                      <th>감성예측</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% HashMap list=(HashMap) request.getAttribute("result"); 
                    ArrayList map=(ArrayList) list.get("resultList"); 
                    for(int i=0; i < map.size(); i=i+1) { 
                      HashMap record=(HashMap) map.get(i);
                      %>
                      <tr>
                        <td>
                          <%= i+1 %>
                        </td>
                        <td>
                          <a href='https://map.naver.com?query=<%= record.get("ADDRESS") %>'
                            style="font-weight: 500;" target="_blank">
                            <%= record.get("COMPANY_NAME") %>
                          </a>
                        </td>
                        <td>
                          <%= record.get("REVIEW") %>
                          <input type="hidden" class="review-value" id="reviewvalue" value="<%= record.get("REVIEW") %>">
                        </td>
                        <td>
                          <%= record.get("ID") %>
                        </td>
                        <td>
                          <%= record.get("GRADE") %>
                            <div class="star-rating">
                              <% int grade=(int) record.get("GRADE"); %>
                                <% for (int s=1; s <=5; s++) { %>
                                  <% if (s <=grade) { %>
                                    <span class="star-filled">&#9733;</span>
                                    <% } else { %>
                                      <span class="star">&#9733;</span>
                                      <% } %>
                                        <% if (s==grade) { break;} %>
                                          <% } %>
                            </div>
                        </td>
                        <td>
                          <%= record.get("SENTIMENT") %>
                        </td>
                      </tr>
                      <% } %>
                  </tbody>
                </table>
              </div>
              <!-- 글작성 버튼 -->
              <sec:authorize access="isAuthenticated()">
                <div class="container text-end">
                  <a href="/CompanyNameSearch" class="btn btn-secondary">글작성</a>
                </div>
              </sec:authorize>
            </div>


            <!-- 페이지 넘어가는 표시 -->
            <% Paginations paginations=(Paginations)list.get("paginations"); %>
              <% if ( paginations !=null){ %>
                <div>
                  <div class="text-center mt-4">
                    <ul class="pagination justify-content-center">
                      <li class="page-item">
                        <a class="page-link"
                          href='/Review?currentPage=<%= paginations.getPreviousPage() %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>'>Previous</a>
                        </a>
                      </li>

                      <% for(int i=paginations.getBlockStart();i <=paginations.getBlockEnd(); i=i+1){ %>
                        <li class="page-item">
                          <a class="page-link" href='/Review?currentPage=<%= i %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>'>
                            <%= i %>
                          </a>
                        </li>
                        <% } %>
                          <li class="page-item">
                            <a class="page-link" href='/Review?currentPage=<%= paginations.getNextPage() %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>'>Next</a>
                            </a>
                          </li>
                    </ul>
                  </div>
                </div>
          </div>
          <% } else { %>
            <% } %>
              <!-- footer -->
              <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
                <script src="/js/review.js"></script>
      </body>
      </html>