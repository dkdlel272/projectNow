<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/saleList.css">

</head>
<body>

	<hr>

	<div class="container">

		<h2 id="center">게시판 상세보기</h2>
		<table class="table table-hover">
			<tr>
				<td colspan="2">
					<div id="demo" class="carousel slide" data-ride="carousel">
						<ul class="carousel-indicators">
							<c:forEach var="i" begin="0" end="${image.size() -1}">
								<li data-target="#demo" data-slide-to="i"
									<c:if test="${i == 0}"> class="active"</c:if>></li>
							</c:forEach>
						</ul>
						<div class="carousel-inner">
							<c:forEach var="img" items="${image}" varStatus="status">
								<div class="carousel-item <c:if test="${status.index == 0}"> active</c:if>">
									<img src="<%=request.getContextPath()%>/saleupload/${img}"
										 width="1100" height="500">
								</div>
							</c:forEach>
						</div>
					</div> <a class="carousel-control-prev" href="#demo" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
						<span class="carousel-control-next-icon"></span>
				</a>
					</div>
				</td>
			</tr>
			<tr>
				<th>작성자:</th>
				<td>${s.writer}</td>
			</tr>
			<tr>
				<th>제목:</th>
				<td>${s.subject}</td>
			</tr>
			<tr height="250px">
				<th>내용:</th>
				<td>${s.content}</td>
			</tr>
		</table>

		<div id="center" style="padding: 3px;">
			<button class="btn btn-dark"
				onclick="location.href='<%=request.getContextPath()%>/board/boardReplyForm?num=${s.saleidx}'">답
				변</button>
			<button class="btn btn-dark"
				onclick="location.href='<%=request.getContextPath()%>/board/boardUpdateForm?num=${s.saleidx}'">수
				정</button>
			<button class="btn btn-dark"
				onclick="location.href='<%=request.getContextPath()%>/board/boardDeleteForm?num=${s.saleidx}'">삭
				제</button>
			<button class="btn btn-dark"
				onclick="location.href='<%=request.getContextPath()%>/sale/saleList'">목
				록</button>
		</div>


	</div>
</body>
</html>