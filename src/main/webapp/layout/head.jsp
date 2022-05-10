<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title><sitemesh:write property="title" /></title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resouces/css/Head.css">

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

</head>
<body>
	<header>
		<div class="wrapper_login">
			<ul class="menu_login">

				<c:choose>
					<c:when test="${memberId == null}">
						<li style="position: static; float: right;">
						<a href="<%=request.getContextPath()%>/userdata/joinForm">JOIN</a></li>
						<li style="float: right;">
						<a href="<%=request.getContextPath()%>/userdata/loginForm">LOGIN</a></li>
					</c:when>
					<c:when test="${memberId eq 'vision'}">
						<li style="position: static; float: right; font-size: 10px;"class="nav-item">
						<a class="nav-link" href="<%=request.getContextPath()%>/userdata/manager">관리자페이지</a></li>
						<li style="float: right;" class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/board/main">일반페이지</a></li>
						<li style="float: right;" class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/userdata/logout">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li style="position: static; float: right;">
						<a href="<%=request.getContextPath()%>/userdata/logout">LOGOUT</a></li>
						<li style="float: right;">
						<a href="<%=request.getContextPath()%>/userdata/mypage">MY PAGE</a></li>
					</c:otherwise>
				</c:choose>
				
	

				



			</ul>

		</div>
		<div id="wrapper">
			<div class="logo">
				<a href="<%=request.getContextPath()%>/board/main">
				<img src="<%=request.getContextPath()%>/image/wucam1.png" width="150px"></a>
			</div>
			<nav>

				<ul>
					<li class="dropdown"><a
						href="<%=request.getContextPath()%>/board/company">회사소개</a>
						<ul>
							<li><a href="<%=request.getContextPath()%>/board/company">업체소개</a></li>
							<li><a href="<%=request.getContextPath()%>/board/map">오시는길</a></li>
						</ul></li>
					<li class="dropdown"><a href="">이용안내</a>
						<ul>
							<li><a href="#">About Version</a></li>
							<li><a href="#">About Version</a></li>
							<li><a href="#">Contact Us</a></li>
							<li><a href="#">Contact Us</a></li>
						</ul></li>
					<li class="dropdown"><a
						href="<%=request.getContextPath()%>/reserve/CampList">예약관리</a>
						<ul>
							<li><a href="<%=request.getContextPath()%>/reserve/CampList">캠핑장보기</a></li>
							<li><a
								href="<%=request.getContextPath()%>/reserve/ReserveInsert">예약하기</a></li>
						</ul></li>
					<li class="dropdown"><a
						href="<%=request.getContextPath()%>/board/list?boardid=1">커뮤니티</a>
						<ul>
							<li><a
								href="<%=request.getContextPath()%>/board/list?boardid=1">공지사항</a></li>
							<li><a
								href="<%=request.getContextPath()%>/board/boardReview?boardid=2">리뷰게시판</a></li>
							<li><a
								href="<%=request.getContextPath()%>/board/boardinquiryForm">자주묻는질문</a></li>
						</ul></li>
					<li class="dropdown"><a
						href="<%=request.getContextPath()%>/sale/saleList">삽니다&팝니다</a></li>
				</ul>
			</nav>
		</div>
	</header>

	<sitemesh:write property='head' />
	<sitemesh:write property='body' />
	<br>
	<!-- Footer -->
	<style>
.footer_wrap {
	width: 100%;
	background: #f9f9f9 !important;
	padding: 80px !important;
}

.footer {
	width: 1700px !important;
	margin: 0 auto !important;
}

.footer p {
	color: #000;
	margin-bottom: 0px;
	padding-top: 20px;
	border-top: 1px solid #ddd;
}

.f_about {
	font-size: 14px;
	color: #000;
	margin-top: 30px;
	margin-bottom: 50px;
	display: flex;
	width: 50%;
}

.cs_f {
	width: 20%;
	color: #000;
	font-size: 30px;
	font-weight: bold;
}

.cs_num_wrap {
	width: 30%;
}

.cs_num {
	font-size: 35px;
	font-weight: bold;
	color: red;
}

.cs_about {
	font-size: 15px;
	margin-top: 20px;
}

.f_menu_wrap {
	width: 100%;
	padding-bottom: 20px;
	border-bottom: 1px solid #ddd;
	overflow: hidden;
}

.f_menu_wrap ul li {
	width: 130px;
	float: left;
	text-align: center;
}

.f_menu_wrap ul li a {
	font-weight: bold;
	font-size: 16px;
	color: #444;
	display: block;
}

.f_menu_wrap ul li:hover a {
	text-decoration: none;
}
</style>


	<div class="footer_wrap">
		<div class="f_menu_wrap">
			<ul>
				<li><a href="#">개인정보처리방침</a></li>
				<li><a href="#">회사소개</a></li>
				<li><a href="<%=request.getContextPath()%>/board/map">오시는길</a></li>
			</ul>
		</div>

		<div class="footer">
			<div class="f_about">
				<div class="cs_f">CS center</div>
				<div class="cs_num_wrap">
					<div class="cs_num">1111-0000</div>
					<div class="cs_about">
						평일 09:30~17:30 <br> 점심시간 13:00~14:00
					</div>
				</div>
			</div>
			<p>
				ADDRESS : 서울특별시 강남구 역삼동 819-10 세경빌딩3층 | TEL: 02-538-3644 |
				사업자등록번호:220-88-65930<br> COPYRIGHT(C) WORIHAM CAMPING. ALL
				RIGHTS RESERVED.
			</p>
		</div>
	</div>

</body>
</html>

<script>
	$('#header')
			.prepend(
					'<div id="menu-icon"><span class="first"></span><span class="second"></span><span class="third"></span></div>');

	$("#menu-icon").on("click", function() {
		$("nav").slideToggle();
		$(this).toggleClass("active");
	});
</script>
<script>
	$(document).ready(
			function() {
				$(window).scroll(
						function() {
							var scroll = $(window).scrollTop();
							if (scroll > 1) {
								$("#wrapper").css("display", "none");
								$("ul.menu_login").css("display", "none");
								$(".wrapper_login").css("display", "none");

							} else {
								$("#wrapper").css("display", "block");
								$("ul.menu_login").css("display", "block");
								$(".wrapper_login").css("display", "block");
								$("#logo a img").attr("src",
										"/skin/layouts/seutem/img/logo.png");
							}
						})
			})
</script>

