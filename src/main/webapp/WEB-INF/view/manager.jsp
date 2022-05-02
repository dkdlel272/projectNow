<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title><sitemesh:write property='title'/></title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
element.style {
    max-width: 100%;
    width: 1920px;
    padding-right: 11%;
    padding-left: 15%;
    display: block;
    height: 364px;
}
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
    font-family: "Segoe UI",Arial,sans-serif;
    font-weight: 400;
    margin: 10px 90px;
}
.w3-sidebar {
    height: 754px;
    width: 15%;
    position: fixed!important;
    z-index: 1;
    overflow: auto;
}
ul.menu_login {background:#616161!important;}
#wrapper {
	display:none !important;
}
.subback {
	display:none !important;
}
.table .thead-dark th {
    color: #000;
    font-size: 16px;
    background:none;
}
.table thead th {
    vertical-align: bottom;
    border-bottom: 1px solid #dee2e6;
}
.table td, .table th {
    padding: 0.75rem;
    vertical-align: top;
    font-size:15px;
    border-top: 1px solid #dee2e6;
}
p.list_count {
	font-size:16px;
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
 h2#head_Text {
 	text-align:center;
 	width:100%;
 	font-size:30px;
 	font-weight:bold;
 	margin-bottom:100px;
 }

header{
height: 95px;
}
.w3-sidebar {
  height: 100%;
    width: 15%;
    z-index: 1;
    overflow: auto;
    top: 0px;
    padding-top: 90px;
}
ul.menu_login li a {
    color: #fff;
    font-size: 13px;
    display: table-cell;
    text-decoration: none;
    }
ul.menu_login {background:#616161!important;}
#wrapper {
	display:none !important;
}
hr {
    border: 0;
    border-top: 1px solid #eee;
    margin: 0px 0;
}
</style>
</head>
<sitemesh:write property='head'/>
<body>
<div class="wrapper_login">
	<ul class="menu_login"  style="background: #616161;display: flow-root;padding-bottom: 24px;
    list-style: none;margin: 0px;padding: 10px;">
		<c:choose>
					<c:when test="${memberId == null}">
						<li style="position: static; float: right;">
						<a href="<%=request.getContextPath()%>/userdata/joinForm">JOIN</a></li>
						<li style="float: right;">
						<a href="<%=request.getContextPath()%>/userdata/loginForm">LOGIN</a></li>
					</c:when>
					<c:when test="${memberId eq 'vision'}">
						<li style="position: static; float: right; font-size: 10px;"class="nav-item">
						<a class="nav-link" href="<%=request.getContextPath()%>/userdata/manager">관리자페이지&nbsp;</a></li> <!-- &nbsp;지우지 마세요 -->
						<li style="float: right;" class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/board/main">일반페이지&nbsp;&nbsp;</a></li>
						<li style="float: right;" class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/userdata/logout">로그아웃&nbsp;&nbsp;</a></li>
					</c:when>

				</c:choose>
		
	</ul>
	</div>
	<div class="w3-sidebar w3-bar-block w3-dark-grey w3-animate-left"
		style=" height-: auto; margin-bottom:inherit;" id="mySidebar">
		<button class="w3-button w3-block w3-left-align" onclick="myFunc1()">
			회원관리 <i class="fa fa-caret-down"></i>
		</button>
		<div id="1" class="w3-hide w3-white w3-card">
			<a href="<%=request.getContextPath() %>/userdata/userdataList" class="w3-bar-item w3-button">회원리스트</a>
			<a href="<%=request.getContextPath() %>/userdata/blackList" class="w3-bar-item w3-button">블랙리스트 관리</a>
			<a href="<%=request.getContextPath() %>/userdata/leaveList" class="w3-bar-item w3-button">탈퇴회원 리스트</a>
		</div>
		
		<button class="w3-button w3-block w3-left-align" onclick="myFunc2()">
			캠핑장관리 <i class="fa fa-caret-down"></i>
		</button>
		<div id="2" class="w3-hide w3-white w3-card">
			<a href="<%=request.getContextPath()%>/camp/reserveManager" class="w3-bar-item w3-button">예약관리</a>
			<a href="<%=request.getContextPath()%>/camp/CampManager" class="w3-bar-item w3-button">객실관리</a>
		</div>
		
		<button class="w3-button w3-block w3-left-align" onclick="myFunc3()">
			게시판관리 <i class="fa fa-caret-down"></i>
		</button>
		<div id="3" class="w3-hide w3-white w3-card">
			<a href="<%=request.getContextPath()%>/board/list_admin?boardid=1" class="w3-bar-item w3-button">공지사항관리</a>
		</div>
	</div>

<sitemesh:write property='body' />
	
	
	
	<script>
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
		}
		function w3_close() {
			document.getElementById("mySidebar").style.display = "block";
		}
		
	</script>
	<script>
		function myFunc1() {
			var x = document.getElementById("1");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
				x.previousElementSibling.className += " w3-green";
			} else {
				x.className = x.className.replace(" w3-show", "");
				x.previousElementSibling.className = x.previousElementSibling.className
						.replace(" w3-green", "");
			}
		}
		function myFunc2() {
			var y = document.getElementById("2");
			if (y.className.indexOf("w3-show") == -1) {
				y.className += " w3-show";
				y.previousElementSibling.className += " w3-green";
			} else {
				y.className = y.className.replace(" w3-show", "");
				y.previousElementSibling.className = y.previousElementSibling.className
						.replace(" w3-green", "");
			}
		}
		
		function myFunc3() {
			var y = document.getElementById("3");
			if (y.className.indexOf("w3-show") == -1) {
				y.className += " w3-show";
				y.previousElementSibling.className += " w3-green";
			} else {
				y.className = y.className.replace(" w3-show", "");
				y.previousElementSibling.className = y.previousElementSibling.className
						.replace(" w3-green", "");
			}
		}
		
		</script>
</body>
</html>
