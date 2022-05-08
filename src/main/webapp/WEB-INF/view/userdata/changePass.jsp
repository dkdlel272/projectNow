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
function inputChk(f){

	if(f.password.value == ''){
		alert("비밀번호를 입력하세요")
		f.password.focus()
		/* 커서 이동 */
		return false;
	}
	if(f.newpassword.value == ''){
		alert("새로운 비밀번호를 입력하세요")
		f.newpassword.focus()
		return false;
		
	}if(f.password.value == f.newpassword.value){
		alert("새로운 비밀번호가 기존 비밀번호와 동일합니다")
		f.newpassword.value=""
		f.newpassword.focus()
		return false;
	}
	
	if(f.newpassword.value != f.newpassword1.value){
		alert("새로운 비밀번호가 다릅니다.")
		f.newpassword1.value=""
		f.newpassword1.focus()
		return false;
	}
	
	return true;
	
}
</script>
</head>
<body>

<div class="subback">
    <h2 id="center">비밀번호 변경</h2>
</div>

<div class="container">
	
		<form action="<%=request.getContextPath() %>/userdata/changePassPro"  method="post" name="f"
				 onsubmit="return inputChk(this)">
		
			<div class="form-group">
			 
				<label > 현재 비밀번호:</label>
				<input type="password" class="form-control in" name="password"> 
				
				<label > 비밀번호 수정:</label>
				<input type="password" class="form-control in" name="newpassword"> 
				
				<label >비밀번호 확인:</label>
				<input type="password" class="form-control in" name="newpassword1"> 
				
			</div>

		
		


	<div id="center" style="padding: 3px;">
		<button type="submit" class="btn btn-info">비밀번호 변경</button>

	</div>
	
	
	</form>
</div>

</body>
</html>