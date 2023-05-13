<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>



<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css">
<script>
// rect1 클래스의 onclick 이벤트를 클릭하면 view1 함수 실행
	function view(userno) {
		//location 내장객체를 이용하여 history1(컨트롤러 역할) 서블릿으로 이동한다.
		location.href="${pageContext.request.contextPath}/history/index.do?user="+userno+"&pg=1";
	}
	
	
	 $(function () {
	      $(".start").click(function () {
	        $(".modal").fadeIn(function () {
	          $(".btn2").click(function () {
	            location.href = "${pageContext.request.contextPath}/game/mode.do";
	          });
	        });
	      });

	      $(".btn3").click(function () {
	        $(".modal").fadeOut();
	      });
	    });
	
	/* function start() {
		location.href="${pageContext.request.contextPath}/game/mode.do"; // 아래 게임시작 버튼 start를 누를경우, 
								//history1 서블릿으로 이동하여, 이 서블릿에서 start.do로 연결된다.
	} */
	
	function exit() {
		location.href="exit.do"; // 아래 나가기 버튼 exit를 누를경우, 
								//history1 서블릿으로 이동하여, 이 서블릿에서 exit.do로 연결된다.
	}
	
</script>
</head>
<body>
<div class="package">
	<div class="whole">
      <div class="rectP">
        <div class="rect1">
          <div class="player1">1P</div>
          
          <button type="button" id="btnEvent" class="btnEvent" style="background-color: transparent; border: none; cursor:pointer;" onclick="view(${user1.userno})">
        	<img src="${pageContext.request.contextPath}/img/Group 27.png" class="Group27" />
        </button>
          
          <img src="${pageContext.request.contextPath}/img/3.png" class="img3" />
          <div class="name1">NAME : ${user1.userName}</div>
          <div class="played1">PLAYED : ${user1.gamecnt} </div>
          <div class="winrate1">WINRATE : ${user1.winrate} %</div>
          <div class="coin1">${user1.point} COIN</div>
        </div>
        <div class="rect2">
          <div class="player2">2P</div>
          
         <button type="button" id="btnEvent" class="btnEvent" style="background-color:transparent; border: none; cursor:pointer;" onclick="view(${user2.userno})">
        	<img src="${pageContext.request.contextPath}/img/Group 25.png" class="Group25" />
        </button>
          
		  <img src="${pageContext.request.contextPath}/img/3.png" class="img6" />
          <div class="name2">NAME : ${user2.userName}</div>
          <div class="played2">PLAYED : ${user2.gamecnt}</div>
          <div class="winrate2">WINRATE : ${user2.winrate}%</div>
          <div class="coin2">${user2.point} COIN</div>
        </div>
        <img src="${pageContext.request.contextPath}/img/6.png" class="img7" />
        <div class="team2">MADE IN TEAM2</div>
        <div class="stbtn"></div>
        <div class="start" onclick="start()" style="cursor:pointer">START</div>
        <div class="exbtn" ></div>
        <div class="exit" onclick="exit()" style="cursor:pointer">EXIT</div>
      </div>
    </div>
    <div class="modal">
      <div class="modal_content" title="클릭하면 창이 닫힙니다.">
        <p>오목에는 총 3가지 모드가 있습니다.</p>
        <p style="color: #1499f8;">NORMAL 모드</p> 같은 색의 돌을 연속으로 다섯개 먼저 늘어놓아라
        <p style="color: #e259ed;">BLITZ 모드</p>  불길이 타오르는 오목판 위에서 제한된 시간내에 이겨야 한다
        <p style="color: red;">EVENT 모드</p> 뭔가 색다른 모드를 원한다면 선택
        <input type="button" class="btn2" value="GAME START" />
        <input type="button" class="btn3" value="CLOSE" />
      </div>
    </div>
</div>	
</body>
</html>