<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/saleInfo.css">

</head>
<body>

<div class="subback">
	<h2 id="center">게시판 상세보기</h2>
</div>
	<div class="container">


		<table class="table" >
			<tr id="align">
			<td colspan="2"><h3 class="table_head">${s.subject}</h3></td>
			</tr>
		
			<tr id="align">
				<td colspan="2">
					<div id="demo" class="carousel slide" data-ride="carousel">
						<ul class="carousel-indicators">
							<c:forEach var="i" begin="0" end="${image.size()-1}">
								<li data-target="#demo" data-slide-to="i"
									<c:if test="${i == 0}"> class="active"</c:if>></li>
							</c:forEach>
						</ul>
						<div class="carousel-inner">
							<c:forEach var="img" items="${image}" varStatus="status">
								<div
									class="carousel-item <c:if test="${status.index == 0}"> active</c:if>">
									<img src="<%=request.getContextPath()%>/saleupload/${img}"
										width="1100" height="500" style="align-items: center;">
								</div>
							</c:forEach>
						</div>

						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>
					</div>
				</td>
			</tr>
			
			<tr id="align">
				<th>작성자:</th>
				<td>${s.writer}</td>
			</tr>
			
			<tr id="align">
				<th>제목:</th>
				<td>${s.subject}</td>
			</tr>
			
			<tr id="align">
				<th>금액:</th>
				<td>${s.price}</td>
			</tr>
			<tr id="align">
				<th>거래 장소:</th>
				<td>${s.location}</td>
			</tr>
			<tr id="align" height="250px">
				<th>내용:</th>
				<td>${s.content}</td>
			</tr>
		
		<tr>
			<td colspan="2">
			<div> 
			<button class="btn btn-dark" 
			onclick="location.href='<%=request.getContextPath()%>/board/boardReplyForm?num=${s.saleidx}'">답변</button>
			<button class="btn btn-dark"
			onclick="location.href='<%=request.getContextPath()%>/sale/saleUpdateForm?num=${s.saleidx}'">수정</button>
			<button class="btn btn-dark"
				onclick="location.href='<%=request.getContextPath()%>/board/boardDeleteForm?num=${s.saleidx}'">삭
				제</button>
			<button class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/sale/saleList'">목
				록</button>
			</div>
			</td>
		</tr>
		</table>

	</div>
</body>
</html>