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

  <br>
	<a id="custom-login-btn" href="javascript:loginWithKakao()">
	  <img
	    src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
	    width="222" alt="카카오 로그인 버튼"/>
	</a>

</div>

<script type="text/javascript">

	//카카오 로그인
	window.Kakao.init('6eb3fafbf00838307ce2c04f9b423aec');  	// SDK를 초기화 (JavaScript 키 입력)
	console.log(Kakao.isInitialized());    						// SDK 초기화 여부 판단(false일 경우 JavaScript 키 확인)
	
  function loginWithKakao() {
    	window.Kakao.Auth.authorize({
      		scope : 'account_email,gender'
      		success : function (authObj){
      			console.log(authObj)
      		}
    })
  }
  
</script>
</body>
</html>