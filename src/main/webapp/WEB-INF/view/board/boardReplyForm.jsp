<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/boardReplyForm.css">
</head>

<body>
<div class="subback">
	<h2 id ="center">게시물 답변</h2>
</div>
<div class="container">    
	<form name="f" action="<%=request.getContextPath()%>/board/boardReplyPro" method="post">
		<input type="hidden" name="num" value="${b.num}">
		<input type="hidden" name="ref" value="${b.ref}">
		<input type="hidden" name="reflevel" value="${b.reflevel}">
		<input type="hidden" name="refstep" value="${b.refstep}">
		
		<div class="form-group">
			<label>작성자:</label>
			<input type="text" class="form-control" name="writer">
			<label>비밀번호</label>
			<input type="password" class="form-control" name="pass">
			<label>제목</label>
			<input type="text" class="form-control" name="subject" value="re:${b.subject}">
		</div>
		
		<div class="form-group">
			<label>내용:</label>
			<textarea class="form-control" rows="10" cols="50" name="content"></textarea>
		</div>
		
		<!-- <div class="form-group">
			<label>파일저장:</label>
			<input type="file" class="form-control" name="file1">
		</div> -->
		
		<div id="center" style="padding:3px;">
			<button type="submit" class="btn btn-dark">입력</button>
		</div>
	</form>
</div>
</body>
</html>