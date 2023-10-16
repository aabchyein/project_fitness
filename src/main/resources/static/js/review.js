let predictObject = document.querySelector('#predict') // id:#, class:. , tag:그대로 사용
predictObject.addEventListener('click', (event)=>{
    event.preventDefault();  // submit 정지

    // 서버로 보낼 데이터 준비
   //  var comment = document.querySelector('#reviewvalue').value;
       let comment = document.querySelectorAll('.review-value');
       let reviews = [];
       
       comment.forEach(comment => {
         reviews.push(comment.textContent)
      });


   //  let request_dict = {"reviews":comment};
    let request_dict = {"reviews":reviews};

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
        document.querySelector('#resultDisplay').innerHTML = `${answer}`;
        document.querySelector('#resultinput').innerHTML = `${answer}`;

   })
   .catch(error => console.error(error));

});