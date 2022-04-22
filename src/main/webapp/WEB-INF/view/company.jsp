<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/company.css">
</head>
<body>
<div class="subback">
	<h2 id ="center">업체소개</h2>
</div>
<div class="container">


	<div class="compnay02_wrap">
		<div class="company02_box">
			<div class="com_head">MISSION</div>
			NOW는 유명한 명소의 여기저기를 소개해주는 사이트 입니다.<br>
			사랑하는 가족과 연인, 친구들과 함께 추암해변에서 아름다운 추억을 만들어 보세요!<br>
			항상 활기차고 아름다운 것만 보며 넓은 세상을 바라보기를 바랍니다.
		</div>
	</div>
		
		
	<div class="company_wrap">
		<div class="company_top">
			<ul>
				<li><img src="<%=request.getContextPath()%>/image/com01.jpg"></li>
				<li><img src="<%=request.getContextPath()%>/image/com02.jpg"></li>
				<li><img src="<%=request.getContextPath()%>/image/com03.jpg"></li>
			</ul>
		</div>
	</div>	
	
	<div class="compnay03_wrap">
		<div class="company02_box">
			<div class="com_head">TAG</div>
			#반려견동반 #물맑은 #커플 #수영장 있는 #가을 #문화유적 <br>
			#계곡옆 #친절한 #겨울 #여유있는 #바다가 보이는 #익스트림 #깨끗한 #축제 #둘레길 <br>
			#재미있는 #봄 #물놀이 하기 좋은 #차대기 편한 #자전거 타기 좋은 #사이트 간격이 넓은 <br>
			#온수 잘 나오는 #아이들 놀기 좋은 #생태교육 #그늘이 많은 #가족 #힐링 #별 보기 좋은 #여름<br>
		</div>
	</div>
	
<section class="review_wrap">
   <div class="reviews">
      <h2>감성캠핑 키워드 추천<br><span>엄선한 캠핑카들을 키워드별로 만나보세요.</span></h2>
      <div class="re_box_wrap">
         <div class="re_box">
         	<div class="re_icon"><img src="<%=request.getContextPath()%>/image/re_01.png"></div>
         	<div class="re_text">애견동반 가능 캠핑장</div>
         	<div class="re_tag">#애견동반 #반려견 #애견캠핑</div>
         </div>
         <div class="re_box">
         	<div class="re_icon"><img src="<%=request.getContextPath()%>/image/re_02.png"></div>
         	<div class="re_text">프리미엄 캠핑장</div>
         	<div class="re_tag">#대형 #샤워부스 #고급</div>
         </div>
         <div class="re_box">
         	<div class="re_icon"><img src="<%=request.getContextPath()%>/image/re_03.png"></div>
         	<div class="re_text">감성 캠핑장</div>
         	<div class="re_tag">#인스타 #페이스북 #분위기</div>
         </div>
         <div class="re_box">
         	<div class="re_icon"><img src="<%=request.getContextPath()%>/image/re_04.png"></div>
         	<div class="re_text">불멍 가능 캠핑장</div>
         	<div class="re_tag">#파이어 #불멍 #감성</div>
         </div>
         
         
      </div>
   </div>
</section>	

</body>
</html>