<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
   	background-color: #23272b;
    border: 1px solid #27606b;
    border-radius: 20px;
    width: 150px;
    line-height: 30px;
    font-size: 17px;
}
.in {
border: 1px solid #ddd;
}
.inwidth{
width: 48%;
margin: 5px;
}
.inwidthfull{
width: 97%;
margin: 5px;

}
</style>
</head>
<body>
<div class="subback">
    <h2 id="center">게시글 작성</h2>
</div>
<form class="container pt-5" action="<%=request.getContextPath()%>/sale/saleWritePro" name="f" enctype="multipart/form-data" method="post">

 <div class="form-group row">
  	<div class="col">
    <label>작성자</label>
     <input type="text" class="form-control in" name="writer" value="${userid}" readonly="readonly"/>  
    </div>
    <div class="col">
    <label>비밀번호</label>
    <input type="password" class="form-control in" name="password"> 
    </div>
  </div>
  
  <div class="form-group">
  	<label>제목</label>
    <input type="text" class="form-control in" name="subject">   
    
  	<label>내용</label>
  	<textarea class="in" name="content" style="width:100%; height: 150px"></textarea>
  	
  	<label>사진등록</label> 
	<input type="file"	class="form-control" name="image1"> 
	<input type="file"	class="form-control" name="image2">
	
  </div>
  
     <div class="form-group row">
  	<div class="col">
    <label>거래장소</label>
     <input type="text" class="form-control in" name="location" />  
    </div>
    <div class="col">
    <label>금액</label>
    <input type="text" class="form-control in" name="price"> 
    </div>
  </div>
  
 	<div align="center">
		<button type="submit" class="btn btn-info">게시글 작성</button>
	</div>
 	
 
 
</form>
</body>
</html>