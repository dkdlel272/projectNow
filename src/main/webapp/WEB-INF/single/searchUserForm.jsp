<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<form class="container pt-5" action="<%=request.getContextPath()%>/userdata/searchUserList">
<input type="text" class="form-control in" name="searchId">
<button type="submit" class="btn btn-info"> 회원 검색 </button>
</form>

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

</body>
</html>