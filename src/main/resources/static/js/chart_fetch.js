// barchart
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
        
        barChartdata(data); // 데이터 배열을 전달하여 그래프를 그립니다.
        })
        .catch(error => {
        console.error('There was a problem with the fetch operation:', error);
        });
    }

    function barChartdata(dataArray) {

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
        bar: {groupWidth: '70%'},
        hAxis: {
            minValue:0,
            maxValue:10
        }
    };
    let barChart = new google.visualization.BarChart(document.querySelector('#barChart'));
    barChart.draw(barData, barOptions);
    }

    // pie chart
    function showpiechart() {
        fetch('/piechart')
            .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json(); // JSON 데이터를 받습니다.
            })
            .then(data => {
            // 서버에서 받은 데이터를 처리합니다.
            console.log(data);
            
            piechartdata(data); // 데이터 배열을 전달하여 그래프를 그립니다.
            })
            .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
            });
        }

    function piechartdata(data){
        let pieData = new google.visualization.DataTable();
        pieData.addColumn('string','지역');
        pieData.addColumn('number','비율');
        data.forEach(item =>{
            let locals = item.LOCAL;
            let ratios = item.ratio;
            pieData.addRow([locals,ratios]);
            
        });

        // Options for Pie Chart
        let pieOptions = {
            pieSliceText: 'value-and-percentage',
            chartArea: {
                left:10,
                top:10,
                bottom:10,
                width: '100%', // 차트 영역의 가로 크기
                height: '100%' // 차트 영역의 세로 크기
            },
        };
        let pieChart = new google.visualization.PieChart(document.querySelector('#pieChart'));
                pieChart.draw(pieData, pieOptions);
    }

    function showlinechart() {
        fetch('/linechart')
            .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json(); // JSON 데이터를 받습니다.
            })
            .then(data => {
            // 서버에서 받은 데이터를 처리합니다.
            console.log(data);
            
            linechartdata(data); // 데이터 배열을 전달하여 그래프를 그립니다.
            })
            .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
            });
        }

        function linechartdata(data){
            let lineData = new google.visualization.DataTable();
            lineData.addColumn('string', '회원가입자');
            lineData.addColumn('number', '회원가입자 수');
            const rows = data.map(item => [item.join_month, item.datecount]);
            lineData.addRows(rows); 
        

            let lineOptions = {
                curveType: 'function',
                legend: { position: 'bottom' } // 범례설정
            };
            let lineChart = new google.visualization.LineChart(document.querySelector('#lineChart'));
                lineChart.draw(lineData, lineOptions);

        }