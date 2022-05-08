<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
		href="<%=request.getContextPath() %>/resouces/css/joinForm.css">

</head>
<body>

<div class="subback">
    <h2 id="center">회원정보수정</h2>
</div>

<div class="container">
	
		<form action="<%=request.getContextPath() %>/userdata/userdataUpdate"  method="post" name="f">
		
			<div class="form-group">
				<label >아이디:</label> 
				<input type="text" class="form-control in" name="userid" readonly = "readonly" value = "${u.userid }"> 
				<label >비밀번호:</label>
				<input type="password" class="form-control in" name="password"> 
				<label >이름:</label> 
				<input type="text" class="form-control in"  name="name"  value = "${u.name }"> 
				<label>성별:</label> <label class="radio-inline"> </label>
				<input type="radio" name="gender" ${u.gender == 1? "checked" : "" } value = "1" >남 <label class="radio-inline"> </label>
				<input type="radio" name="gender" ${u.gender == 2? "checked" : "" } value = "2" >여
			</div>

		
		<div class="form-group">
			<label >생년월일:</label> 
			<input type="text"	class="form-control in" name="birthday" value = "${u.birthday}">
			<label >전화번호:</label> 
			<input type="text" class="form-control in" name="tel" value = "${u.tel}">
				
			<label ">이메일:</label>
			<input type="text" class="form-control in" name="email" value = "${u.email}" readonly = "readonly" >
				
			<label >주소:</label>
			<input type="text" class="form-control in"	name="address" value = "${u.address}"  >
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