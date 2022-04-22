<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style >

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
    background:url("<%=request.getContextPath()%>/image/notice.jpg");
}
.container {
    margin-top:150px;
    margin-bottom:150px;
}
.btn-info {
    margin-top: 25px;
    background: #27606b;
    border: 1px solid #27606b;
    width: 150px;
    line-height: 30px;
    font-size: 17px;
}
.mx-auto{
	margin-left: 30% !important;
}
</style>
</head>
<body>

<div class="subback">
    <h2 id="center">회원정보수정</h2>
</div>

<div class="container">
	
		<form action="<%=request.getContextPath() %>/userdata/userdataUpdate"  method="post" name="f">
		
			<div class="form-group">
				<label >아이디:</label> 
				<input type="text" class="form-control" name="id" readonly = "readonly" value = "${u.userid }"> 
				<label >비밀번호:</label>
				<input type="password" class="form-control" name="password"> 
				<label >이름:</label> 
				<input type="text" class="form-control"  name="name"  value = "${u.name }"> 
				<label>성별:</label> <label class="radio-inline"> </label>
				<input type="radio" name="gender" ${u.gender == 1? "checked" : "" } value = "1" >남 <label class="radio-inline"> </label>
				<input type="radio" name="gender" ${u.gender == 2? "checked" : "" } value = "2" >여
			</div>

		
		<div class="form-group">
			<label >생년월일:</label> 
			<input type="text"	class="form-control" name="birthday" value = "${u.birthday}">
			<label >전화번호:</label> 
			<input type="text" class="form-control" name="tel" value = "${u.tel}">
				
			<label ">이메일:</label>
			<input type="text" class="form-control" name="email" value = "${u.email}" readonly = "readonly" >
				
			<label >주소:</label>
			<input type="text" class="form-control"	name="address" value = "${u.address}"  >
		</div>


	<div class="mx-auto" style="padding: 3px;">
		<button type="submit" class="btn btn-info">정보수정</button>
		<button type="button" class="btn btn-info"
		onclick="location.href='<%=request.getContextPath()%>/userdata/changePass'">비밀번호 수정</button>
		<button type="button" class="btn btn-info"
		onclick="location.href='<%=request.getContextPath()%>/userdata/deleteForm'">회원 탈퇴</button>
	</div>
	
	
	</form>
</div>

</body>
</html>