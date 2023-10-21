// barchart
function golist() {
    fetch('/genderstatic')
        .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json(); 
        })
        .then(data => {
       
        console.log(data);
        
        barChartdata(data);
        })
        .catch(error => {
        console.error('There was a problem with the fetch operation:', error);
        });
    }
    function barChartdata(dataArray) {
    let barData = new google.visualization.DataTable(); 
    barData.addColumn('string', '성별');    
    barData.addColumn('number', '남성');
    barData.addColumn('number', '여성');
    dataArray.forEach(item => {
       let man = item.male ;
       let woman = item.female ;
       barData.addRow(['성별', man,woman]);
    });
    let barOptions = {
        bar: {groupWidth: '70%'},
        hAxis: {
            minValue:0,
            maxValue:10
        },
        colors:['#87CEEB','#FFC0CB']
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
            return response.json(); 
            })
            .then(data => {
           
            console.log(data);
            
            piechartdata(data); 
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
    // linechart
    function showlinechart() {
        fetch('/linechart')
            .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json(); 
            })
            .then(data => {
            
            console.log(data);
            
            linechartdata(data); 
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