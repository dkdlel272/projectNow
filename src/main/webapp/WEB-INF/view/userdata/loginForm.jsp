<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
		href="<%=request.getContextPath() %>/resouces/css/joinForm.css">

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<script>
	if ('${param.msg}') {
		alert('${param.msg}')
	}
	
</script>


<div class="subback">
    <h2 id="center">로그인</h2>
</div>
<div class="container pt-5">
<form action="<%=request.getContextPath()%>/userdata/loginPro" method= "post">
  <div class="form-group">
    <br>
    <input type="text" class="form-control in" placeholder="아이디" name="id">
    <br>
    <input type="password" class="form-control in" placeholder="비밀번호" name="pw">
    <br>
    <a href="<%=request.getContextPath()%>/userdata/joinForm">
    <small class="form-text text-muted" >회원가입</small></a>

   <small class="form-text text-muted" >
   	 <a href="<%=request.getContextPath()%>/userdata/findIdForm">아이디</a>
     <a href="<%=request.getContextPath()%>/userdata/findPsaaForm">비밀번호찾기</a>
   </small>
  </div>


  <button type="submit" class="btn btn-info" style="width: 222px;">로그인</button>
  
</form>

  

</div>


</body>
</html>