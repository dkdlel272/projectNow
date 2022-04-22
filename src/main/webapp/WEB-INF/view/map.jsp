<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/map.css">
</head>
<body>
<div class="subback">
	<h2 id ="center">오시는길</h2>
</div>
<div class="container">	
	<div class="map_wrap">
		<div class="map_left">
			<h2>Now 오시는길<br> 
			서울특별시 강남구 역삼동 819-10 <br> 
			세경빌딩3층에<br>
			 위치해 있습니다.</h2>
			 
			 <div class="map_text01">
				 <i class="xi-headset"></i> 예약문의 | 홈페이지 메뉴에서 예약하기 <br>
				 <i class="xi-note"></i> 이메일 | abcdefhj@naver.com<br>
				 <i class="xi-call"></i> 전화번호 | 02-538-3644 <br>
			 </div>
		
		</div>
	
		<div class="map_right">
	
			<div id="daumRoughmapContainer1648106057282" class="root_daum_roughmap root_daum_roughmap_landing" style="width:100%;"></div>
			
			
			<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
			
			
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1648106057282",
					"key" : "29kox",
					"mapHeight" : "500"
				}).render();
			</script>
		</div>
		</div>
</body>
</html>