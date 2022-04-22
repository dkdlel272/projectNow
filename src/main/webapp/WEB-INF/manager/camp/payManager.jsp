<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<meta charset="UTF-8">
<title>결제 관리</title>
</head>
<style>
.table {
    width: 40%;
    margin-bottom: 1rem;
    border: 1px solid #bcbcbc;
    color: #212529;
    }
 th, td {
  border: 1px solid #bcbcbc;
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
button, input {
    overflow: visible;
    width: 45px;
}
#switch:checked+.switch_label {
  background: #c44;
  border: 2px solid #c44;
}
.container, .container-lg, .container-md, .container-sm, .container-xl {
    max-width: 1140px;
    margin: inherit;
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
</style>
<body>
<hr>
	<!-- table list start //안되면 adminchk넣기 -->
	<div class="container">
		<h1 style="text-align: left;" id="center">결제 및 서비스 관리</h1>
<table class="table table-hover">
			<thead>
				<tr>
				<th colspan="4">입·출금 내역 정보</th>
				</tr>
				<tr>
				<td>입금내역</td>
				<td>벨류</td>
				<td>출금내역</td>
				<td>벨류</td>
				</tr>
				<tr>
				<td>예약자 입금 현황</td>
				<td>벨류</td>
				<td>예약자 미입금 현황</td>
				<td>벨류</td>
				</tr>
				<tr>
				<td>취소건 현황</td>
				<td>벨류</td>
				<td>취소 미환불 건 현황</td>
				<td>벨류</td>
				</tr>
			</thead>
</table></div>

<hr>
	<!-- table list start //안되면 adminchk넣기 -->
	<div class="container">
		<h1 style="text-align: left;" id="center">수수료 설정</h1>
<table class="table table-hover">
			<thead>
				<tr>
				<th colspan="2">예약 취소 수수료</th>
				</tr>
				<tr>
				<td> 예약 취소일</td>
				<td> 취소 수수료</td>
				</tr>
				<tr>
				<td>이용당일</td>
				<td><input type="number">%</td>
				</tr>
				<tr>
				<td><input type="number">일전</td>
				<td><input type="number">%</td>
				</tr>
				<tr>
				<td><input type="number">일전</td>
				<td><input type="number">%</td>
				</tr>
				<tr>
<td colspan="2"><button style="width: 60px; border: none;" type="submit" class="btn btn-dark">저장</button>
</td>
</tr>
			</thead>
</table>
       </div>
</body>
</html>