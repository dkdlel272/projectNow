<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/saleList.css">

</head>
<body>

<div class="subback">
	<h2 id="center">삽니다&팝니다</h2>
</div>
	

	<div class="container">
		<div>
		<input type="checkbox" name="condition"> 거래가능만 리스트만 보기
		<div class="list_button">
		<p class="button_text">
			<a href="<%=request.getContextPath()%>/sale/saleWriteForm">게시판입력</a>
		</p>	
		</div>
	</div>
	
	<div class="row row-cols-1 row-cols-md-3">	
	<c:forEach var="li" items="${list }">
			<div class="col">
			<div class="card" >
		  	<img class="card-img-top" src="<%=request.getContextPath() %>/saleupload/${li.image1}" >
				  <div class="card-body">
				   	<p class="card-text" style="text-align: right;">${li.condition }</p>
				   	<h4 class="card-title"> No.${li.saleidx} : ${li.subject} </h4>
				   	<p class="card-text">장소 : ${li.location}</p>
				   	<p class="card-text">판매자 : ${li.writer}</p>
				   	<h5 class="card-text" style="color: red">
				   	<fmt:formatNumber value="${li.price}" pattern="#,###"/>
					</h5>
					<p class="card-text" style="color: gray;">${li.readcnt}</p>
				   	<a href="<%=request.getContextPath() %>/sale/saleInfo?num=${li.saleidx}" class="btn list_button" style="color: #fff;">See More</a>
				  </div>
			</div>
			</div>	
	</c:forEach>
	</div>
	</div>
	
</body>
</html>