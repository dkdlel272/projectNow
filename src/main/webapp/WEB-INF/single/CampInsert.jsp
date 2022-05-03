<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<title>Insert title here</title>
</head>
<body>
<div class="container">
<form action="<%=request.getContextPath() %>/camp/CampInsertPro" enctype="multipart/form-data" method="post">
<h2   id="center">캠프 생성</h2>
				<div class="form-group">
				<label>캠핑장번호</label> 
					<input type="text" class="form-control" name="campidx">
					<label>캠핑장이름</label> 
					<input type="text" class="form-control" name="campname"> 
					<label>캠핑장주소</label>
					<input type="text" class="form-control" name="campaddr"> 
					<label>객실타입</label> 
					<input type="text" class="form-control"	name="room">
					<label>남은 객실</label> 
					<input type="number" class="form-control"	name="roomcnt"> 
					<label>보유 객실</label> 
					<input type="number" class="form-control"	name="roomno">
					<label>요금</label> 
					<input type="number" class="form-control"	name="payidx">
					<label>체크인</label> 
					<input type="time" class="form-control"	name="chkin" value="15:00" readonly="readonly">
					<label>체크아웃</label> 
					<input type="time" class="form-control"	name="chkout" value="11:00" readonly="readonly">
					<label>소개 글</label> 
					<input type="text" class="form-control"	name="content">
		</div>
		<div class="form-group">
			<label>캠핑장 사진</label> 
			<input type="file" class="form-control" name="f1">
			<label>캠핑장 사진2</label> 
			<input type="file" class="form-control" name="f2">
			<label>캠핑장 사진3</label> 
			<input type="file" class="form-control" name="f3">
		</div>
	<div id="center" style="padding: 3px;">
		<button type="button" class="btn btn-dark"      onclick="closeCamp(this.form)">저장</button>
	</div>
	</form>
	</div>

	<script>
	function closeCamp(form) {
		 form.submit()
	}
	</script>
	<script>
function win_upload() {
	const op = "width=500, height=150, left =50, top=150";
	open ('<%=request.getContextPath()%>/camp/CampInsert',"",op);	
}
</script>
	
</body>
</html>
