<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
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
	font-size: 35px;
	font-weight:bold;
	font-family: 'Noto Sans KR', sans-serif;
}
.subback {
	width:100%;
	height:500px;
	overflow:hidden;
	background:url("<%=request.getContextPath()%>/image/notice.jpg");
}
.btn-dark {
    float: right;
    width: 150px;
    color: #fff;
    background-color: #343a40;
    border-color: #343a40;
    border-radius: 50px;
}
</style>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<div class="subback">
	<h2 id ="center">게시물삭제</h2>
</div>
<div class="container">
		<form action="<%=request.getContextPath()%>/board/boardReviewDeletePro" method="post">
		<div class="form-group">
			<input type="hidden" name="num" value="${num}">
			<label>Password</label>
			<input type="password" class="form-control" name="pass">
		</div>
		<div id="center" style="padding: 3px;">
			<button type="submit" class="btn btn-dark">게시물 삭제</button>
		</div>
		</form>
	</div>
</body>
</html>