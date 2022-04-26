<%@page import="dto.Camp" %>
<%@page import="java.util.List" %>
<%@page import="controller.CampController" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실관리</title>
</head>
<style>
button{
padding: 5px;
margin-right: 15px;
border-radius: 15px;
border-color: black;
border:solid 0.25px;
background-color: white;
}

.container, .container-lg, .container-md, .container-sm, .container-xl {
    max-width: 100%;
    margin: inherit;
    width: 100%;
    padding-right: 15px;
    padding-left: 290px;
}
.wrapper {
  width: 50px;
  height: 50px;
  text-align: center;
  margin: 50px auto;
}
#switch {
  position: absolute;
  /* hidden */
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}

.switch_label {
  position: relative;
  cursor: pointer;
  display: inline-block;
  width: 58px;
  height: 28px;
  background: #fff;
  border: 2px solid #daa;
  border-radius: 20px;
  transition: 0.2s;
}
.switch_label:hover {
  background: #efefef;
}
.onf_btn {
  position: absolute;
  top: 4px;
  left: 3px;
  display: inline-block;
  width: 20px;
  height: 20px;
  border-radius: 20px;
  background: #000;
  transition: 0.2s;
}
#switch:checked+.switch_label {
  background: #c44;
  border: 2px solid #c44;
}
.switch_label {
    position: relative;
    cursor: pointer;
    display: inline-block;
    width: 63px;
    height: 32px;
    background: #fff;
    border: 2px solid #181616;
    border-radius: 20px;
    transition: 0.2s;
    margin-left: -125px;
    margin-bottom: -50px;
}
.wrapper {
    width: 50px;
    height: 50px;
    text-align: center;
    margin: -35px auto;
    margin-left: 140px;
    margin-bottom: 3px;
}
#switch:checked+.switch_label:hover {
  background: #e55;
}

#switch:checked+.switch_label .onf_btn {
  left: 34px;
  background: #fff;
  box-shadow: 1px 2px 3px #00000020;
}
.table td, .table th {
    text-align-last: center;
    padding: 0.75rem;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
}
</style>
<body>
<hr>
	<!-- table list start //안되면 adminchk넣기 -->
	<div class="container">
		<h1 style="text-align: left;" id="center">캠핑장 리스트 <h5 style="float: right;padding-bottom: 10px;margin: inherit;margin-right: 30px;"><button type="button" onclick="window.open('<%=request.getContextPath()%>/camp/CampInsert','', 'width=500, height=700')">캠핑장 추가</button></h5></h1>
<table class="table table-hover">
			<thead>
				<tr>
				<td>이미지</td>
				<td>캠핑장이름</td>
				<td>캠핑장주소</td>
				<td>객실 타입</td>
				<td>요금</td>
				<td>관리</td>
				</tr>
				<tbody>
			<c:forEach var="c" items="${cl}">
				<tr>
				<td><img src="<%=request.getContextPath() %>/campupload/${c.campimg}" width="100" /></td>
				<td>${c.campname}</td>
				<td>${c.campaddr}</td> 
				<td>${c.room}</td>
				<td>${c.payidx}</td>
<td>
<form action="<%=request.getContextPath() %>/camp/campDelete" method="post">
<input type="hidden"   value="${c.campidx}"    name="campidx">
<button style="position: absolute; margin-left: 100px;" type="submit">삭제</button>
</form>
<form action="<%=request.getContextPath() %>/camp/campUpdate" method="post">
<input type="hidden"   value="${c.campidx}"    name="campidx">
<button style="margin-right: 40px;" type="button" onclick="window.open('<%=request.getContextPath()%>/camp/campUpdate?campidx=${c.campidx}','', 'width=500, height=700')">수정</button></form></td>
				</tr>
				</c:forEach></tbody>
</table></div>

<hr>
	<!-- table list start //안되면 adminchk넣기 -->
	<div class="container">
		<h1 style="text-align: left;" id="center">캠핑장 예약 현황</h1>
<table class="table table-hover">
			<thead>
				<tr>
				<th>캠핑장번호</th>
				<th>예약자 이름</th>
				<th>캠핑장 이름</th>
				<th>캠핑장 주소</th>
				<th>객실 타입</th>
				<th>보유 객실</th>
				<th>남은 객실</th>
				<th>요금</th>
				<th>체크인</th>
	 			<th>체크아웃</th>
				</tr>
			</thead>
			<tbody>
		
			<c:forEach var="r" items="${rl}"> 
				<tr>
			<td>${r.campidx}</td> 
				<td>${r.username}</td>
				<td>${r.campname}</td>
				<td>${r.campaddr}</td> 
				<td>${r.room}</td>
				<td>${r.roomno}</td>
		 		<td>${r.roomcnt}</td> 
				<td>${r.payidx}</td>
				<td><fmt:parseDate value ="${r.checkin}" var="checkin" pattern="yyyy-MM-dd" />
		<fmt:formatDate value ="${checkin}" pattern="yyyy-MM-dd" /></td>	
				<td><fmt:parseDate value ="${r.checkout}" var="checkout" pattern="yyyy-MM-dd" />
		<fmt:formatDate value ="${checkout}" pattern="yyyy-MM-dd" /></td>
				</tr></c:forEach></tbody>
</table></div>
</body>
</html>