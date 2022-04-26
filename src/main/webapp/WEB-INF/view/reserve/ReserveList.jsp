<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 조회하기</title>
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
</style>
</head>
<body>
<div class="subback">
    <h2 id="center">예약 조회하기</h2>
</div>


<div class="container">
  <h2>예약 조회</h2>            
  <table class="table table-hover">
    <thead>
      <tr>
        <th>캠핑장이름</th>
        <th>예약자명</th>
        <th>객실</th>
        <th>체크인</th>
        <th>체크아웃</th>
        <th>성인</th>
        <th>소인</th>
        <th>금액</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="r" items="${li }">
    
      <tr>
        <td>${r.campname }</td>
        <td>${r.username }</td>
        <td>${r.room }</td>
        <td><fmt:parseDate value ="${r.checkin}" var="checkin" pattern="yyyy-MM-dd" />
		<fmt:formatDate value ="${checkin}" pattern="yyyy-MM-dd" /></td>
        <td><fmt:parseDate value ="${r.checkout}" var="checkout" pattern="yyyy-MM-dd" />
		<fmt:formatDate value ="${checkout}" pattern="yyyy-MM-dd" /></td>
        <td>${r.person }</td>
        <td>${r.kid }</td>
        <td>${r.payidx }</td>
        <td><input type="hidden"value="${r.roomno }"></td>
        <td><button type="button" class="btn btn-dark" onclick="GoInfo ('${r.reserveidx}')">상세보기</button></td>
        <c:choose>
        <c:when test="${r.checkin > currdate}">
        <td><button type="button" class="btn btn-dark" onclick="GoDelete ('${r.reserveidx}', '${r.checkin }')">예약취소</button></td>
        </c:when>
         <c:when test="${r.checkout <= currdate}">
        <td><button type="button" class="btn btn-dark" onclick="GoReview ('${r.reserveidx}', '${r.checkin }')">리뷰작성</button></td>
        </c:when>
        </c:choose>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
<script>
function GoDelete (idx, checkin) {
    let currdate = new Date().toLocaleDateString();		
    
    var str = currdate;
    var newStr = str.split(".");												
    var newcheckin = checkin.split(" ");								

		if (newStr[1]<10)  newStr[1] = '0'+newStr[1].trim()		
		
		let newdate = newStr[0]+"-"+newStr[1].trim()+"-"+newStr[2].trim();		
		let regdate = newcheckin[0].trim()				

     if(newdate == regdate) { 
     	alert("예약당일은 취소가 불가능합니다.")
     	return;
     } else {
     	confirm("*예약을 취소하시겠습니까? \n *예약당일은 취소가 불가능합니다.")
     	alert("예약이 취소되었습니다.")
     	location.href='<%=request.getContextPath() %>/reserve/ReserveDeletePro?reserveidx='+idx;
     }
}
function GoInfo (idx) {
	location.href='<%=request.getContextPath() %>/reserve/ReserveInfo?reserveidx='+idx;
}
function GoReview (idx) {
	location.href='<%=request.getContextPath() %>/board/boardWriteForm';
}
</script>
</body>
</html>