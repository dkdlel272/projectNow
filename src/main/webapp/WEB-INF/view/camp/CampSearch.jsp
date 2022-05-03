<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 검색</title>
<style>
@font-face {
    font-family: 'MinSans-Medium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/MinSans-Medium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'RIDIBatang';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.notosanskr * { 
 font-family: 'Noto Sans KR', sans-serif;
}
@font-face {
    font-family: 'GimpoGothicBold00';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202-2@1.0/GimpoGothicBold00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.container {
	margin-top:150px;
	margin-bottom:150px;
	max-width: 1500px !important;
}

h2#center {
	text-align:center;
	margin-bottom:50px;
	color:#fff;
	line-height:500px;
	font-size: 35px;
	font-weight:bold;
	font-family: 'Noto Sans KR', sans-serif;
}
.subback {
	width:100%;
	height:500px;
	overflow:hidden;
	background:url("<%=request.getContextPath()%>/image/reserve.jpg");
}
.btn-dark {
    float: right;
    width: 150px;
    color: #fff;
    background-color: #343a40;
    border-color: #343a40;
    border-radius: 50px;
}
.review_wrap {
	width:100%;
	padding-bottom:30px;
	
}
.review_box {
    width: 100%;
    margin: 0 auto;
    display: flex;
    border-top: 1px solid #ddd;
    padding-bottom: 50px;
    padding-top: 50px;
}
.review_left {
	width:28%;
	margin-right:2%;
}
.review_image {
	width:100%;
	height:412px;
	
}
.review_image img {
	width:100%;
}
.review_right {
	width:60%;
	padding:0 10px;
}
.review_right h2 {
	font-size:20px;
	font-weight:bold;
	font-family: 'GimpoGothicBold00';
}
.review_text {
	display: inline-block;
    font-size: 17px;
    font-weight: 300;
}
.review_date {
	text-align:right;
	width: 10%;
	font-size:18px;
	font-family: 'RIDIBatang';
}
.review_photo {
	width:120px;
	height:120px;
	margin-top:20px;
	background:red;
}
.review_photo img {
	width:100%;
}
p.list_count {
	font-size: 20px;
    font-weight: bold;
}
.tag_wrap {
	line-height:30px;
}  
.review_good {
	margin-top:30px;
}
.good_btn {
	width:150px;
	line-height:35px;
	color: #787878;
	font-size: 18px;
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
a {text-decoration:none;} 
a:hover {
	color:#000;
	text-decoration:none;
}
.search_wrap {
	width:56%;
	margin:0 auto;
	margin-bottom:50px;
	overflow:hidden;
}
.pull-right {
	float:none !important;
	width:100%;
}
.searchs {
float:none !important;
}
.form-control {
	height:60px !important;
}
select{
    height: 60px !important;
    width: 100% !important;
}
.btn-success {
	height: 60px;
    width: 100%;
    background:#000;
    border:1px solid #000;
}
.btn-success:hover {
	background:#3f3f3f;
}
</style>
</head>
<body>
<div class="subback">
	<h2 id ="center"></h2>
</div>
<div class="container">
<div class="search_wrap">
		<div class="searchs">
			 <form name="search" action="<%=request.getContextPath()%>/camp/CampSearch">
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
	<form name="f" action="<%=request.getContextPath()%>/camp/CampInfo" enctype="multipart/form-data" method="post">
	<p class="list_count" align="right" style=vertical-align:top;>캠핑장 둘러보기	</p>
	
	
	<div class="review_wrap">
		
		<c:forEach var="c" items="${search}">
		<a href="<%=request.getContextPath() %>/camp/CampInfo?campname=${c.campname}">
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