<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
table {
	border-spacing: 0;
    border-collapse: separate;
    font-size: 16px;
    width: 100%;
    margin-bottom: 32px;
    line-height: 1.6em;
    letter-spacing: -1px;
}
table  td {
    color: #143f4a;
    padding: 14px;
    text-align: left;
    letter-spacing: 0.5px;
    word-break: keep-all;
}
</style>
</head>
<body>
<div class="subback">
    <h2 id="center">예약하기</h2>
</div>
<div class="container">
<form action="<%=request.getContextPath() %>/reserve/ReserveInsertPro" method="post" id="insert">
  <table>

<c:forEach var="user" items="${user }">
	  <tr>
	  	<th>예약자명</th>
	  	<td><input type="text" class="form-control" name="username" value="${user.name }" readonly></td>
	  	<td>${user.name }님이 선택하신 캠핑장은</td>
	  </tr>
	  </c:forEach>
	  <tr>
	  	<th>캠핑장</th>
	  	<td><input type="text" class="form-control" name="campname" value="${camp.campname }" readonly></td>
	  	<td>입니다.</td>
	  </tr>	
	  
	  <tr>
	  	<th>객실</th>
	  	<td><input type="text" class="form-control"	name="room" value="${camp.room }" readonly></td>
	  	<td></td>
	  </tr>	
	  
	  <tr>
	  	<th>금액</th>
	  	<td><input type="number" class="form-control"	name="payidx" value="${camp.payidx }" readonly></td>
	  	<td>체크인 15:00시 / 체크아웃 11:00시</td>
	  </tr>	
	  
	  <tr>
	  	<th>체크인</th>
	  	<td><input type="date" id="currentDate" class="form-control" name="checkin" ></td>
	  	<td style="color:red; font-weight:bold;">*당일은 예약취소가 불가능합니다.</td>
	  </tr>	
	  
	  <tr>
	  	<th>체크아웃</th>
	  	<td><input type="date" class="form-control" name="checkout" ></td>
	  	<td></td>
	  </tr>	
	  
	  <tr>
	  	<th>성인</th>
	  	<td><input type="text" class="form-control" name="person"></td>
	  	<td></td>
	  </tr>	
	  
	  <tr>
	  	<th>소인</th>
	  	<td><input type="text" class="form-control" name="kid"></td>
	  	<td></td>
	  </tr>	
	  
	  <tr>
        <td></td>
        <td><input type="hidden" class="form-control"	name="roomno" value="1"></td>
        <td></td>
      </tr>	
  </table>
	<div id="center" style="padding: 3px;">
		<button type="button" class="btn btn-dark" id="pay">결제하기</button>
		
	</div>
	</form>
	</div>
	<script>
	
$("#pay").click(function () {
var IMP = window.IMP;
IMP.init('imp02961916');
IMP.request_pay({
pg: 'html5_inicis',

pay_method: 'card',
card_quota:'[2,3,4,5,6]',

merchant_uid: 'merchant_' + new Date().getTime(),

name: '${camp.campname}',

amount: '1000',

<c:forEach var="user" items="${user }">
buyer_email: '${user.email}',
buyer_name: '${user.name}',
buyer_tel: '${user.tel}',
buyer_addr: '${user.address}',
</c:forEach>
}, function (rsp) {
console.log(rsp);
if (rsp.success) {
var msg = '결제가 완료되었습니다.';

document.getElementById('insert').submit();

} else {
var msg = '결제에 실패하였습니다.';
msg += '에러내용 : ' + rsp.error_msg;
}
alert(msg);
});
});

</script>
</body>
</html>