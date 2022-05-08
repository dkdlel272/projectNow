<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
		href="<%=request.getContextPath() %>/resouces/css/findId.css">

</head>
<body>
<div class="subback">
    <h2 id="center"></h2>
</div>

<form class="container pt-5" action="<%=request.getContextPath()%>/userdata/resetPass">
  <div class="form-group">
  <h2>비밀번호 찾기</h2>
    <br>
    <input type="text" class="form-control in" placeholder="아이디를 입력하세요" name="id">
    <br>
    <input type="text" class="form-control in" placeholder="이름을 입력하세요" name="name">
    <br>
    <input type="email" class="form-control in" placeholder="이메일을 입력하세요" name="email">
  
  

  <button type="submit" class="btn btn-info">비밀번호 초기화 하기</button>
 </div>
</form>

</body>


</html>