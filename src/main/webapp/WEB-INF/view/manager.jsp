<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title><sitemesh:write property='title' /></title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<style>
/*부트스트랩 사이드바 시작*/
/*레이아웃 영역 지정*/
.wrapper {
	background-color: #f3f3f3;
	width: 100%;
	align-items: stretch;
	display: block;
}
/*메뉴 텍스트에 마우스 올려놓을 시 밑줄생김 방짐*/
a, a:hover {
	text-decoration: none;
}
/*사이드 메뉴 영역*/
#sidebar {
	padding-top: 180px;
	min-width: 250px;
	max-width: 250px;
	min-height: 99.9vh;
	background: linear-gradient(150deg, #3585CB, #48a3e5, #2babbf, #519ed7, #4496ed);
	transition: 0.5s all;
	margin-top: -24px;
}

#sidebar ul li a {
	padding: 10px 15px;
	font-size: 1.1em;
	display: block;
	color: black;
}

a[data-toggle="collapse"] {
	position: relative;
}
/*상위 메뉴의 화살표 스타일 설정*/
.dropdown-toggle::after {
	display: block;
	position: absolute;
	top: 50%;
	right: 20px;
	transform: translateY(-50%);
}
/*하위 메뉴의 텍스트 스타일 설정*/
ul ul a {
	font-size: 0.9em !important;
	padding-left: 24px !important;
	background-color: aliceblue;
}

/*부트스트랩 사이드바 끝*/
.table {
	padding-right: 0px;
	width: 40%;
	margin-bottom: 1rem;
	border: 0px solid #bcbcbc;
	color: #212529;
	margin-left: 90px;
	border-collapse: collapse;
}

.container, .container-lg, .container-md, .container-sm, .container-xl {
	max-width: 100%;
	margin: inherit;
	width: 100%;
	padding-right: 580px;
	padding-left: 200px;
}

h1, h2, h3, h4, h5, h6 {
	font-family: "Segoe UI", Arial, sans-serif;
	font-weight: 400;
	margin: 10px 90px;
}

ul.menu_login {
	display: flow-root;
	padding-bottom: 20px;
	padding-top: 20px;
	list-style: none;
	margin: 0px;
	padding-right: 1321px;
	float: right;
	background: linear-gradient(150deg, #3585CB, #48a3e5, #2babbf, #519ed7, #4496ed);
}

#wrapper {
	display: none !important;
}

.subback {
	display: none !important;
}

.table .thead-dark th {
	color: #000;
	font-size: 16px;
	background: none;
}

.table thead th {
	vertical-align: bottom;
	border-bottom: 1px solid #dee2e6;
}

.table td, .table th {
	padding: 0.75rem;
	vertical-align: top;
	font-size: 15px;
	border-top: 1px solid #dee2e6;
}

p.list_count {
	font-size: 16px;
}

a {
	color: #000;
	font-size: 15px;
}

p.button_text {
	font-size: 16px;
	margin-bottom: 0px;
	font-weight: none;
	text-align: center;
}

p.button_text a {
	text-decoration: none !important;
	display: block;
	color: #fff;
}

.list_button {
	width: 150px;
	float: right;
	padding: px;
	padding: 10px;
	background-color: #23272b;
	border-radius: 50px;
}

.list_button:hover {
	background: #545658;
}

.list_button:hover a {
	color: #fff;
}

.pagination {
	width: 100%;
}

.page-item.active .page-link {
	background-color: #23272b;
	border: none;
}

.page-link {
	color: #000;
}

.container {
	margin-top: 150px;
}

h2#head_Text {
	text-align: center;
	width: 100%;
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 100px;
}

header {
	height: 95px;
}

ul.menu_login li a {
	color: #fff;
	font-size: 13px;
	display: table-cell;
	text-decoration: none;
}


#wrapper {
	display: none !important;
}

hr {
	border: 0;
	border-top: 1px solid #eee;
	margin: 0px 0;
}

.listbar {
	text-align: center;
	color: rgb(255, 255, 255);
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	text-shadow: 1px 3px 3px #464646;
}

.hr-sect {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgb(255, 255, 255);
	font-size: 14px;
	margin: 20px 0px;
}

.hr-sect::before {
	content: "";
	flex-grow: 1;
	background: rgb(255, 255, 255);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 11px;
}

.hr-sect::after {
	content: "";
	flex-grow: 4;
	background: rgb(255, 255, 255);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 13px;
}
</style>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
</head>
<sitemesh:write property='head' />
<body>
	<div class="wrapper_login">
		<ul class="menu_login" style="">
			<c:choose>
				<c:when test="${memberId == null}">
					<li style="position: static; float: right;"><a
						href="<%=request.getContextPath()%>/userdata/joinForm">JOIN</a></li>
					<li style="float: right;"><a
						href="<%=request.getContextPath()%>/userdata/loginForm">LOGIN</a></li>
				</c:when>
				<c:when test="${memberId eq 'vision'}">
					<li style="position: static; float: right; font-size: 10px;"
						class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/userdata/manager">관리자페이지&nbsp;</a></li>
					<!-- &nbsp;지우지 마세요 -->
					<li style="float: right;" class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/board/main">일반페이지&nbsp;&nbsp;</a></li>
					<li style="float: right;" class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/userdata/logout">로그아웃&nbsp;&nbsp;</a></li>
				</c:when>
			</c:choose>
		</ul>
	</div>
	<a href="<%=request.getContextPath()%>/userdata/manager"><img
		style="padding-top: 0px; padding-left: 15px; margin-left: 7px; position: absolute;"
		src="<%=request.getContextPath()%>/image/wucam2.png" width="200px"></a>
	<br>
	<div class="wrapper">
		<!--사이드 메뉴-->
		<nav id="sidebar">
			<div
				style="text-align: center; color: white; margin-top: -85px; padding-bottom: 40px;">대시보드</div>
			<div class="hr-sect">회원관리</div>
			<a href="<%=request.getContextPath()%>/userdata/userdataList">
			<div class="listbar">회원리스트</div></a><br>
			<a	href="<%=request.getContextPath()%>/userdata/blackList">
			<div class="listbar">블랙리스트</div></a><br>
			<a href="<%=request.getContextPath()%>/userdata/leaveList">
			<div class="listbar">탈퇴회원리스트</div></a><br>
			<div class="hr-sect">캠핑관리</div>
			<a href="<%=request.getContextPath()%>/camp/reserveManager">
			<div class="listbar">예약관리</div></a><br>
			<a href="<%=request.getContextPath()%>/camp/CampManager">
			<div class="listbar">객실관리</div></a><br>
			<div class="hr-sect">게시판관리</div>
			<a href="<%=request.getContextPath()%>/board/list_admin?boardid=1">
			<div class="listbar">공지사항관리</div></a><br></ul>
		</nav>
		<!--콘텐츠영역-->
	</div>
	<sitemesh:write property='body' />

</body>
</html>
