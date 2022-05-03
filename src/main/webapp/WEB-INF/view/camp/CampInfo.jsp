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
  float: left;
  }
  .carousel-item {
  width: 800px;
  height: 700px;
  }
  .content {
  	border-radius:10px;
    padding:10px;
    border: 1px solid #ddd;
    resize: none;
  }
  .campaddr{
 	border-radius:10px;
  	padding:10px;
    border: 1px solid #ddd;
    resize: none;
  }
  </style>
</head>
<body>
<div class="subback">
    <h2 id="center">캠핑장 상세보기</h2>
</div>
<form action="<%=request.getContextPath() %>/camp/CampInfo" method="post">
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
      <img src= "<%= request.getContextPath() %>/campupload/${info.campimg}"  width="400" height="300">
    </div>
    <div class="carousel-item">
      <img src="<%= request.getContextPath() %>/campupload/${info.campimg2}"  width="400" height="300">
    </div>
    <div class="carousel-item">
      <img src="<%= request.getContextPath() %>/campupload/${info.campimg3}"  width="400" height="300">
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
<table class="table table-borderless">
    <tbody>
      <tr>
        <td>캠핑장</td>
        <td><input type="text" name="campname"  value="${info.campname }" readonly></td>
        <td></td>
      </tr>
      <tr>
        <td>주소</td>
        <td><textarea class="campaddr" name="campaddr"   rows="2" cols="50"readonly>${info.campaddr }</textarea></td>
        <td></td>
      </tr>
      <tr>
        <td>타입</td>
        <td><input type="text" name="room"  value="${info.room }" readonly></td>
        <td></td>
      </tr>
      <tr>
        <td>금액</td>
        <td><input type="text" name="payidx" value="${info.payidx }" readonly></td>
        <td></td>
      </tr>
      <tr>
        <td>체크인</td>
        <td><input type="time" name="chkin"  value="15:00" readonly></td>
        <td></td>
      </tr>
      <tr>
        <td>체크아웃</td>
        <td><input type="time" name="chkout"  value="11:00" readonly></td>
        <td></td>
      </tr>
      <tr>
        <td>소개</td>
        <td><textarea class="content" name="content"  rows="2" cols="50"readonly>${info.content }</textarea></td>
        <td></td>
      </tr>
    </tbody>
  </table>
<div class="confirm-btn">
<button type="button" class="btn btn-dark" onclick="newReserve('${info.campname }')">예약하기</button>
<button type="button" class="btn btn-dark" onclick="Back()">뒤로가기</button>
</div>
</div>
</form>
<script>
function newReserve (campname) {
	location.href='<%=request.getContextPath() %>/reserve/ReserveInsert?campname='+campname;
}
function Back (form) {
	location.href='<%=request.getContextPath() %>/camp/CampList';
}
</script>
</body>
</html>