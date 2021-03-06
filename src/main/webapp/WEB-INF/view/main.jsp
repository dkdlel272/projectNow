<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>Now</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resouces/css/Main.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rajdhani&display=swap" rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slider.js"></script>   
  <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.1/TweenMax.min.js'></script>  
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>
( function($) {
  
  $(document).ready(function() {
    
    var s           = $('.slider'),
        sWrapper    = s.find('.slider-wrapper'),
        sItem       = s.find('.slide'),
        btn         = s.find('.slider-link'),
        sWidth      = sItem.width(),
        sCount      = sItem.length,
        slide_date  = s.find('.slide-date'),
        slide_title = s.find('.slide-title'),
        slide_text  = s.find('.slide-text'),
        slide_more  = s.find('.slide-more'),
        slide_image = s.find('.slide-image img'),
        sTotalWidth = sCount * sWidth;
    
    sWrapper.css('width', sTotalWidth);
    sWrapper.css('width', sTotalWidth);
    
    var clickCount  = 0;
    
    btn.on('click', function(e) {
      e.preventDefault();

      if( $(this).hasClass('next') ) {
        
        ( clickCount < ( sCount - 1 ) ) ? clickCount++ : clickCount = 0;
      } else if ( $(this).hasClass('prev') ) {
        
        ( clickCount > 0 ) ? clickCount-- : ( clickCount = sCount - 1 );
      }
      TweenMax.to(sWrapper, 0.4, {x: '-' + ( sWidth * clickCount ) })


      //CONTENT ANIMATIONS

      var fromProperties = {autoAlpha:0, x:'-50', y:'-10'};
      var toProperties = {autoAlpha:0.8, x:'0', y:'0'};

      TweenLite.fromTo(slide_image, 1, {autoAlpha:0, y:'40'}, {autoAlpha:1, y:'0'});
      TweenLite.fromTo(slide_date, 0.4, fromProperties, toProperties);
      TweenLite.fromTo(slide_title, 0.6, fromProperties, toProperties);
      TweenLite.fromTo(slide_text, 0.8, fromProperties, toProperties);
      TweenLite.fromTo(slide_more, 1, fromProperties, toProperties);

    });
          
  });
})(jQuery);

$('.overlay').addClass('overlay-blue');
</script>
<script>
  AOS.init();
</script>
<html>
</head>


<body>
<script>
if('${param.msg}'){alert('${param.msg}')}
</script>
<div id="captioned-gallery">
      <video class="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" height="auto !important" playsinline="">
         <source src="<%=request.getContextPath()%>/image/wave.mp4" type="video/mp4">
      </video>
</div>

         <div class="accordion_wrap">
         
         <div id="accordion">
         <p>
            <strong>??????, <br> ????????????!</strong>
         </p>

            <div id="center" style="padding: 3px;">
                  <button type="submit" class="btn btn-info"><a href="<%=request.getContextPath()%>/reserve/CampList">????????????</a></button>
            </div>
         </div>
        </div>
         
