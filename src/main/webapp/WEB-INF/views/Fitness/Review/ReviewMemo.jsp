<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ page import="java.util.HashMap, java.util.ArrayList, com.the_glory.project_fitness.utils.Paginations" %>
    <%@ page import = "com.the_glory.project_fitness.UniqueID.UniqueID" %>

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
        <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
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

                <div class="form-group">
                  <label for="id">
                    <h4> ${userDetailsBean.username} 님</h4>
                  </label>
                  <!-- <input class="form-control" type="hidden" name="ID" id="id" value="${userDetailsBean.username}"
                    required> -->
                </div>
                <form action="">
                  <div class="form-group mt-3 row">
                    <label for="facilitylist">
                      <h4>시설명</h4>
                    </label>
                    <div class="col-4">
                      <input class="form-control" type="text" name="words" id="search" placeholder="검색어를 입력하세요.">
                    </div>
                    <div class="col-2">
                      <button type="submit" onclick="company()">검색</button>
                    </div>
                  </div>
                </form>
                <form action="/insert" id="insertForm">
                  <div>
                    <select name="COMPANY_ID">
                      <%ArrayList list=(ArrayList)request.getAttribute("result"); 
                        for(int i=0; i < list.size(); i=i+1) {
                        HashMap map=(HashMap) list.get(i); %>    
                        <option value="<%= map.get("COMPANY_ID")%>"><%= map.get("COMPANY_NAME")%> 
                        </option>
                      <% }%>
                    </select>
                  </div>
                  
                  <div class="form-group mt-3">
                    <label for="editor">내용</label>
                    <input  class="form-control" type="text" name="REVIEW" id="contentInput" rows="5"style="height: 150px;" class="form-control" >
                  </div>
                  <div class="text-end mt-3">
                    <button type="submit" class="btn btn-secondary" id="predict">sentiment</button> 
                   <p id="resultDisplay"></p>
                    
                  </div>
             
                  <div class="form-group  mt-3">
                    <label for="rating">
                      <h4>별점</h4>
                    </label>
                    <div class="rating-dropdown">
                      <select id="rating" name="GRADE">
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
                  <%       
                  UniqueID uniqueid = new UniqueID();
                  String uuid = uniqueid.generatUuid();
                  %>
                  <div class="row">
                    <div class="col-md-12 text-center">
                  
                      <input type="hidden" name="REVIEW_ID" value="<%= uuid %>">
                      <input type="hidden" name="ID" value="${userDetailsBean.username}">
                      <button type="submit" class="btn btn-primary">작성 완료</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>

          </div>

          <!-- Footer -->
          <%@ include file="/WEB-INF/views/Fitness/footer.jsp" %>


            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
            <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
            <!-- <script>
                var quill = new Quill('#editor', {
                    theme: 'snow'
                });

                quill.setContents(${content}); // jsp 문법을 해석하는 와중에 생기는 오류임.

                // Set hidden input value before form submission
                let form = document.querySelector('#insertForm');
                form.onsubmit = function () {
                    var contentInput = document.querySelector('#contentInput');
                    contentInput.value = quill.root.innerHTML;
                    return true;
                };
            </script> -->

      
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
              var list = JSON.parse(data); // JSON 데이터가 배열로 저장됩니다.

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
      </script>
      <!-- <script>
        let predictObject = document.querySelector('#predict') // id:#, class:. , tag:그대로 사용
        predictObject.addEventListener('click', (event)=>{
            event.preventDefault();  // submit 정지
      
            // 서버로 보낼 데이터 준비
            let comment = document.querySelector('#contentInput').value;
        
            let request_dict = {"reviews":comment};
            // console.log(`request_dict : ${request_dict}`);
        
            // request backend and then return dict (html의 특정태그만 갱신하고자 함)
            fetch('http://127.0.0.1:8000/api_v1/sentimentmachine', {
             method: 'POST',
             headers: {
               'Content-Type': 'application/json'
             },
             body: JSON.stringify(request_dict)
           })
           .then(response => response.json())
           .then(data => {   //data는 dictionary 형태가 들어있음
                console.log(data)
                const answer = data.sentiment;
                // const sentimentResult = data.sentiment
                // // 여기에서 페이지를 다른 jsp 파일로 이동
                // window.location.href = '/Review?sentiment=' + sentimentResult; // 이동하려는 JSP 파일의 경로
      
                // Display the result in the resultDisplay div
                document.querySelector('#resultDisplay').innerHTML = `결과 : ${answer}`;
           })
           .catch(error => console.error(error));
        
        });
        
        </script> -->
        <script src="/js/review_memo.js"></script>
</body>

      </html>