<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>운동 시설 찾아주는 홈페이지</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
      <link rel="stylesheet" href="/CSS/mainmenu.css">
      <link rel="stylesheet" href="/CSS/reviews.css">
    </head>

    <body>
      <!-- 상단 네비게이션 바 -->
      <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>
        <sec:authentication property="principal" var="userDetailsBean" />

        <!-- 검색 부분 -->

        <h1 style="text-align: center; margin-top: 1cm; margin-bottom: 1cm;">REVIEW</h1>
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-md-6">
              <div class="input-group">
                <div class="input-group-prepend">
                  <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">선택</button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="#" onclick="setInputType('select')">위치</a>
                    <a class="dropdown-item" href="#" onclick="setInputType('text')">지점명</a>
                  </div>
                </div>
                <input type="text" class="form-control" id="inputText" placeholder="선택" readonly>
                <div class="input-group-append">
                  <button class="btn btn-primary">검색</button>
                </div>
              </div>
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
                    <th>작성일</th>
                    <th>별점</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>
                      <a href="https://gymboxx.co.kr/" title="구로-짐박스" style="font-weight: 500;">짐박스피트니스 구로디지털단지점</a>
                    </td>
                    <td>리뷰내용</td>
                    <td>djfid</td>
                    <td>2023-07-15</td>
                    <td>
                      4.0 <span class="yellow-star"> ★★★★</span>&nbsp; (29)
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!-- 글작성 버튼 -->
            <sec:authorize access="isAuthenticated()">
            <div class="container text-end">
              <a href="/Reviewmemo" class="btn btn-secondary">글작성</a>
            </div>
            </sec:authorize>
          </div>
        </div>

        <!-- 페이지 넘어가는 표시 -->
        <div class="text-center mt-4">
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
        </div>

        <!-- footer -->
        <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>

          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
          <script>
            function setInputType(type) {
              if (type === 'select') {
                var selectMenu = document.createElement('select');
                selectMenu.className = 'form-control';
                selectMenu.id = 'selectMenu';
                var locations = ['서울시 강남구', '서울시 강동구', '서울시 강북구', '서울시 강서구', '서울시 관악구', '서울시 광진구', '서울시 구로구', '서울시 금천구', '서울시 노원구', '서울시 도봉구', '서울시 동대문구', '서울시 동작구', '서울시 마포구', '서울시 서대문구', '서울시 서초구', '서울시 성동구', '서울시 성북구', '서울시 송파구', '서울시 양천구', '서울시 영등포구', '서울시 용산구', '서울시 은평구', '서울시 종로구', '서울시 중구', '서울시 중랑구'];
                for (var i = 0; i < locations.length; i++) {
                  var option = document.createElement('option');
                  option.text = locations[i];
                  selectMenu.appendChild(option);
                }
                document.getElementById('inputText').replaceWith(selectMenu);
              } else {
                var inputText = document.createElement('input');
                inputText.type = 'text';
                inputText.className = 'form-control';
                inputText.id = 'inputText';
                inputText.placeholder = '지점명 입력';
                document.getElementById('selectMenu').replaceWith(inputText);
              }
            }
          </script>
    </body>

    </html>