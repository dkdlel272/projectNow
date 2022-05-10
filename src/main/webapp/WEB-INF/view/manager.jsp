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
	display: flex;
	width: 100%;
	align-items: stretch;
}
/*메뉴 텍스트에 마우스 올려놓을 시 밑줄생김 방짐*/
a, a:hover {
	text-decoration: none;
}
/*사이드 메뉴 영역*/
#sidebar {
	min-width: 250px;
	max-width: 250px;
	min-height: 100vh;
	background-color: dimgray;
	transition: 0.5s all;
}

#sidebar ul li a {
	padding: 10px 15px;
	font-size: 1.1em;
	display: block;
	color: black;
}
/*사이드 메뉴 숨기기 버튼 클릭 시 사이드 메뉴에 스타일 설정*/
#sidebar.active {
	margin-left: -250px;
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
	background: #616161 !important;
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

ul.menu_login {
	background: #616161 !important;
}

#wrapper {
	display: none !important;
}

hr {
	border: 0;
	border-top: 1px solid #eee;
	margin: 0px 0;
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
		<ul class="menu_login"
			style="background: #616161; display: flow-root; padding-bottom: 24px; list-style: none; margin: 0px; padding: 10px;">
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
	<div class="wrapper">
		<!--사이드 메뉴-->
		<nav id="sidebar">
			<ul class="list-unstyled components">
				<li><a href="#dropdownMenu1" data-toggle="collapse"
					aria-expanded="false" class="dropdown-toggle"> 회원관리 </a> <!--드롭다운 메뉴-->
					<ul class="collapse list-unstyled" id="dropdownMenu1">
						<li><a href="<%=request.getContextPath()%>/userdata/userdataList">회원리스트</a></li>
						<li><a href="<%=request.getContextPath()%>/userdata/blackList">블랙리스트 관리</a></li>
						<li><a href="<%=request.getContextPath()%>/userdata/leaveList">탈퇴회원 리스트</a></li>
					</ul></li>
				<li><a href="#dropdownMenu2" data-toggle="collapse"
					aria-expanded="false" class="dropdown-toggle"> 캠핑장관리 </a> <!--드롭다운 메뉴-->
					<ul class="collapse list-unstyled" id="dropdownMenu2">
						<li><a href="<%=request.getContextPath()%>/camp/reserveManager">예약관리</a></li>
						<li><a href="<%=request.getContextPath()%>/camp/CampManager">객실관리</a></li>
					</ul></li>
				<li><a href="#dropdownMenu3" data-toggle="collapse"
					aria-expanded="false" class="dropdown-toggle"> 게시판관리 </a> <!--드롭다운 메뉴-->
					<ul class="collapse list-unstyled" id="dropdownMenu3">
						<li><a href="<%=request.getContextPath()%>/board/list_admin?boardid=1">공지사항관리</a></li>
					</ul></li></ul>
		</nav>
		<!--콘텐츠영역-->
	</div>
		<sitemesh:write property='body' />
	<script>
		$(function() {
			$('#sidebarToggle').on('click', function() {
				$('#sidebar').toggleClass('active');
			});
		});
	</script>

</body>
</html>
