<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.util.HashMap, java.util.ArrayList" %>

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
        <!-- 마이페이지 -->
        <div class="container p-5">
          <div class="row">
            <div class="col-md-4">
              <h2>회원정보</h2>
              <div class="fs-5 fw-bold border-bottom border-3 border-dark border-opacity-50 pb-2 text-dark"></div>
              <table class="table boder-top">
                <% ArrayList list1=(ArrayList)request.getAttribute("result"); %>
                  <% HashMap result=(HashMap)list1.get(0); %>
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
              <div class="text-lg-end">
                <a href="/mypageModify.html" type="submit" class="btn btn-secondary" style="opacity: 0.8;">회원정보수정</a>
              </div>
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
                  <% ArrayList list=(ArrayList)request.getAttribute("result"); %>
                    <% for(int i=0; i<list.size(); i++){ HashMap record=(HashMap)list.get(i); %>
                      <tr>
                        <td>
                          <%= record.get("RESERVATION_DATE") %>
                        </td>
                        <td>
                          <%= record.get("RESERVATION_TIME") %>
                        </td>
                        <td>
                          <%= record.get("COMPANY_NAME") %>
                        </td>
                        <td>
                          <%= record.get("NOTES") %>
                        </td>
                        <th><button type="submit" class="btn btn-outline-secondary mx-1"
                            style="opacity: 0.8;">수정</button>
                        </th>
                        <th><button type="submit" class="btn btn-danger mx-1" style="opacity: 0.8;">삭제</button></th>
                      </tr>

                      <!-- 다른 예약 내역 추가 -->
                      <% } %>
                </tbody>
              </table>
            </div>
          </div>
        </div>


        <!-- Footer -->
        <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

          <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
          <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>

    </html>