<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<meta charset="UTF-8">
<title>예약관리</title>
<style>
.table {
    width: 40%;
    margin-bottom: 1rem;
    border: 1px solid #bcbcbc;
    color: #212529;
    }
 th, td {
  border: 1px solid #bcbcbc;
 }
 .wrapper {
  width: 50px;
  height: 50px;
  text-align: center;
  margin: 50px auto;
}
#switch {
  position: absolute;
  /* hidden */
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}

.switch_label {
  position: relative;
  cursor: pointer;
  display: inline-block;
  width: 58px;
  height: 28px;
  background: #fff;
  border: 2px solid #daa;
  border-radius: 20px;
  transition: 0.2s;
}
.switch_label:hover {
  background: #efefef;
}
.onf_btn {
  position: absolute;
  top: 4px;
  left: 3px;
  display: inline-block;
  width: 20px;
  height: 20px;
  border-radius: 20px;
  background: #000;
  transition: 0.2s;
}
#table1 {
        width: 400px;
        height: 300px;
      }
#switch:checked+.switch_label {
  background: #c44;
  border: 2px solid #c44;
}
.container, .container-lg, .container-md, .container-sm, .container-xl {
    max-width: 100%;
    margin: inherit;
    width: 100%;
    padding-right: 580px;
    padding-left: 200px;
}
.switch_label {
    position: relative;
    cursor: pointer;
    display: inline-block;
    width: 63px;
    height: 32px;
    background: #fff;
    border: 2px solid #181616;
    border-radius: 20px;
    transition: 0.2s;
}
.wrapper {
    width: 50px;
    height: 50px;
    text-align: center;
    margin: -35px auto;
    margin-left: 140px;
    margin-bottom: 3px;
}
#switch:checked+.switch_label:hover {
  background: #e55;
}

#switch:checked+.switch_label .onf_btn {
  left: 34px;
  background: #fff;
  box-shadow: 1px 2px 3px #00000020;
}
</style>
</head>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
</script>
<body>
<hr>
	<!-- table list start //안되면 adminchk넣기 -->
	<div class="container">
		<h1 style="text-align: left;" id="center">예약현황</h1>
<table class="table table-hover">
			<thead> 
				<tr>
				<th colspan="4">요약 정보</th>
				</tr>
				<tr>
				<td>이번달 예약 </td>
				<td>${map.P11}명</td>
				<td>지난달 예약</td>
				<td>${map.P12}명</td>
				</tr>
				<tr>
				<td>오늘 캠핑객</td>
				<td>${map.P21}명</td>
				<td>내일 캠핑객</td>
				<td>${map.P22}명</td>
				</tr>
				<tr>
				<td>이번달 총매출</td>
				<td>${map.P31}원</td>
				<td>오늘 매출</td>
				<td>${map.P32}원</td>
				</tr>
				<tr>
				<td>일별 인원</td>
				<td>${md1}원</td>
				<td>일별 총매출</td>
				<td>${md2}원</td>
				</tr>
			</thead>
</table></div>

<hr>
<div class="container">
<h1 style="text-align: left;" id="center">매출 대시 보드</h1></div>
<!-- 차트가 그려질 부분 -->
<canvas id="myChart"  style="max-width: 100%;
    width: 100%;
    padding-right: 26%;
    padding-left: 11%;
    display: block;
    height: 364px;"></canvas>
<script>
            var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
                    ],
                    datasets: [
                        {
                        	type: 'line',
                            label: '일별 캠핑객',
                            fill: false,
                            data: [],	//캠핑객 값 불러오기
                            backgroundColor: 'red',
                            borderColor: 'red'
                        },
                        { //데이터
                            label: '매출', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [],	//x축 label에 대응되는 데이터 값
                            backgroundColor: [
                                //색상
                                'yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow','yellow'
                            ],
                            tension: 0,
                            spanGaps: true,
                          borderWidth: 1 //경계선 굵기
                        } ,
                    ]
                },
                options: {
                	title:{
                		display:true,
                		text:"일별 매출현황및 캠핑객",
                		fontSize : 25
                	},
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
 <div class="container">
		<h1 style="text-align: left;" id="center">일별 캠핑객 현황</h1>
<table class="table table-hover" style="font: menu;">
<tr>
<c:forEach var="day" begin="1" end="31" step="1">
<th style="padding: 9px; word-break: keep-all;">${day}일</th>
</c:forEach>
</tr>
<tr>
<c:forEach var="i" items="${md1}" begin="1" end="31" varStatus="status">
<td style="padding: 9px; word-break: keep-all;">
${i.value}
</td>
</c:forEach>
</tr>
</table></div>       
        
        
</body> 
</html>