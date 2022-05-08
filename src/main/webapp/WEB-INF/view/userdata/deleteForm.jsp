<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
		href="<%=request.getContextPath() %>/resouces/css/joinForm.css">

<script>
function confirmDelete() {
	
	if(window.confirm("탈퇴 후 7일동안 재가입이 불가합니다.\n정말 탈퇴 하시겠습니까?")){
		return true;
	} else{
		return false;
	}
	
}



</script>
</head>
<body>

<div class="subback">
    <h2 id="center">회원 탈퇴</h2>
</div>

<div class="container">
	
		<form action="<%=request.getContextPath() %>/userdata/deleteUserdata"  method="post" name="f" onsubmit="return confirmDelete(this)">
		
			<div class="form-group">
			 
				<label > ID </label>
				<input type="text" class="form-control in" name="userid" value="${userid }" readonly="readonly"> 
				
				<label > 비밀번호 </label>
				<input type="password" class="form-control in" name="password"> 
				
		
				
			</div>

		
		


	<div id="center" style="padding: 3px;">
		<button type="submit" class="btn btn-info">회원탈퇴</button>

	</div>
	
	
	</form>
</div>

</body>
</html>