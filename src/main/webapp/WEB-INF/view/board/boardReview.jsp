<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/boardReview.css">
<title>Insert title here</title>

</head>
<body>
<div class="subback">
	<h2 id ="center">${boardName}</h2>
</div>

<div class="container">
	<h2 class="review_head1">실시간 리뷰</h2>
	<div class="review_head">고객님들의 소중한 리뷰와 실시간으로 쌓이고 있는 리얼리뷰를 만나보세요.</div>

<div class="search_wrap">
		<div class="searchs">
			 <form name="search" action="<%=request.getContextPath()%>/board/boardReview">
				<table class="pull-right">
					<tr>
						<td style="text-align:right">
							<select class="from-control" name="searchType">
								<option value="0"> 선택 </option>
								<option value="1"> 제목 </option>
								<option value="2"> 작성자 </option>
								<option value="3"> 내용 </option>
							</select>
						</td>
						<td>
							<input type="text" class="form-control" placeholder="검색어 입력" name="searchName" maxlength="100">
						</td>
						<td>
							<button type="submit" class="btn btn-success">검색</button>
						</td>		
					</tr>
				</table>
			</form>
		</div>
	</div> 
</div>
	
<div class="container">
	<form name="f" action="<%=request.getContextPath()%>/board/boardWriterPro" enctype="multipart/form-data" method="post">
	
	
	
	
	
	<p class="list_count" align="right" style=vertical-align:top;>
			<c:if test="${boardcount >0}">총 : ${boardcount} 개</c:if>
			<c:if test="${boardcount ==0}">등록된 게시물이 없습니다.</c:if>	
	</p>
	
	
	<div class="review_wrap">
		
		<c:forEach var="b" items="${list}">
		<a href="<%=request.getContextPath() %>/board/boardReviewInfo?num=${b.num}">
		<div class="review_box">
			<div class="review_left">
				<div class="review_image">
					<img src="<%=request.getContextPath() %>/boardupload/${b.file1}" width="50%">
				</div>
			</div>
			<div class="review_right">
				<h2>${b.subject}</h2>
				
				<div class="review_text">
					${b.content}
				</div>
				<div class="review_photo">
					<img src="<%=request.getContextPath() %>/boardupload/${b.file1}" width="50%">
				</div>
				<div class="review_good">
					<div class="good_btn">
						<i class="xi-heart" style="color:red"></i>
						<c:if test="${boardcount >0}">${b.good}</c:if>도움됐어요
					</div>
				</div>
			</div>
			<div class="review_date">
				${b.regdate}
			</div>
		</div>
		</a>
		</c:forEach>
<div class="list_button">
		<p class="button_text">
			<a href="<%=request.getContextPath()%>/board/boardWriteForm">게시판입력</a>
		</p>	
		</div>		
<div class="container" style="margin-top:100px;">
		<ul class="pagination justify-content-center"  >
    		 <li class='page-item <c:if test="${startPage <= bottomLine}"> disabled</c:if>'><a
    			class="page-link" href="<%=request.getContextPath() %>/board/boardReview?pageNum=${startPage-bottomLine}">Previous</a></li>
  
			  <c:forEach var="i" begin="${startPage}" end="${endPage}">
			  <li class='page-item <c:if test="${i==pageInt}">active </c:if>'>
			  <a  class="page-link" href="<%=request.getContextPath() %>/board/boardReview?pageNum=${i}">${i}</a></li>
			  </c:forEach>
			  
			  <li class='page-item <c:if test="${endPage >= maxPage}"> disabled </c:if>'>
			  <a
			   class="page-link" href="<%=request.getContextPath()%>/board/boardReview?pageNum=${startPage+bottomLine}">Next</a></li>
		</ul> 
</div>


	</div>
</form>
</div>	
</body>
</html>