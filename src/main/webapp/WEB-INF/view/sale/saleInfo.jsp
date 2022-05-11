<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/saleInfo.css">
<script>
function confirmDelete() {
	
	if(window.confirm("댓글을 삭제하시겠습니까?")){
		return true;
	} else{
		return false;
	}
	
}

</script>
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
				
				<c:if test="${s.writer eq userid}">
					<button class="btn btn-dark" 
						onclick="location.href='<%=request.getContextPath()%>/sale/saleUpdateForm?num=${s.saleidx}'">
						수 정</button>
					<button class="btn btn-dark"
						onclick="location.href='<%=request.getContextPath()%>/sale/saleDeleteForm?num=${s.saleidx}'">
						삭 제</button>
				
				</c:if>
				
				<button class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/sale/saleList'">
					목 록</button>
				</div>
				</td>
			</tr>
		</table>
		
		<div class="post_upload">
		
		<h4>댓글목록</h4>
			<c:forEach var="r" items="${reply}">
				<form action="<%=request.getContextPath()%>/sale/saleReplyDelete?num=${r.replyidx}" 
						method="post" onsubmit="return confirmDelete(this)">
					<input type="hidden" name="replyidx" value="${r.replyidx}">
					<input type="hidden" name="salenum" value="${r.salenum}">
					<div class="post_wrap">
						<div class="post_left">
							<div class="p_load">
								<span>${r.writer}</span><br>
								&nbsp;&nbsp;${r.content}
							</div>
						</div>
						
						<c:if test="${r.writer==userid || s.writer==userid}">
							<div class="post_right">
								<button type="submit" class="btn btn-dark btns">삭제</button>
							</div>
						</c:if>
					</div>
				</form>
			</c:forEach>
			
		</div>
		
		
	<c:if test="${userid != null}">
	 <form name="f" action="<%=request.getContextPath()%>/sale/saleReply" method="post">
	 	<input type="hidden" name="salenum" value="${s.saleidx}">
		 
		 
		 <div class="post_text">
			<label>댓글쓰기</label>
			<textarea class="form-control" rows="10" cols="50" name="content"></textarea>
		</div>
		
		<div class="post_about">
			<div class="left_about">
				<input type="hidden" class="form-control" name="writer" value="${userid}">
			</div>
		</div>
		<div id="center" style="padding: 3px; overflow:hidden;">
			<button type="submit" class="btn btn-dark btn_one">댓글등록</button>
		</div> 
	</form>
	</c:if>
</div>

</body>
</html>