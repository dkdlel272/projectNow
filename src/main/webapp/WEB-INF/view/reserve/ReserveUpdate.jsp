<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.notosanskr * { 
 font-family: 'Noto Sans KR', sans-serif;
}
h2#center {
    text-align:center;
    margin-bottom:50px;
    color:#fff;
    line-height:500px;
    font-weight:bold;
    font-size: 35px;
    font-family: 'Noto Sans KR', sans-serif;
}
.subback {
    width:100%;
    height:500px;
    overflow:hidden;
    background:url("<%=request.getContextPath()%>/image/reserve.jpg");
}
.container {
    margin-top:150px;
    margin-bottom:150px;
}
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  #demo {
  width: 40%;
  height: 30%;
  float: left;
  padding: 10px;
  }
  .comment {
  padding: 10px;
  }
  .carousel-item {
  width: 800px;
  height: 700px;
  }
  </style>
</head>
<body>
<div class="subback">
    <h2 id="center">${Rinfo.username }님의 예약</h2>
</div>
<form action="<%=request.getContextPath() %>/reserve/ReserveUpdatePro" method="post">
<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src= "<%= request.getContextPath() %>/campupload/${camp.campimg}" alt="Los Angeles" width="400" height="300">
    </div>
    <div class="carousel-item">
      <img src="<%= request.getContextPath() %>/campupload/${camp.campimg2}" alt="Chicago" width="400" height="300">
    </div>
    <div class="carousel-item">
      <img src="<%= request.getContextPath() %>/campupload/${camp.campimg3 }" alt="New York" width="400" height="300">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
<div class="comment">
<ul>
<li><input type="hidden" name="roomno"  value="${Rinfo.roomno }" readonly></li>
<li><input type="hidden" name="reserveidx"  value="${Rinfo.reserveidx }" readonly></li>
<li>예약자명:<input type="text" name="username"  value="${Rinfo.username }" readonly></li>
<li>캠핑장 : <input type="text" name="campname"  value="${Rinfo.campname }" readonly></li>
<li>객실 :<input type="text" name="room" value="${Rinfo.room }" readonly></li>
<li>체크인 :<input type="date" name="checkin"  value="${Rinfo.checkin }" ></li>
<li>체크아웃 :<input type="date" name="checkout"  value="${Rinfo.checkout }" ></li>
<li>성인인원수 :<select  name="person" onchange="changePerson(this.value)">
											<option  value="${Rinfo.person }">1</option>
											<option  value="${Rinfo.person }">2</option>
											<option  value="${Rinfo.person }">3</option>
											<option  value="${Rinfo.person }">4</option>
										</select></li>
<li>소인인원수 :<select  name="kid" onchange="changeKid(this.value)">
											<option  value="${Rinfo.kid }">1</option>
											<option  value="${Rinfo.kid }">2</option>
											<option  value="${Rinfo.kid }">3</option>
											<option  value="${Rinfo.kid }">4</option>
										</select></li>
<li>금액 :<input type="number" name="payidx"  value="${Rinfo.payidx }" readonly></li>
</ul>
<div class="confirm-btn">
<button type="submit" class="btn btn-dark">변경하기</button>
<button type="button" class="btn btn-dark" onclick="GoBack ()">뒤로가기</button>
</div>
</div>
</form>
<script>
function changePerson(p) {
	
	let person = document.querySelector("#person");
	person.innerHTML=p
}
function changeKid(k) {
	let kid = document.querySelector("#kid");
	kid.innerHTML=k
}
function GoBack (form) {
	location.href='<%=request.getContextPath() %>/reserve/ReserveInfo';
}
</script>
</body>
</html>