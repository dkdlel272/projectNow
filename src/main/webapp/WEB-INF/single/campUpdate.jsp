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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<title>캠핑장 수정</title>


</head>

<body>
<div class="container">
<form action="<%=request.getContextPath()%>/camp/CampUpdatePro" method="post" enctype="multipart/form-data">
<h2   id="center">캠핑장 수정</h2>
				<div class="form-group">
				
					<label>캠핑장번호</label> 
					<input type="text" class="form-control" name="campidx" value="${c.campidx}" readonly="readonly">
					<label>캠핑장이름</label> 
					<input type="text" class="form-control" name="campname" value="${c.campname}"> 
					<label>캠핑장주소</label>
					<input type="text" class="form-control" name="campaddr" value="${c.campaddr}"> 
					<label>객실타입</label> 
					<input type="text" class="form-control"	name="room" value="${c.room}">
					<label>남은 객실</label> 
					<input type="number" class="form-control"	name="roomcnt" value="${c.roomcnt}"> 
					<label>보유 객실</label> 
					<input type="number" class="form-control"	name="roomno" value="${c.roomno}">
					<label>요금</label> 
					<input type="number" class="form-control"	name="payidx" value="${c.payidx}">
					<label>체크인</label>
					<input type="time" class="form-control"	name="chkin" value="15:00" readonly="readonly">
					<label>체크아웃</label> 
					<input type="time" class="form-control"	name="chkout" value="11:00" readonly="readonly">
					<label>소개 글</label> 
					<input type="text" class="form-control"	name="content" value="${c.content}">
		</div>
		<div class="form-group">
			<label>캠핑장 사진</label> 
			<input type="file" class="form-control" name="f1">
			<label>캠핑장 사진2</label> 
			<input type="file" class="form-control" name="f2">
			<label>캠핑장 사진3</label> 
			<input type="file" class="form-control" name="f3">
		</div>
			<input type="hidden" class="form-control" value="${c.campimg}" name="campimg">
			<input type="hidden" class="form-control" value="${c.campimg2}" name="campimg2">
			<input type="hidden" class="form-control" value="${c.campimg3}" name="campimg3">					
	<div id="center" style="padding: 3px;">
		<button type="submit" class="btn btn-dark"      onclick="closeCamp(this.form)">수정</button>
	</div>
	</form>
	</div>
	<script>

</script>
	<script>
	function closeCamp(form) {
		 form.submit()
		
	}
	
	
	</script>
	<script>
function win_upload() {
	const op = "width=500, height=150, left =50, top=150";
	open ('<%=request.getContextPath()%>/camp/campUpdate',"",op);	
}
</script>
	
</body>
</html>
