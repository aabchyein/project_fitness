function golist() {
    fetch('/genderstatic')
        .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json(); // JSON 데이터를 받습니다.
        })
        .then(data => {
        // 서버에서 받은 데이터를 처리합니다.
        console.log(data);
        
        barChart(data); // 데이터 배열을 전달하여 그래프를 그립니다.
        })
        .catch(error => {
        console.error('There was a problem with the fetch operation:', error);
        });
    }

    function barChart(dataArray) {

    let barData = new google.visualization.DataTable(); // 데이터 배열을 사용하여 DataTable을 생성합니다.
    barData.addColumn('string', '성별');

    // 'male' 열 추가
    barData.addColumn('number', '남성');
    
    // 'female' 열 추가
    barData.addColumn('number', '여성');
    dataArray.forEach(item => {
       let man = item.male ;
       let woman = item.female ;
       
       
       // 데이터 추가
       barData.addRow(['성별', man,woman]);
    });
    
    // Options for Bar Chart
    let barOptions = {
        title: '가입자현황',
        bar: {groupWidth: '70%'},
        hAxis: {
            minValue:0,
            maxValue:10
        }
    };
    let barChart = new google.visualization.BarChart(document.querySelector('#barChart'));
    barChart.draw(barData, barOptions);
    }