<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<style>
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
p.list_count {
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
.page-link {color:#000;}
.container {
 	margin-top:150px;
}
 h2#head_Text {
 	text-align:center;
 	width:100%;
 	font-size:30px;
 	font-weight:bold;
 	margin-bottom:100px;
 }
 
 .btn-dark {
    width: 100px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="subback">
	<h2 id="center"></h2>
</div>
	<div class="container">
		<h2 id="head_Text">회원 리스트</h2>
	
		
		<table class="table">
 			 <thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>성별</th>
					<th>이메일</th>
					<th>연락처</th>
					<th>주소</th>
					<th>생년월일</th>
					<th>블랙회원</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="u" items="${list}">
				<tr>
					<td>${u.useridx}</td>
					<td>${u.userid}</td>
					<td>${u.password}</td>
					<td>${u.name}</td>
					<td>${u.gender == 1 ? "남자" : "여자"}</td>
					<td>${u.email}</td>
					<td>${u.tel}</td>
					<td>${u.address}</td>
					<td>${u.birthday}</td>
					<td><form action="<%=request.getContextPath() %>/userdata/changeBlack" method="post" name="b">
						 <input type="hidden" class="form-control" name="userid" value="${u.userid}">
						 <c:choose>
						 <c:when test="${u.black eq '0'}">
						 <button style="display: block; margin: -7px;" type="submit" class="btn btn-dark">블랙 추가</button>
						 </c:when>
						 <c:when test="${u.black eq '1'}">
						 <button style="display: block; margin: -7px;" type="submit" class="btn btn-red">블랙 해제</button>
						 </c:when> 
						 </c:choose>
						</form></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</body>
</html>