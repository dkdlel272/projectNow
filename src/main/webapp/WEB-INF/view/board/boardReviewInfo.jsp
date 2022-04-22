
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
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
    margin-left: 1%;
    margin-top: 50px;
}
h3.table_head {
	font-size:30px;
	font-weight:bold;
}
.table tr th {
	width:150px; 
}
p.tables {
	font-size:16px;
}
.post_text {
	margin-top:50px;
}
.post_text label {
	font-weight:bold;
}
 .board_box_wrap {
 	width:100%;
 	display:flex;
 	borer-bottom:1px solid #ddd;
 	height: 75px;
 }
 .board_box_left {
 	width:80%;
 }
 .board_box_right {
 	width:20%;
 	text-align: right;
 	margin-top: 43px;
 } 
 .side_menu {
 	text-align: right;
    padding-top: 35px;
 }
 .board_box_right ul {
    position:relative;
    top: 0px;
    right: -102px;
    background:#fff;
    box-shadow: 0 2px 3px #eee;
 	width:120px;	
    border: 1px solid #d4d4d4;
    -webkit-box-shadow: 0 2px 3px #eee;
    -moz-box-shadow: 0 2px 3px #eee;
    box-shadow: 0 2px 3px #eee;
 }
   .board_box_right ul li{
   		text-align:center;
}
  .board_box_right ul li a{
  	color:#000;
  	font-size:14px;
  	display:block;
  	line-height: 35px;
  	text-decoration:none;
}
.board_box_right ul li:nth-child(1) {
	border-bottom:1px solid #ddd;
}  
.post_about {
	width:100%;
	margin-top:30px;
	display:flex;
} 
.left_about {
	width:49%;
	margin-right:2%;
}
.right_about {
	width:49%;
}
.btn_one {
	background: #ff3a3a;
    color: #fff;
    border:1px solid #ff3a3a;
    -webkit-box-shadow: 0 2px 5px rgb(0 0 0 / 10%);
    -moz-box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    box-shadow: 0 2px 5px rgb(0 0 0 / 10%);
}
.post_wrap {
	width:100%;
	display:flex;
}
.post_upload {
	margin-top:100px;
	padding-bottom:30px;
	border-bottom:2px solid #000;
}
.post_upload h4 {
	margin-bottom:25px;
	margin-top:50px;
	color:blue;
	font-size:18px;
	font-weight:bold;
}
.p_load {
	border-bottom:1px solid #ddd;
	margin-bottom:20px;
	padding-bottom:20px;

} 
.post_left {
	width:90%;
}
.post_right {
	margin-top:-50px;
	width:10%;
}
.p_load span {
	font-weight:bold;
	font-size:16px;
	line-height:35px;
}
.btns {
	background:#fff;
	color:#000;
	width:100%;
	border:1px solid #1d2124;
} 
.btns:hover {
	color: #fff;
    background-color: #23272b;
    border-color: #1d2124;
}
#check-btn { display: none; }
#check-btn:checked ~ .menubars { display: block; } 
.menubars { display: none; }
</style>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<textarea class="form-control" rows="10" cols="50" name="content" placeholder="댓글내용을 입력해주세요"></textarea>
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