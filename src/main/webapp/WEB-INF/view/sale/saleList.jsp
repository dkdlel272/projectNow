<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
    background:url("<%=request.getContextPath()%>/image/sale.jpg");
}
.container {
    margin-top:150px;
    margin-bottom:150px;
}

.in {
border-radius: 20px;
border: 1px solid #ddd;
}
.inwidth{
width: 48%;
margin: 5px;
}
.inwidthfull{
width: 97%;
margin: 5px;

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
    margin-top:20px;
    border-radius: 50px;
}
.list_button:hover {
	background:#545658;
} 
.list_button:hover a{
	color:#fff;
}
</style>
</head>
<body>

<div class="subback">
	<h2 id="center">삽니다&팝니다</h2>
</div>
	<div class="container ">
	<div class="card-columns">	
	<c:forEach var="li" items="${list }">
			<div class="card" >
		  	<img class="card-img-top" src="<%=request.getContextPath() %>/saleupload/${li.image1}" >
				  <div class="card-body">
				    <h4 class="card-title"> No.${li.saleidx} : ${li.subject}</h4>
				    <p class="card-text">금액 : ${li.price} 장소 : ${li.location}</p>
				    <p class="card-text">판매자 : ${li.writer}</p>
				    <a href="#" class="btn btn-primary">See More</a>
				  </div>
			</div>	
	</c:forEach>
	</div>
	<div class="list_button">
		<p class="button_text">
			<a href="<%=request.getContextPath()%>/sale/writeForm">게시판입력</a>
		</p>	
	</div>
	</div>
	
	
</body>
</html>