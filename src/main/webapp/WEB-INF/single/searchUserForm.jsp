<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<title>Insert title here</title>
<style>
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
 h3#head_Text {
 	text-align:center;
 	width:100%;
 	font-size:30px;
 	font-weight:bold;
	margin:50px;
	
 }
 
 .search {
 	margin: 20px;
	float: right;
 }
 #btn_black{
	display: block; 
	margin: -7px;
	border: 1px solid;
    width: 100px;
    margin: auto;
}
 

</style>
</head>
<body>
	<h3 id="head_Text">회원 검색</h3> 
	<div class="container">

		<form class="search" action="<%=request.getContextPath()%>/userdata/searchUserList">
			<input type="text" name="searchId" placeholder="아이디를 입력하세요">
			<button type="submit" class="btn btn-info"> 검색 </button>
		</form>

		<table class="table">
 			 <thead class="thead-dark">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>연락처</th>
					<th>블랙여부</th>
				</tr>
			</thead>
				<tbody>
					<c:forEach var="u" items="${list}">
					<tr>
						<td>${u.userid}</td>
						<td>${u.name}</td>
						<td>${u.email}</td>
						<td>${u.tel}</td>
						<td><form action="<%=request.getContextPath() %>/userdata/changeBlack2" method="post" name="b">
							 <input type="hidden" class="form-control" name="userid" value="${u.userid}">
							 <c:choose>
							 <c:when test="${u.black eq '0'}">
							 <button style="display: block; margin: -7px;" type="button" 
							 		class="btn btn-dark" onclick="closeSearch(this.form)">블랙 추가</button>
							 </c:when>
							 <c:when test="${u.black eq '1'}">
							 <button style="display: block; margin: -7px;" type="button" class="btn" 
							 		id="btn_black" onclick="closeSearch(this.form)">블랙 해제</button>
							 </c:when> 
							 </c:choose>
							</form></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
<script>
	function closeSearch(form) {
		 form.submit()
	}
</script>

</body>
</html>