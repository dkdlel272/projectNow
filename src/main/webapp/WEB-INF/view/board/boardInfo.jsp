<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title></title>
<head>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/boardInfo.css">


</head>
<body>
<div class="subback">
	<h2 id="center">${boardName}</h2>
</div>
	<div class="container">
		<div class="board_box_wrap">
			<div class="board_box_left">
			<h3 class="table_head">${b.subject}</h3>
			<p class="tables">${b.writer} 
				<i class="xi-time-o">${b.regdate}</i> 
				<i class="xi-message-o">건</i> 
				<i class="xi-eye-o">${b.readcnt}</i>
			</p>
			</div>
			<div class="board_box_right">
				<div class="side_menu"><i class="xi-bars"></i></div>
				<ul>
					<li><a href="boardUpdateForm?num=${b.num}">수정 <i class="xi-border-color"></i></a></li>
					<li><a href="boardDeleteForm?num=${b.num}">삭제 <i class="xi-bitbucket"></i></a></li>
				</ul>
			</div>
		
		</div>
		<table  class="table">
		<tr height="250px"><th>내용:</th><td>${b.content}</td></tr>
		<tr><th>파일:</th><td><img src="<%=request.getContextPath() %>/boardupload/${b.file1}" width="50%"></td></tr>
		</table>
		
		<div id="center" style="padding: 3px; overflow:hidden;">
			<!-- <button  class="btn btn-dark" 
			onclick="location.href='boardReplyForm?num=${b.num}'">답 변</button> -->
			<button  class="btn btn-dark"
			onclick="location.href='list'">목록 </button>
		</div>		
</div>

</body>
</html>

<script>

</script>
