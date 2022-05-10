<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<meta charset="UTF-8">
<title>예약관리</title>
<style>
.pull-right {
    float: right;
    margin-top: -55px;
}
ul.menu_login {
	display: flow-root;
	padding-bottom: 20px;
	padding-top: 20px;
	list-style: none;
	margin: 0px;
	padding-right: 1304px;
	float: right;
	background: linear-gradient(150deg, #3585CB, #48a3e5, #2babbf, #519ed7, #4496ed);
}

#sidebar {
	padding-top: 180px;
	min-width: 250px;
	max-width: 250px;
	min-height: 104.9vh;
	background: linear-gradient(150deg, #3585CB, #48a3e5, #2babbf, #519ed7, #4496ed);
	transition: 0.5s all;
	margin-top: -24px;
	z-index: 1;
	display: inline-block;
}

.table {
	width: 40%;
	margin-bottom: 1rem;
	border: 1px solid #bcbcbc;
	color: #212529;
}

th, td {
	border: 1px solid #bcbcbc;
}

#table1 {
	width: 400px;
	height: 300px;
}

.container, .container-lg, .container-md, .container-sm, .container-xl {
	max-width: 100%;
	margin: inherit;
	width: 100%;
	padding-right: 580px;
	padding-left: 200px;
}

.wrapper {
	width: 50px;
	height: 50px;
	text-align: center;
	margin: -35px auto;
	margin-left: 0px;
	margin-bottom: 3px;
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
					<td>이번달 예약</td>
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
			</thead>
		</table>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<hr>

	<div class="container">
		<h1 style="text-align: left;" id="center">매출 대시 보드</h1>
		<div class="search_wrap" style="margin-right: 55%;">
			<div class="searchs">
				<form name="search"
					action="<%=request.getContextPath()%>/camp/chartSearch">
					<table class="pull-right" style="float: right; margin-top: -55px;">
						<tr>
							<td style="text-align: right"><select class="from-control"
								name="searchType">
									<option value="0">월선택</option>
									<option value="1">1월</option>
									<option value="2">2월</option>
									<option value="3">3월</option>
									<option value="4">4월</option>
									<option value="5">5월</option>
									<option value="6">6월</option>
									<option value="7">7월</option>
									<option value="8">8월</option>
									<option value="9">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
							</select></td>
							<td>
								<button type="submit" class="btn btn-success">검색</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

	<!-- 차트가 그려질 부분 -->
	<canvas id="myChart"
		style="max-width: 100%; width: 100%; padding-right: 200px; padding-left: 15%; display: block; height: 364px;"></canvas>

	<script>
		var peoples = new Array();
		<c:forEach var="i"  begin="1" end="31" varStatus="status">
		var json = new Object();
		peoples.push("${md1.get(i)}");
		</c:forEach>

		var prices = new Array();
		<c:forEach var="i"  begin="1" end="31" varStatus="status">
		var json = new Object();
		prices.push("${md2.get(i)}");
		</c:forEach>

		$(function() {
			let ctx = document.getElementById('myChart').getContext('2d');
			let chart = new Chart(ctx, {
				type : 'bar',
				data : chartData,
				options : chartOptions
			})
		})

		// chart data and options
		let chartData = {
			labels : [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
					17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31 ],
			datasets : [ {
				type : 'bar',
				label : '매출',
				yAxisID : 'y-left',
				data : prices,
				order : 2,
				backgroundColor : 'red',
				borderColor : 'red',
				borderWidth : 1
			}, {
				type : 'line',
				label : '일별 캠핑객',
				yAxisID : 'y-right',
				data : peoples,
				backgroundColor : 'orange',
				borderColor : 'orange',
				borderWidth : 1
			} ]
		}

		let chartOptions = {
			responsive : true,
			// maintainAspectRatio: false,
			plugins : {
				title : {
					display : true,
					text : '일별 매출현황및 캠핑객',
					font : {
						size : 25
					}
				}
			},
			scales : {
				'y-left' : {
					type : 'linear',
					position : 'left',
					title : {
						display : true,
						text : '매출'
					},
					grid : {
						display : false
					}
				},
				'y-right' : {
					type : 'linear',
					position : 'right',
					title : {
						display : true,
						text : '일별 캠핑객'
					},
					ticks : {
						stepSize : 1,
						min : 0
					},
					grid : {
						display : false
					}
				}
			}
		}
	</script>
	<div class="container">
		<h1 style="text-align: left;" id="center">일별 캠핑객 현황</h1>
		<table class="table table-hover" style="font: menu;">
			<tr>
				<c:forEach var="day" begin="1" end="31" step="1">
					<th style="padding: 7px; word-break: keep-all;">${day}일</th>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="i" begin="1" end="31" varStatus="status">
					<td style="padding: 4px; word-break: keep-all;"><c:if
							test="${md1.get(i) eq null}">0</c:if> ${md1.get(i)}명</td>
				</c:forEach>
			</tr>
		</table>
	</div>


</body>
</html>