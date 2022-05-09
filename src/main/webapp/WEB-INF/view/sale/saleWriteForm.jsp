<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/saleList.css">

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
  	<textarea class="in" name="content" style="width:100%; height: 150px; border-radius: 0px;"></textarea>
  	
  	<label>사진등록</label> <span><small>업로드할 이미지는 한 번에 선택바랍니다. 최대 5개까지 업로드 가능합니다.</small></span>
	<input type="file" multiple="multiple"	class="form-control" name="image"> 
	
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
		<button type="submit" class="btn list_button"  style="color: #fff;">게시글 작성</button>
	</div>
 	
 
 
</form>
</body>
</html>