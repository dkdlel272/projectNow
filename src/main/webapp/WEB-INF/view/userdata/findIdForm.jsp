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

<form class="container pt-5" action="<%=request.getContextPath()%>/userdata/findId">
  <div class="form-group">
  <h2>아이디 찾기</h2>
    <br>
    <input type="text" class="form-control in" placeholder="이름" name="name">
    <br>
    <input type="email" class="form-control in" placeholder="email" name="email">
    
  

  <button type="submit" class="btn btn-info">아이디 찾기</button>
 </div>
</form>

</body>


</html>