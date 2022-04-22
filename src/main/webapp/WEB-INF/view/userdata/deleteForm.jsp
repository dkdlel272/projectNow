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
    border-radius: 20px;
    width: 150px;
    line-height: 30px;
    font-size: 17px;
}

</style>
<script>
function confirmDelete() {
	
	if(window.confirm("회원탈퇴 하시겠습니까?")){
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
				<input type="text" class="form-control" name="userid" value="${userid }" readonly="readonly"> 
				
				<label > 비밀번호 </label>
				<input type="password" class="form-control" name="password"> 
				
		
				
			</div>

		
		


	<div id="center" style="padding: 3px;">
		<button type="submit" class="btn btn-info">회원탈퇴</button>

	</div>
	
	
	</form>
</div>

</body>
</html>