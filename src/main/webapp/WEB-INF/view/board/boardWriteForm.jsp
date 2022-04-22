<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- 클래식 에디터 -->
<script src="https://cdn.ckeditor.com/ckeditor5/33.0.0/classic/ckeditor.js"></script>
 <style>
@font-face {
    font-family: 'MinSans-Medium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/MinSans-Medium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.notosanskr * { 
 font-family: 'Noto Sans KR', sans-serif;
}
.container {
	margin-top:150px;
	margin-bottom:150px;
}
h2#center {
	text-align:center;
	margin-bottom:50px;
	color:#fff;
	line-height:500px;
	font-size: 35px;
	font-weight:bold;
	font-family: 'Noto Sans KR', sans-serif;
}
.subback {
	width:100%;
	height:500px;
	overflow:hidden;
	background:url("<%=request.getContextPath()%>/image/notice.jpg");
}
.btn-dark {
    float: right;
    width: 150px;
    color: #fff;
    background-color: #343a40;
    border-color: #343a40;
    border-radius: 50px;
}

<!-- 넓이 높이 조절 -->
	.ck.ck-editor {
    	max-width: 500px;
	}
	.ck-editor__editable {
	    min-height: 300px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="subback">
	<h2 id ="center">게시판 입력</h2>
</div>
<div class="container">
	<form name="f" action="<%=request.getContextPath()%>/board/boardWritePro" enctype="multipart/form-data" method="post">
		
		<div class="form-group">
			<label>작성자:</label>
			<input type="text" class="form-control" name="writer">
			<label>비밀번호</label>
			<input type="password" class="form-control" name="pass">
			<label>제목</label>
			<input type="text" class="form-control" name="subject">
		</div>
		
		<div class="form-group">
			<label>내용:</label>
			<textarea class="form-control"  name="content" id="editor" ></textarea>
		</div>
		
		<div class="form-group">
			<label>파일저장:</label>
			<input type="file" class="form-control" name="f">
		</div>
		<div id="center" style="padding:3px;">
			<button type="submit" class="btn btn-dark">입력</button>
		</div>
	</form>
</div>
</body>
</html>

<script>
// 3. CKEditor5를 생성할 textarea 지정
ClassicEditor
    .create( document.querySelector( '#editor' ) )
    .catch( error => {
        console.error( error );
    } );
</script>  