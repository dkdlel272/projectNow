<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
header{
height: 95px;
}
.w3-sidebar {
    height: 100%;
    width: 15%;
    position: fixed!important;
    z-index: 1;
    overflow: auto;
	top:33px;
	padding-top:50px;
}
ul.menu_login {background:#616161!important;}
#wrapper {
	display:none !important;
}
.subback {
	display:none !important;
}
ul.menu_login li {
	width: 117px;
    padding-top: 15px;
}
</style>
</head>
<body>
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
