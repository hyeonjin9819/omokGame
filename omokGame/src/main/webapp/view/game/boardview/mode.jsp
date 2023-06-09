<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="${pageContext.request.contextPath}/css/reset.css" type="text/css"  rel="stylesheet" >
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
  <link href="${pageContext.request.contextPath}/css/mode.css?after" type="text/css"  rel="stylesheet" >
  <title>Document</title>
</head>
<body>
  <div class="wrap">
    <div class="main">
      <div class="title">
        <p>MODE</p>
      </div>
      <div class="visual">
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide normal"  onclick="location.href='/omokGame/game/mode.do?modeval=1'">
                  <p>NORMAL MODE</p>
                </div>
                <div class="swiper-slide blitz"  onclick="location.href='/omokGame/game/mode.do?modeval=3'">
                  <p>BLITZ MODE</p>
                 </div>
                 <div class="swiper-slide event" onclick="location.href='/omokGame/game/mode.do?modeval=2'">
                    <p>EVENT MODE</p>
                    
                 </div>
            </div>
        </div>
       </div>
      </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script>
var swiper = new Swiper(".mySwiper", {
	  slidesPerView: 2.400489,
	  spaceBetween: 10,
	  centeredSlides: true,
	  pagination: {
	    el: ".swiper-pagination",
	    clickable: true,
	  },
	});
</script>
</html>
