<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/boardinquiryForm.css">
<script>
$(document).ready(function() {

	  $(".toggle-accordion").on("click", function() {
	    var accordionId = $(this).attr("accordion-id"),
	      numPanelOpen = $(accordionId + ' .collapse.in').length;
	    
	    $(this).toggleClass("active");

	    if (numPanelOpen == 0) {
	      openAllPanels(accordionId);
	    } else {
	      closeAllPanels(accordionId);
	    }
	  })

	  openAllPanels = function(aId) {
	    console.log("setAllPanelOpen");
	    $(aId + ' .panel-collapse:not(".in")').collapse('show');
	  }
	  closeAllPanels = function(aId) {
	    console.log("setAllPanelclose");
	    $(aId + ' .panel-collapse.in').collapse('hide');
	  }
	     
	});
</script>
</head>

<body>
<div class="subback">
	<h2 id="center">자주묻는질문</h2>
</div>
	<div class="container">
		<h2 id="head_Text">자주묻는질문</h2>
			 <div class="accordion-option">
			    <a href="javascript:void(0)" class="toggle-accordion active" accordion-id="#accordion"></a>
			  </div>
			  <div class="clearfix"></div>
			  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			    <div class="panel panel-default">
			      <div class="panel-heading" role="tab" id="headingOne">
			        <h4 class="panel-title">
			        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			          Q. “오토캠핑” 과 “일반캠핑” 의 차이점은 무엇인가요?
			        </a>
			      </h4>
			      </div>
			      <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
			        <div class="panel-body">
			         A. “오토캠핑” 의 경우, 차량 진입 시 텐트 설치구역 바로 옆에 차량을 주차하실 수 있으며, 
			         텐트 설치하는 바닥은 “우레탄(탄성고무)” 재질로 되어 있습니다. <br>
			         반면, “일반캠핑” 은 “목재데크” 로 이루어져 차량을 정해진 주차구역에 주차하셔야 합니다.
			        </div>
			      </div>
			    </div>
			    <div class="panel panel-default">
			      <div class="panel-heading" role="tab" id="headingTwo">
			        <h4 class="panel-title">
			        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
			          Q. 캠핑장 예약 후 사정이 생겨 예약당일 입실이 어려울거같아요..다른 날짜로 변경 가능한가요?
			        </a>
			      </h4>
			      </div>
			      <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
			        <div class="panel-body">
			          A. 현재 날짜 변경은 불가능합니다. 해당 캠핑장 유선으로 예약 취소 후 원하는 날짜에 재예약하셔야 합니다.
			        </div>
			      </div>
			    </div>
			    <div class="panel panel-default">
			      <div class="panel-heading" role="tab" id="headingThree">
			        <h4 class="panel-title">
			        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
			           Q. 캠핑장 이용이 가능한 차량은 무엇이 있나요?
			        </a>
			      </h4>
			      </div>
			      <div id="collapseThree" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingThree">
			        <div class="panel-body">
			         A. -캠핑장 전 구역 이용 가능: 승용차, 오토바이, SUV 차량

					-캠핑장 전 구역 이용 불가능: 버스 또는 승합차 (진입 또한 불가능, 승합차는 종류에 따라 다르므로 반드시 문의 주시기 바랍니다.)<br><br>
					
					※진입 불가능한 차량은 현장에 오셔도 입장시켜드리지 않습니다.<br>
					
					※이용이 가능한 차량이더라도 지정된 자리 이외에 주차하거나, 타인의 자리를 침범하거나, 다른 이용객의 통행을 방해해서는 안 됩니다. <br><br>
					
					 
					
					-오토캠핑<br>
					
					일반적으로 스타렉스 크기의 차량까지는 가능합니다. (미니버스 등은 불가능)<br>
					
					루프탑 및 도킹텐트: 차량 후면 도킹(텐트설치)은 불가능합니다.<br>
					
					※4*4 사이즈 데크 중 16번, 22번 데크는 차량 옆면 도킹 텐트 설치가 어렵습니다.<br>
					
					※4*4 사이즈 데크 중 13번, 19번 데크는 주차구역과 데크 사이에 연석이 있어 높낮이가 달라 차량 옆면 도킹 텐트 설치가 어렵습니다.<br>
					
					※폴딩트레일러는 트레일러 또는 견인차량 중 하나를 캠핑장 밖에 주차하셔야 합니다.<br><br>
					
					 
					
					-카라반사이트<br>
					
					캠핑장 진입 자체가 제한되는 차량 이외에는 이용 가능합니다.<br>
					
					승합차는 카운티(24인승 미니버스)까지만 가능합니다. (카라반사이트만 이용 가능)<br><br>
					
					 
					
					-글램핑 및 카라반<br>
					
					승용차, 오토바이, SUV 차량만 가능합니다.<br><br>
					
					 
					
					차량과 관련하여 문의 사항이 있으시면 캠핑장으로 연락주시기 바랍니다.
			        </div>
			      </div>
			    </div>
			  </div>
	
		</div>
</body>
</html>


