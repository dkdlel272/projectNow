<%@page import="dto.Camp"%>
<%@page import="java.util.List"%>
<%@page import="controller.CampController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실관리</title>
<style>
/*시작*/
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
    min-height: 205.9vh;
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
/*끝*/
button {
	padding: 5px;
	margin-right: 15px;
	border-radius: 15px;
	border-color: black;
	border: solid 0.25px;
	background-color: white;
	cursor: grab;
}

.table-hover {
	padding-right: 0px;
	width: 100%;
	margin-bottom: 1rem;
	border: 0px solid #bcbcbc;
	color: #212529;
	margin-left: 85px;
	border-collapse: collapse;
	text-align-last: center;
}

h5 {
	float: right;
	padding-bottom: 10px;
	margin: inherit;
	margin-right: 30px;
}

.container {
	margin-top: 0px;
	max-width: 100%;
	margin: inherit;
	width: 100%;
	padding-right: 85px;
	padding-left: 200px;
}
/*toggle switch*/
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>
<script>
function toggle(element, idx) {   
	let chk='n';
	if(element.checked == true){
		alert("캠핑장 리스트에서 숨겼습니다.")
	}else{
		chk='y'
		alert("캠핑장 리스트에 노출합니다")
	}
	
	
    const xhttp = new XMLHttpRequest()
	xhttp.open("GET","viewChk?idx="+idx+"&chk="+chk,true)
//xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhttp.send(null)
//	xhttp.onreadystatechange = callback
	
	}
</script>
</head>

<body>
	<hr>
	<!-- table list start //안되면 adminchk넣기 -->
	<div class="container">
		<h1 style="text-align: left;" id="center">
			<a style="text-decoration: auto; " href="<%=request.getContextPath()%>/reserve/CampList">
			<h1 style="margin: inherit; margin-bottom: -25px;">캠핑장 리스트</h1></a>
			<h5>
				<button style="margin-right: -70px;" type="button"
					onclick="window.open('<%=request.getContextPath()%>/camp/CampInsert','', 'width=500, height=700')">캠핑장
					추가</button>
			</h5>
		</h1>
		<table class="table table-hover">
			<thead style="text-align: center;">
				<tr>
					<td>이미지</td>
					<td>캠핑장이름</td>
					<td>캠핑장주소</td>
					<td>객실 타입</td>
					<td>요금</td>
					<td>관리</td>
					<td>캠프 노출 관리</td>
				</tr>
			<tbody>
				<c:forEach var="c" items="${cl}">
					<tr>
						<td><img
							src="<%=request.getContextPath() %>/campupload/${c.campimg}"
							width="100" /></td>
						<td><a style="text-decoration: auto;" href="<%=request.getContextPath() %>/reserve/CampInfo?campname=${c.campname}">${c.campname}</a></td>
						<td>${c.campaddr}</td>
						<td>${c.room}</td>
						<td>${c.payidx}</td>
						<td>
							<form action="<%=request.getContextPath()%>/camp/campDelete"
								method="post">
								<input type="hidden" value="${c.campidx}" name="campidx">
								<button style="position: absolute; margin-left: 100px;"
									type="submit">삭제</button>
							</form>
							<form action="<%=request.getContextPath()%>/camp/campUpdate"
								method="post">
								<input type="hidden" value="${c.campidx}" name="campidx">
								<button style="margin-right: 40px;" type="button"
									onclick="window.open('<%=request.getContextPath()%>/camp/campUpdate?campidx=${c.campidx}','', 'width=500, height=700')">수정</button>
							</form>
						</td>
						<td>
						<label class="switch"> <input type="checkbox" onclick="toggle(this, '${c.campidx}')"  <c:if test="${c.chk eq 'n'}" > checked </c:if>   >
						<span class="slider round"> </span></label>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<hr>
	<!-- table list start //안되면 adminchk넣기 -->
	<div class="container">
		<h1 style="text-align: left;" id="center">캠핑장 예약 현황</h1>
		<div class="container">
<div class="search_wrap">
		<div class="searchs">
			 <form name="search" action="<%=request.getContextPath()%>/camp/reserveSearch">
				<table class="pull-right" style="float:right;  margin-right: -170px;">
					<tr>
						<td style="text-align:right">
							<select class="from-control" name="searchType">
								<option value="0"> 선택 </option>
								<option value="1"> 월검색 </option>
								<option value="2"> 예약자명 </option>
							</select>
						</td>
						<td>
							<input type="text" class="form-control" placeholder="검색어 입력" name="searchName" maxlength="100">
						</td>
						<td>
							<button type="submit" class="btn btn-success">검색</button>
						</td>		
					</tr>
				</table>
			</form>
		</div>
	</div> 
</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>캠핑장번호</th>
					<th>예약자 이름</th>
					<th>캠핑장 이름</th>
					<th>캠핑장 주소</th>
					<th>객실 타입</th>
					<th>요금</th>
					<th>체크인</th>
					<th>체크아웃</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="r" items="${reserveSearch}">
					<tr>
						<td>${r.campidx}</td>
						<td>${r.username}</td>
						<td>${r.campname}</td>
						<td>${r.campaddr}</td>
						<td>${r.room}</td>
						<td>${r.payidx}</td>
						<td><fmt:parseDate value="${r.checkin}" var="checkin"
								pattern="yyyy-MM-dd" /> <fmt:formatDate value="${checkin}"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:parseDate value="${r.checkout}" var="checkout"
								pattern="yyyy-MM-dd" /> <fmt:formatDate value="${checkout}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>