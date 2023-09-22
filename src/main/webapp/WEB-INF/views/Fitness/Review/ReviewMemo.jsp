<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.utils.Paginations" %>


      <sec:authentication property="principal" var="userDetailsBean" />

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./CSS/mainmenu.css">
        <link rel="stylesheet" href="./CSS/reviews.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <title>리뷰 작성</title>
      </head>

      <body>
        <!-- 상단 네비게이션 바 -->
        <%@ include file="/WEB-INF/views/Fitness/header.jsp" %>

          <!-- 리뷰 작성 -->
          <div class="container p-5">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title text-center">Review 작성</h5>
                <form id="reviewForm">
                  <div class="form-group">
                    <label for="id">
                      <h4>작성자</h4>
                    </label>
                    <input class="form-control" type="text" name="ID" id="id" value="${userDetailsBean.memberName}"
                      required>
                  </div>
                  <form>
                    <div class="form-group">
                      <label for="facilitylist">시설명</label>
                      <input class="form-control width-50%" type="text" name="words" id="search">
                      <button type="sumbit" onclick="company();">검색</button>
                      <select id="facilitylist">
                        <%ArrayList list=(ArrayList)request.getAttribute("result"); for(int i=0; i < list.size(); i=i+1)
                          { HashMap map=(HashMap) list.get(i); %>
                          <option name="COMPANY_NAME" value="<%= map.get(" COMPANY_NAME")%>"><%=
                              map.get("COMPANY_NAME")%>
                          </option>
                          <% }%>
                      </select>
                    </div>
                  </form>
                  <div class="form-group">
                    <label for="content">내용</label>
                    <textarea class="form-control" id="content" rows="5"></textarea>
                  </div>
                  <div class="form-group">
                    <label for="rating">별점</label>
                    <div class="rating-dropdown">
                      <select id="rating">
                        <option value="" disabled selected hidden>별점을 선택하세요</option>
                        <option value="5">★★★★★</option>
                        <option value="4">★★★★</option>
                        <option value="3">★★★</option>
                        <option value="2">★★</option>
                        <option value="1">★</option>
                      </select>
                      <div class="stars">
                        <label for="rating5"></label>
                        <label for="rating4"></label>
                        <label for="rating3"></label>
                        <label for="rating2"></label>
                        <label for="rating1"></label>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12 text-center">
                      <button type="submit" class="btn btn-primary" onclick="move();">작성 완료</button>
                    </div>
                  </div>

                  <!-- <body>
                    <input type='text' id='inputSearch' />
                  </body> -->

                </form>
              </div>
            </div>
          </div>

          <!-- Footer -->
          <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>


            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
      </body>
      <script>
        const ratingDropdown = document.querySelector('.rating-dropdown');
        const ratingSelect = ratingDropdown.querySelector('select');
        const ratingStars = ratingDropdown.querySelectorAll('label');

        ratingStars.forEach((star, index) => {
          star.addEventListener('click', () => {
            ratingSelect.value = index + 1;
            ratingStars.forEach((s, i) => {
              s.classList.remove('active');
              if (i <= index) {
                s.classList.add('active');
                move();
              }
            });
          });
        });

        function move() {
          window.location.href = "/Review"
        }

        function company() {
          var searchValue = document.getElementById('search').value;
          fetch(`/CompanyNameSearch?words=${searchValue}`)
            .then(response => {
              if (!response.ok) {
                throw new Error('Network response was not ok');
              }
              return response.json(); // 서버 응답을 JSON으로 파싱
            })
            .then(data => {
              // JSON 응답을 받아서 배열에 저장
              var list = data; // JSON 데이터가 배열로 저장됩니다.

              // list 배열을 사용하여 작업을 수행할 수 있습니다.
              console.log(list); // 예를 들어, 배열을 콘솔에 출력

              // 배열의 각 요소에 접근할 수도 있습니다.
              for (var i = 0; i < list.length; i++) {
                var value = list[i];
                // value 변수에 배열의 각 요소가 저장됩니다. // 예를 들어, 데이터를 콘솔에 출력
              }
            })
            .catch(error => {
              // 에러 처리
              console.error('There was a problem with the fetch operation:', error);
            });
        }
      
        // var locList = [
        //   '영등포본동',
        //   '영등포동',
        //   '여의동',
        //   '당산1동',
        //   '당산2동',
        //   '도림동',
        //   '문래동',
        //   '양평1동',
        //   '양평2동',
        //   '신길1동',
        //   '신길2동',
        //   '신길3동',
        //   '신길4동',
        //   '신길5동',
        //   '신길6동',
        //   '신길7동',
        //   '대림1동',
        //   '대림2동',
        // ];

        // $(document).ready(function () {
        //   // input필드에 자동완성 기능을 걸어준다
        //   $('#inputSearch').autocomplete({
        //     source: locList,
        //     focus: function (event, ui) {
        //       return false;
        //     },
        //     select: function (event, ui) { },
        //     minLength: 1,
        //     delay: 100,
        //     autoFocus: true,
        //   });
        // });
        // $("#inputSearch").autocomplete({
        //   source: function (request, response) {
        //     $.ajax({
        //       url: stat_path + "/locList",
        //       type: "POST",
        //       dataType: "json",
        //       data: { value: request.term },
        //       success: function (data) {
        //         response(
        //           $.map(data, function (item) {
        //             return {
        //               label: item.AREA_NAME,
        //               value: item.AREA_NAME,
        //               idx: item.IDX,
        //             }
        //           })
        //         )
        //       }
        //     })
        //   },
        //   focus: function (event, ui) {
        //     return false;
        //   },
        //   select: function (event, ui) {
        //     console.log(ui.item.idx)
        //   },
        //   delay: 100,
        //   autoFocus: true
        // });

      </script>

      </html>