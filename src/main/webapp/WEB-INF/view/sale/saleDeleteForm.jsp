<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
		href="<%=request.getContextPath() %>/resouces/css/saleList.css">


</head>
<body>
<div class="subback">
	<h2 id ="center">게시물삭제</h2>
</div>
<div class="container">
		<form action="<%=request.getContextPath()%>/sale/saleDeletePro" method="post">
		<div class="form-group">
			<input type="hidden" name="saleidx" value="${s.saleidx}">
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