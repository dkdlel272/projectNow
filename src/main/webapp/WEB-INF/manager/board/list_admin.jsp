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
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
		
		<div class="list_button">
			<p class="button_text">
				<a href="<%=request.getContextPath()%>/board/boardWriteForm">게시판입력</a>
			</p>
		</div>
		
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