<section class="sec01_wrap">
   <div class="sec01s">
      <div class="sec01_left_wrap">
        
      </div>
      <div class="sec01_right_wrap">
         <div class="right_box_wrap">
            <div class="right_box" data-aos="fade-up"
                 data-aos-duration="3000">
               <div class="right_image"><img src="<%=request.getContextPath()%>/image/p01.jpg"></div>
               <div class="right_text">
                  <h4>?????????????????????</h4>
                  <p>??????????????? ???????????? ?????? ????????? ???, ?????? ?????? ????????? ??????.</p>
               </div>
               <div class="right_bottom_wrap">
                  <div class="right_icon"><i class="xi-won"></i>??????</div>
                  <div class="right_icon"><i class="xi-toilet"></i>?????????</div>
                  <div class="right_icon"><i class="xi-home"></i>?????????/??????</div>
               </div>
            </div>
  
        <div class="right_box right_box2" data-aos="fade-up"
                 data-aos-duration="3000">
               <div class="right_image"><img src="<%=request.getContextPath()%>/image/p02.jpg"></div>
               <div class="right_text">
                  <h4>?????? ???????????????</h4>
                  <p>???????????? ??????????????? ???????????? ?????? ??? ?????????...</p>
               </div>
               <div class="right_bottom_wrap">
                  <div class="right_icon"><i class="xi-won"></i>??????</div>
                  <div class="right_icon"><i class="xi-toilet"></i>?????????</div>
                  <div class="right_icon"><i class="xi-home"></i>?????????/??????</div>
               </div>
            </div>
         </div>
         
         <div class="right_box_wrap" data-aos="fade-up"
                 data-aos-duration="3000">
            <div class="right_box">
               <div class="right_image"><img src="<%=request.getContextPath()%>/image/p03.jpg"></div>
               <div class="right_text">
                  <h4>????????????????????????</h4>
                  <p>?????????,?????? ???????????? ??? ??? ?????? ???????????????.</p>
               </div>
               <div class="right_bottom_wrap">
                  <div class="right_icon"><i class="xi-won"></i>??????</div>
                  <div class="right_icon"><i class="xi-toilet"></i>?????????</div>
               </div>
            </div>
            
            <div class="right_box right_box2" data-aos="fade-up"
                 data-aos-duration="3000">
               <div class="right_image"><img src="<%=request.getContextPath()%>/image/p04.jpg"></div>
               <div class="right_text">
                  <h4>?????? ?????????????????????</h4>
                  <p>?????? ??????????????????????????????. ??????????????? ?????????...</p>
               </div>
               <div class="right_bottom_wrap">
                  <div class="right_icon"><i class="xi-won"></i>??????</div>
                  <div class="right_icon"><i class="xi-toilet"></i>?????????</div>
                  <div class="right_icon"><i class="xi-home"></i>?????????/??????</div>
               </div>
            </div>
         </div>
         
         <div class="right_box_wrap" data-aos="fade-up"
                 data-aos-duration="3000">
            <div class="right_box">
               <div class="right_image"><img src="<%=request.getContextPath()%>/image/p05.jpg"></div>
               <div class="right_text">
                  <h4>?????????????????????</h4>
                  <p>???????????? ?????? 2?????? ?????? ???????????? ????????? ??? ???...</p>
               </div>
               <div class="right_bottom_wrap">
                  <div class="right_icon"><i class="xi-won"></i>??????</div>
                  <div class="right_icon"><i class="xi-toilet"></i>?????????</div>
                  <div class="right_icon"><i class="xi-home"></i>?????????/??????</div>
               </div>
            </div>
            
            <div class="right_box right_box2" data-aos="fade-up"
                 data-aos-duration="3000">
               <div class="right_image"><img src="<%=request.getContextPath()%>/image/p06.jpg"></div>
               <div class="right_text">
                  <h4>???????????????</h4>
                  <p>????????? ????????? ??????, ?????????! ???????????? ????????????...</p>
               </div>
               <div class="right_bottom_wrap">
                  <div class="right_icon"><i class="xi-won"></i>??????</div>
                  <div class="right_icon"><i class="xi-toilet"></i>?????????</div>
                  <div class="right_icon"><i class="xi-home"></i>?????????/??????</div>
               </div>
            </div>
         </div>
            
      </div>
   </div>
</section>         
         
<section class="review_wrap">
   <div class="reviews">
      <h2>???????????? ????????? ??????<br><span>????????? ??????????????? ??????????????? ???????????????.</span></h2>
      <div class="re_box_wrap">
         <div class="re_box">
         	<div class="re_icon"><img src="<%=request.getContextPath()%>/image/re_01.png"></div>
         	<div class="re_text">???????????? ?????? ?????????</div>
         	<div class="re_tag">#???????????? #????????? #????????????</div>
         </div>
         <div class="re_box">
         	<div class="re_icon"><img src="<%=request.getContextPath()%>/image/re_02.png"></div>
         	<div class="re_text">???????????? ?????????</div>
         	<div class="re_tag">#?????? #???????????? #??????</div>
         </div>
         <div class="re_box">
         	<div class="re_icon"><img src="<%=request.getContextPath()%>/image/re_03.png"></div>
         	<div class="re_text">?????? ?????????</div>
         	<div class="re_tag">#????????? #???????????? #?????????</div>
         </div>
         <div class="re_box">
         	<div class="re_icon"><img src="<%=request.getContextPath()%>/image/re_04.png"></div>
         	<div class="re_text">?????? ?????? ?????????</div>
         	<div class="re_tag">#????????? #?????? #??????</div>
         </div>
         
         
      </div>
   </div>
</section>

<div class="bx_head">
<h2>???????????????<br><span>????????? ????????? ???????????? ????????? ???????????????!</span></h2>
</div>


<section class="bx_slider">
<div class="slider">
<div class="slider-wrapper flex">

<c:forEach var="b" items="${list2}">
   <div class="slide flex">
      <div class="slide-image slider-link prev"><img src="<%=request.getContextPath() %>/boardupload/${b.file1}"><div class="overlay"></div></div>
      <div class="slide-content">
         <div class="slide-date">${b.regdate}</div>
         <div class="slide-title">${b.subject}</div>
         <div class="slide-text">${b.content}</div>
         <div class="slide-more"><a href="<%=request.getContextPath() %>/board/boardReview?boardid=2">READ MORE</a></div>
      </div>   
   </div>
</c:forEach> 
</div>
<div class="arrows">
<a href="#" title="Previous" class="arrow slider-link prev"></a>
<a href="#" title="Next" class="arrow slider-link next"></a>
</div>
</div>

</section>
   
  
</body>
</html>


