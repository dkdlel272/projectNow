
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/boardReviewInfo.css">
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
				<i class="xi-message-o">${b.refcount}건</i> 
				<i class="xi-eye-o">${b.readcnt}</i>
			</p>
			</div>
			<div class="board_box_right">
				<input id="check-btn" class="side_menu" type="checkbox"/>
				<label for="check-btn"><i class="xi-bars"></i></label>
				<ul class="menubars">
					<li><a href="boardUpdateForm?num=${b.num}">수정 <i class="xi-border-color"></i></a></li>
					<li><a href="boardReviewDeleteForm?num=${b.num}">삭제 <i class="xi-bitbucket"></i></a></li>
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
			onclick="location.href='<%=request.getContextPath()%>/board/boardReview?boardid=2'">목록 </button>
		</div>	
		
		
		<div class="post_upload">
		
		<h4>댓글목록${refcount}</h4>
			<c:forEach var="r" items="${li}">
				<form action="<%=request.getContextPath()%>/board/boardReviewDeleteForm?num=${r.num}"" method="post">
					<c:if test="${r.refstep !=0}">
					<div class="post_wrap">
					<div class="post_left">
						<div class="p_load">
							<span>${r.writer}</span><br>
							&nbsp&nbsp${r.content}
						</div>
					</div>
					
					<div class="post_right">
						<button type="submit" class="btn btn-dark btns">삭제</button>
					</div>
					
					</div>
					</c:if>
				</form>
			</c:forEach>
			
		</div>
		
		
		
	 <form name="f" action="<%=request.getContextPath()%>/board/boardReplyPro" method="post">
	 	<input type="hidden" name="num" value="${b.num}">
		<input type="hidden" name="ref" value="${b.ref}">
		<input type="hidden" name="reflevel" value="${b.reflevel}">
		<input type="hidden" name="refstep" value="${b.refstep}">
			<input type="hidden" name="subject" value=" ">
		 <div class="post_text">
			<label>댓글쓰기</label>
			<textarea class="form-control" rows="10" cols="50" name="content" placeholder="로그인 후 댓글내용을 입력해주세요"></textarea>
		</div>
		
		<div class="post_about">
			<div class="left_about">
				<input type="text" class="form-control" name="writer" placeholder="작성자">
			</div>
			<div class="right_about">
				<input type="password" class="form-control" name="pass" placeholder="비밀번호">
			</div>
		</div>
		<div id="center" style="padding: 3px; overflow:hidden;">
			<button type="submit" class="btn btn-dark btn_one">댓글등록</button>
		</div> 
	</form>
</div>


</body>
</html>

<script>
</script>