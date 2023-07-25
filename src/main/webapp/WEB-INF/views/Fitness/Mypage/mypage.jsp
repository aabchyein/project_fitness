<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.utils.Paginations" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>운동 시설 찾아주는 홈페이지</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
      <link rel="stylesheet" href="/CSS/mypage.css">
      <link rel="stylesheet" href="/CSS/mainmenu.css">
    </head>

    <body>
      <!-- 상단 네비게이션 바 -->
      <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>
        <% HashMap map=(HashMap)request.getAttribute("result"); %>
          <!-- 마이페이지 -->
          <div class="container p-5">
            <div class="row">
              <div class="col-md-4">
                <h2>회원정보</h2>
                <div class="fs-5 fw-bold border-bottom border-3 border-dark border-opacity-50 pb-2 text-dark"></div>
                <table class="table boder-top">
                  <% ArrayList list=(ArrayList)map.get("result"); %>
                    <% HashMap result=(HashMap)list.get(0); %>
                      <tr>
                        <th>이름</th>
                        <td>
                          <%= result.get("NAME")%>
                        </td>
                      </tr>
                      <tr>
                        <th>아이디</th>
                        <td>
                          <%= result.get("ID") %>
                        </td>
                      </tr>
                      <tr>
                        <th>비밀번호</th>
                        <td>
                          <%=result.get("PASSWORD")%>
                        </td>
                      </tr>
                      <tr>
                        <th>생년월일</th>
                        <td>
                          <%=result.get("BIRTHDATE")%>
                        </td>
                      </tr>
                      <tr>
                        <th>성별</th>
                        <td>
                          <%=result.get("GENDER")%>
                        </td>
                      </tr>
                      <tr>
                        <th>휴대전화</th>
                        <td>
                          <%=result.get("PHONE_NUMBER")%>
                        </td>
                      </tr>
                      <tr>
                        <th>이메일</th>
                        <td>
                          <%=result.get("EMAIL_ADDRESS")%>
                        </td>
                      </tr>
                      <tr>
                        <th>주소</th>
                        <td>
                          <%=result.get("ADDRESS")%>
                        </td>
                      </tr>
                </table>
                <form action="">
                  <div class="text-lg-end">

                    <button type="submit" class="btn btn-secondary" style="opacity: 0.8;" name="ID"
                      value='${userDetailsBean.username}'
                      formaction="/mypageModify">회원정보수정</button>
                  </div>
                </form>
              </div>
              <div class="col-md-8">
                <h2>예약 내역</h2>
                <div class="fs-5 fw-bold border-bottom border-3 border-dark border-opacity-50 pb-2 text-dark"></div>
                <table class="table">
                  <thead>
                    <tr>
                      <th>예약 날짜</th>
                      <th>예약 시간</th>
                      <th>센터명</th>
                      <th>참고사항</th>
                      <th>수정</th>
                      <th>삭제</th>
                    </tr>
                  </thead>

                  <tbody>
                    <% ArrayList reserlist=(ArrayList)map.get("result1"); %>
                      <% for(int i=0; i<reserlist.size(); i++) { %>
                        <% if (reserlist !=null) { %>
                        <!-- 예약이 없을때 나는 오류 방어 -->
                          <% HashMap reser=(HashMap)reserlist.get(i); %>
                            <tr>
                              <td>
                                <%= reser.get("RESERVATION_DATE") %>
                              </td>
                              <td>
                                <%= reser.get("RESERVATION_TIME") %>
                              </td>
                              <td>
                                <%= reser.get("COMPANY_NAME") %>
                              </td>
                              <td>
                                <%= reser.get("NOTES") %>
                              </td>
                              <form action="">
                                <th>
                                  <input type="hidden" name="ID" value='${userDetailsBean.username}'>
                                  <input type="hidden" name="RESERVATION_ID" value='<%= reser.get("RESERVATION_ID") %>'>
                                  <button type="submit" class="btn btn-outline-secondary mx-1" style="opacity: 0.8;"
                                    name="RESERVATION_ID" value='<%= reser.get("RESERVATION_ID") %>'
                                    formaction="/mypagereserve">수정</button>
                                </th>
                              </form>
                              <form action="">
                                <th>
                                  <input type="hidden" name="ID" value='${userDetailsBean.username}'>
                                  <button type="submit" class="btn btn-danger mx-1" style="opacity: 0.8;"
                                    name="RESERVATION_ID" value='<%= reser.get("RESERVATION_ID") %>'
                                    formaction='/mypagedelete' formmethod="post">삭제</button>
                                </th>
                              </form>
                            </tr>
                            <!-- 다른 예약 내역 추가 -->
                            <!-- 예약내용이 없을때 나오는 출력 문구 -->
                            <% } else if (reserlist==null) { %>
                              <tr>
                                <td>
                                  예약내용 이 없습니다.
                                </td>
                              </tr>
                              <% } else { %>
                                <% } %>
                                  <% } %>
                  </tbody>
                </table>
<!-- 페이지 넘어가는 표시 -->
<% HashMap record = (HashMap) map.get("result2"); %>
<% Paginations paginations=(Paginations)record.get("paginations"); %>

<% if ( paginations != null){ %>
<div>
<div class="text-center mt-4">
   <ul class="pagination justify-content-center">
       <li class="page-item">
        <a class="page-link"
        href="/mypage?currentPage=<%= paginations.getPreviousPage() %>">Previous</a>
           </a>
          </li>
          <% 
          for(int i=paginations.getBlockStart();i <=paginations.getBlockEnd(); i=i+1){ 
          %>
            <li class="page-item">
              <a class="page-link" href="/mypage?currentPage=<%= i %>"><%= i %></a>
            </li>
            <% } %>
              <!-- <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li> -->
              <li class="page-item">
                <a class="page-link" href="/mypage?currentPage=<%= paginations.getNextPage() %>">Next</a>
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

            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>

    </html>