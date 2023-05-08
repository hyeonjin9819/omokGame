<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/hisotory1.css" rel="stylesheet" type="text/css">
<script>
// rect1 클래스의 onclick 이벤트를 클릭하면 view1 함수 실행
	function view(userno) {
		//location 내장객체를 이용하여 history1(컨트롤러 역할) 서블릿으로 이동한다.
		location.href="${pageContext.request.contextPath}/history/index.do?user="+userno; //옆에 ?index=1 이 맞나?
	}

/* 	function view2() {
		location.href="test.do?index=2"; // 위의 경우와 같이 ?index=2 맞나? 
	} */
	
	function start() {
		location.href="start.do"; // 아래 게임시작 버튼 start를 누를경우, 
								//history1 서블릿으로 이동하여, 이 서블릿에서 start.do로 연결된다.
	}
	
	function exit() {
		location.href="exit.do"; // 아래 나가기 버튼 exit를 누를경우, 
								//history1 서블릿으로 이동하여, 이 서블릿에서 exit.do로 연결된다.
	}
	
</script>
</head>
<body>

	<div class="whole">
      <div class="rectP">
        <div class="rect1">
          <div class="player1">1P</div>
          
          <button type="button" id="btnEvent" class="btnEvent" style="background-color: black; border: none; cursor:pointer;" onclick="view(${user1.userno})">
        	<img src="${pageContext.request.contextPath}/resources/imgs/Group 25.png" class="Group25" />
        </button>
          
          <img src="${pageContext.request.contextPath}/resources/imgs/3.png" class="img3" />
          <div class="name1">NAME : ${user1.userName}</div>
          <div class="played1">PLAYED : ${user1.gamecnt} </div>
          <div class="winrate1">WINRATE : ${user1.winrate} %</div>
          <div class="coin1">${user1.point} COIN</div>
        </div>
        <div class="rect2">
          <div class="player2">2P</div>
          
         <button type="button" id="btnEvent" class="btnEvent" style="background-color:black; border: none; cursor:pointer;" onclick="view(${user2.userno})">
        	<img src="${pageContext.request.contextPath}/resources/imgs/Group 27.png" class="Group27" />
        </button>
          
		  <img src="${pageContext.request.contextPath}/resources/imgs/3.png" class="img6" />
          <div class="name2">NAME : ${user2.userName}</div>
          <div class="played2">PLAYED : ${user2.gamecnt}</div>
          <div class="winrate2">WINRATE : ${user2.winrate}%</div>
          <div class="coin2">${user2.point} COIN</div>
        </div>
        <img src="${pageContext.request.contextPath}/resources/imgs/6.png" class="img7" />
        <div class="team2">MADE IN TEAM2</div>
        <div class="stbtn"></div>
        <div class="start" onclick="start()" style="cursor:pointer">START</div>
        <div class="exbtn" ></div>
        <div class="exit" onclick="exit()" style="cursor:pointer">EXIT</div>
      </div>
    </div>
	
</body>
</html>