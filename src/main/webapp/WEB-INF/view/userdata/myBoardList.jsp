<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style >

.notosanskr * { 
 font-family: 'Noto Sans KR', sans-serif;
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
.container {
    margin-top:150px;
    margin-bottom:150px;
}

</style>
</head>
<body>
<div class="subback">
    <h2 id="center">MY PAGE</h2>
</div>

	<div class="container">
		<p align="right">
		<c:if test="${boardcount> 0}">
		글개수 : ${ boardcount}
		</c:if>
		<c:if test="${boardcount == 0}">
		등록된 게시물이 없습니다.
		</c:if>
		</p>
		<table class="table table-hover">
			<thead>
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
			
			<c:forEach var="b" items="${list }">
				<tr>
					<td>${boardnum}</td>
					<c:set var="boardnum" value="${boardnum - 1 }"/>
					<td>
				
					<c:if test="${b.reflevel > 0 }">
					<img src ="<%=request.getContextPath() %>/image/level.gif" width="${5*b.reflevel } %>">
					<img src ="<%=request.getContextPath() %>/image/re.gif">
					</c:if>
					
					
					<a href="<%=request.getContextPath() %>/board/boardInfo?num=${b.num}">
						${b.subject}</a></td>
					<td>${b.writer}</td>
					<td>${b.regdate }</td>
					<td>${b.file1}</td>
					<td>${b.readcnt}</td>
				
				</tr>
			</c:forEach>	
			</tbody>
		</table>
	
		<div class="container"  >
		<ul class="pagination justify-content-center"  >
		
  			 <li class='page-item <c:if test="${startPage <= bottomLine}"> disabled </c:if>'>
  			 <a class="page-link" href="<%=request.getContextPath()%>/board/list?pageNum=${startPage - bottomLine}">Previous</a></li>
  
 		 <c:forEach var="i" begin="${startPage}" end="${endPage}">
 			 <li class='page-item <c:if test="${i==pageInt}">active</c:if>'>
 			 <a class="page-link" href="<%=request.getContextPath()%>/board/list?pageNum=${i}">${i}</a></li>
		</c:forEach>
  
 			 <li class='page-item <c:if test="${endPage >= maxPage}"> disabled </c:if>'>
 			 <a class="page-link" href="<%=request.getContextPath()%>/board/list?pageNum=${startPage + bottomLine}">Next</a></li>
 
 
</ul> </div>
	</div>
</body>
</html>

</body>
</html>