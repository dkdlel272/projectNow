<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/saleList.css">

</head>
<body>
<div class="subback">
    <h2 id="center">게시글 수정</h2>
</div>
<form class="container pt-5" action="<%=request.getContextPath()%>/sale/saleUpdatePro" name="f" enctype="multipart/form-data" method="post">

 <div class="form-group row">
 <input type="hidden" name="saleidx" value="${s.saleidx}">
 
  	<div class="col">
    <label>작성자</label>
     <input type="text" class="form-control in" name="writer" value="${s.writer}" readonly="readonly"/>  
    </div>
    <div class="col">
    <label>비밀번호</label>
    <input type="password" class="form-control in" name="password"> 
    </div>
  </div>
  
  <div class="form-group">
  	<label>제목</label>
    <input type="text" class="form-control in" name="subject" value="${s.subject}">   
    
  	<label>내용</label>
  	<textarea class="in" name="content" style="width:100%; height: 150px; border-radius: 0px;">
  	${s.content}</textarea>
  	
  	<label>사진등록</label> 
	<input type="file" multiple="multiple"	class="form-control" name="image"> 
	
  </div>
  
     <div class="form-group row">
  	<div class="col">
    <label>거래장소</label>
     	<select class="form-control in" name="location">
	     	<c:forEach var="campName" items="${campNames }">
	    		<option value="${campName}" 
	    		<c:if test="${campName==s.location}">selected</c:if>>${campName}</option>
	   		</c:forEach>
	    </select> 
    </div>
    <div class="col">
    <label>금액</label>
    <input type="text" class="form-control in" name="price" value="${s.price}"> 
    </div>
  </div>
  
 	<div align="center">
		<button type="submit" class="btn list_button"  style="color: #fff;">게시글 수정</button>
	</div>
 	
 
 
</form>
</body>
</html>