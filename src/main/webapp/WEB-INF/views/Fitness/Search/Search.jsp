<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.utils.Paginations" %>
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
    <!-- 상단 네비게이션 바 -->
  <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>

  <%
  HashMap params=(HashMap) request.getAttribute("params");
  String searchStr=(String) params.getOrDefault("search", "");
  ArrayList list = (ArrayList) request.getAttribute("result");
  for(int i=0; i < list.size(); i = i+1) {
    HashMap record=(HashMap) list.get(i);
 %>
 <!-- 검색 후 보여지는 화면 -->
  <div class="container m-5">
        <div>
            <div>
              <table>
                <form>
                <thead>
                  <tr>
                    <th>COMPANY_NAME</th>
                    <th>PHONE_NUMBER</th>
                    <th>ADDRESS</th>
                    <th>ROAD_ADDRESS</th>
                    <th>예약</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><%= record.get("COMPANY_NAME") %></td>
                    <td><%= record.get("PHONE_NUMBER") %></td>
                    <td><%= record.get("ADDRESS") %></td>
                    <td><%= record.get("ROAD_ADDRESS") %></td>
                    <th>
                      <input type="hidden" name="COMPANY_ID" value='<%= record.get("COMPANY_ID") %>'>
                      <button class="btn btn-primary" type="submit" formaction="/reserve">예약</button>
                    </th>
                  </tr>
                  <%
                  }
                  %>
                </tbody>
              </form>
              </table>
            </div>
        </div>
</div>
  <!-- footer -->
  <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>
  <script src="/src/main/resources/static/js/search.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>