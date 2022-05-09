<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>캠핑장리스트</title>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/CampList.css">
</head>
<body>
<div class="subback">
	<h2 id ="center">캠핑장 전체보기</h2>
</div>
	<div class="container">
<div class="search_wrap">
		<div class="searchs">
			 <form name="search" action="<%=request.getContextPath()%>/reserve/CampSearch">
				<table class="pull-right">
					<tr>
						<td style="text-align:right">
							<select class="from-control" name="searchType">
								<option value="0"> 선택 </option>
								<option value="1"> 주소 </option>
								<option value="2"> 캠핑종류 </option>
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
	<form name="f" action="<%=request.getContextPath()%>/reserve/CampInfo" enctype="multipart/form-data" method="post">
	<p class="list_count" align="right" style=vertical-align:top;>캠핑장 둘러보기	</p>
	
	
	<div class="review_wrap">
		
		<c:forEach var="c" items="${list}">
		<a href="<%=request.getContextPath() %>/reserve/CampInfo?campname=${c.campname}">
		<div class="review_box">
			<div class="review_left">
				<div class="review_image">
					<img src="<%=request.getContextPath() %>/campupload/${c.campimg}" width="50%">
				</div>
			</div>
			<div class="review_right">
				<h2>${c.campname}</h2>
				
				<div class="review_text">
					주소 : ${c.campaddr }
				</div>
				
				<div class="review_good">
					<strong>소개 : ${c.content}</strong>
				</div>
			</div> 
		</div>
		</a>
		</c:forEach>
	</div>
</form>
</div>	
</body>
</html>