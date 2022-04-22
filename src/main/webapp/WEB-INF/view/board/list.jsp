<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/List.css">

</head>
<body>

<div class="subback">
	<h2 id="center">${boardName}</h2>
</div>
	<div class="container">
		<h2 id="head_Text">${boardName}</h2>
		<p class="list_count" align="right" style=vertical-align:top;>
			<c:if test="${boardcount >0}">글개수:${boardcount}</c:if>
			<c:if test="${boardcount ==0}">등록된 게시물이 없습니다.</c:if>	
		</p>
		
		<table class="table">
 			 <thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>파일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="b" items="${list}">
				<tr>
					<td>${boardnum}</td>
					<c:set var="boardnum" value="${boardnum-1}"/>
					<td>
					<c:if test="${b.reflevel>0}">
					<img src="<%=request.getContextPath() %>/image/level.gif" width="${5*b.reflevel}">
					<img src="<%=request.getContextPath() %>/image/re.gif">
					</c:if>
					<a href="<%=request.getContextPath() %>/board/boardInfo?num=${b.num}">${b.subject}</a>
					</td>
					<td>${b.writer}</td>
					<td>${b.regdate}</td>
					<td>${b.file1}</td>
					<td>${b.readcnt}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
		
		<div class="container" style="margin-top:100px;">
		<ul class="pagination justify-content-center"  >
	     <li class='page-item <c:if test="${startPage <= bottomLine}"> disabled</c:if>'><a
	    	class="page-link" href="<%=request.getContextPath() %>/board/list?pageNum=${startPage-bottomLine}">Previous</a></li>
	  
		  <c:forEach var="i" begin="${startPage}" end="${endPage}">
		  <li class='page-item <c:if test="${i==pageInt}">active </c:if>'>
		  <a  class="page-link" href="<%=request.getContextPath() %>/board/list?pageNum=${i}">${i}</a></li>
		  </c:forEach>
		  
		  <li class='page-item <c:if test="${endPage >= maxPage}"> disabled </c:if>'>
		  <a
		   class="page-link" href="<%=request.getContextPath()%>/board/list?pageNum=${startPage+bottomLine}">Next</a></li>
		</ul> 
	</div>
	</div>
</body>
</html>