<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'MinSans-Medium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/MinSans-Medium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.notosanskr * { 
 font-family: 'Noto Sans KR', sans-serif;
}
.container {
	margin-top:150px;
	margin-bottom:150px;
	margin-left: 150px;
}
h2#center {
	text-align:center;
	margin-bottom:50px;
	color:#fff;
	line-height:500px;
	font-weight:bold;
	font-size: 35px;
	font-family: 'Noto Sans KR', sans-serif;
}
.subback {
	width:100%;
	height:500px;
	overflow:hidden;
	background:url("<%=request.getContextPath()%>/image/notice.jpg");
}
.table {
	width: 90%;
}
.table .thead-dark th {
    color: #000;
    font-size: 16px;
    background:none;
}
.table thead th {
    vertical-align: bottom;
    border-bottom: 1px solid #dee2e6;
}
.table td, .table th {
    padding: 0.75rem;
    vertical-align: top;
    font-size:15px;
    border-top: 1px solid #dee2e6;
}
/* p.list_count {
	font-size:16px;
}
a {color:#000; font-size:15px; }
p.button_text {font-size:16px; margin-bottom:0px; font-weight:none; text-align:center;}
p.button_text a {text-decoration:none !important; display:block; color:#fff;}
.list_button {
    width: 150px;
    float: right;
    padding: px;
    padding: 10px;
    background-color: #23272b;
    border-radius: 50px;
} 
.list_button:hover {
	background:#545658;
}
.list_button:hover a{
	color:#fff;
}
.pagination {
	width:100%;
}
.page-item.active .page-link {
	background-color: #23272b;
	border:none;
}
.page-link {color:#000;} */

 h2#head_Text {
 	text-align:center;
 	width:100%;
 	font-size:30px;
 	font-weight:bold;
 	margin-bottom:60px;;
 }
 
  .btn-dark {
    width: 100px;
    float: right;
    margin: 10px;
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
<body>

<div class="subback">
	<h2 id="center"></h2>
</div>
	<div class="container">

		<h2 id="head_Text">?????? ?????? ?????????</h2>
	
		<form action="<%=request.getContextPath() %>/userdata/deleteLeave" method= "post">
			<button type = "submit" class="btn btn-dark">?????? ??????</button>
		
		<table class="table">
 			 <thead class="thead-dark">
				<tr>
					<th>??????</th>
					<th>?????????</th>
					<th>????????????</th>
					<th>??????</th>
					<th>??????</th>
					<th>?????????</th>
					<th>?????????</th>
					<th>????????????</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="u" items="${list}">
				<tr>
					<th><input type="checkbox" name="check" value="${u.id}"></th>
					<td>${u.id}</td>
					<td>${u.pass}</td>
					<td>${u.name}</td>
					<td>${u.gender == 1 ? "??????" : "??????"}</td>
					<td>${u.email}</td>
					<td>${u.tel}</td>
					<td>
					<fmt:formatDate value="${u.leave_date}" type="date"  pattern="yyyy/MM/dd"  />
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</form>	
	</div>
</body>
</html>