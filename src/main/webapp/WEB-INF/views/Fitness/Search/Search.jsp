<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.utils.Paginations" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>운동 시설 찾아주는 홈페이지</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
      <link rel="stylesheet" href="/CSS/mainmenu.css">
    </head>

    <body>
  <sec:authentication property="principal" var="userDetailsBean" />
      <!-- 상단 네비게이션 바 -->
      <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>
          <!-- 검색 후 보여지는 화면 -->
          <div class="container m-5">
            <div class="justify-content-between row p-5 m-3 h6 text-start">
              <div>
                <table>
                  <form>
                    <thead>
                      <tr>
                        <th>회사명</th>
                        <th>전화번호</th>
                        <th>주소</th>
                        <th>도로명주소</th>
                        <th>예약</th>
                      </tr>
                    </thead>
                    
                    <tbody>
                      <% HashMap params=(HashMap) request.getAttribute("params");
                        String searchStr=(String)params.getOrDefault("search", "" );
                        HashMap result=(HashMap) request.getAttribute("result");
                        ArrayList list=(ArrayList) result.get("resultList");
                        for(int i=0; i < list.size(); i++){
                          HashMap record=(HashMap)list.get(i);
                        %>
                      <tr>
                        <td>
                          <%= record.get("COMPANY_NAME") %>
                        </td>
                        <td>
                          <%= record.get("PHONE_NUMBER") %>
                        </td>
                        <td>
                          <%= record.get("ADDRESS") %>
                        </td>
                        <td>
                          <%= record.get("ROAD_ADDRESS") %>
                        </td>
                        <td>
                          <input type="hidden" name="COMPANY_ID" value='<%= record.get("COMPANY_ID") %>'>
                          <input type="hidden" name="COMPANY_NAME" value='<%= record.get("COMPANY_NAME") %>'>
                          <button class="btn btn-primary" type="submit" formaction="/guest/reserve" formmethod="get">예약</button>
                        </td>
                      </tr>
                      <% } %>
                    </tbody>
                  </form>
                </table>
              </div>
            </div>
          </div>
        
            <!-- pagination -->
              <% Paginations paginations=(Paginations) result.get("paginations"); %>
                <% if ( paginations !=null){ %>
                  <div>
                    <div class="text-center mt-4">
                      <ul class="pagination justify-content-center">
                        <li class="page-item">
                          <a class="page-link"
                            href='/Search?currentPage=<%= paginations.getPreviousPage() %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>'>Previous</a>
                          </a>
                        </li>
                        <% for(int i=paginations.getBlockStart();i <=paginations.getBlockEnd(); i=i+1){ %>
                          <li class="page-item">
                            <a class="page-link" href='/Search?currentPage=<%= i %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>'>
                              <%= i %>
                            </a>
                          </li>
                          <% } %>
                            <!-- <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li> -->
                            <li class="page-item">
                              <a class="page-link" href='/Search?currentPage=<%= paginations.getNextPage() %>&search=<%= params.getOrDefault("search", "") %>&words=<%= params.getOrDefault("words", "") %>'>Next</a>
                              </a>
                            </li>
                      </ul>
                    </div>
                  </div>
                  <% } else { %>
                    <% } %>

                      <!-- footer -->
                      <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>
                        <script src="/src/main/resources/static/js/search.js"></script>
                        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                        <script
                          src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>