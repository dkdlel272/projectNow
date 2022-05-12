<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
#wrapper {
	display:none !important;
}
.subback {
	display:none !important;
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
    text-align: center;
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
 	margin-left: 150px;
}
 h2#head_Text {
 	text-align:center;
 	width:100%;
 	font-size:30px;
 	font-weight:bold;
	margin-bottom:60px;
 }
  .btn-dark {
    width: 150px;
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
.table {
	width: 90%;
}

#btn_black{
	display: block; 
	margin: -7px;
	border: 1px solid;
    width: 100px;
    margin: auto;
}
</style>

<script>
	function searchUser(){
		const op = "width=600, height=300, left=150, top=150";
		window.open('<%=request.getContextPath() %>/userdata/searchUserForm','searchUser',op)
	}
</script>
</head>

<body>
<div class="subback">
	<h2 id="center"></h2>
</div>
	<div class="container">
		<h2  id="head_Text">블랙리스트</h2> 
<button type = "button" class="btn btn-dark" onclick="searchUser()">블랙리스트 추가</button>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>성별</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>블랙여부</th>					

				</tr>
			</thead>
			<tbody>
			<c:forEach var="u" items="${list}" >
				<tr>
					<td>${u.userid}</td>
					<td>${u.name}</td>
					<td>${u.gender==1?"남자":"여자"}</td>
					<td>${u.tel}</td>
					<td>${u.email}</td>
					<td>
					<form action="<%=request.getContextPath() %>/userdata/changeBlack" method="post" name="b">
						 <input type="hidden" class="form-control" name="userid" value="${u.userid}">
						 <c:choose>
						 <c:when test="${u.black eq '1'}">
						 <button  type="submit" class="btn" id="btn_black">블랙 해제</button>
						 </c:when> 
						 </c:choose>
					</form>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
</body>
</html>
