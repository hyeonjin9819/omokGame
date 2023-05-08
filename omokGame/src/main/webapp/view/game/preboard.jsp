<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {
width: 100vw;
height : 100vh;
}

.wrap {
position: relative;
width: 100vw;
height : 100vh;
}
.blackout {
	position: fixed;
	width: 100%;
	height: 100%;
	background-color: #000;
	z-index: 999999;
	top:0;
	opacity: 1;
	pointer-events : none;
    transition: opacity 1.5s;
	
}
.blackin {
	position: fixed;
	width: 100%;
	height: 100%;
	background-color: #000;
	z-index: 999999;
	top:0;
	opacity: 0;
	pointer-events : none;
    transition: opacity 1.5s;
	
}



</style>

<script>

window.onload = function() {
    var blackout = document.querySelector(".blackout");

    blackout.style.opacity = 0;
  };

  function handleTransitionEnd() {
 	 window.location.href = '/omokgame2/game/gamepage.do';
 	
 	
 }
 
 
 function closefunc() {
 	  setTimeout(function() {
 	    document.addEventListener('click', function() {
 	       sessionStorage.clear();

 	       var blackin = document.querySelector(".blackin");
 	       blackin.style.opacity = 1;
 	       
 	       blackin.addEventListener("transitionend", handleTransitionEnd);
 	      
 	    });
 	  }, 0.5);
 	}

</script>

</head>
<body>

<div class="wrap">
	<div class="blackout">  </div>
	<div class="blackin">  </div>
	
	
	<img src=  "http://58.122.202.23:8094/omokgame2/view/game/img/why.gif" />
	board test// 가정 : session에 player1,2 존재 // resetcss 안먹이면 양옆 살짝뜸 <br>
	확인할거 : 1. 정상진행 2. 정상진행 중 새로고침 3.시간초과 패배 서버에 결과전송 4. 무르기 5. 무르기 후 새로고침 <br>
	6. 타이머 정상작동 유무 7. 새로고침 후 로그 정상출력 여부  + @ <br>
	해야할거 : 19*19 의 수를 두었을때 처리 (비김처리? 강제홈으로?),로로그 넘어가면 자동스크롤 하단 고정,승리 시 click here 같은 표시로 아무데나 클릭해야 홈으로 간다는거 안내, 로그 새로고침시 없어지는거, css수정, gg출력할 수 있는 창?, 새로고침시 가끔 시간이 1초씩 줄어듦 추정하기로는 sessionstorage 저장 함수 실행 전에 인터럽트 했거나 시간 출력 시 반올림 문제? ,뒤로가기시 뻗는거(트랜지션떄문인가?) , <br>
	<p style="color: red;">타이머 수정, 현재 만들어논거 모드로 빼기<p>
	실행 순서 : 페이지onload 세션스토리지 값 확인 (if 없으면 변수 초기화 else if 있으면 세션스토리지 값 불러와서 변수에 저장 변수 ) <br>
	        : 세션스토리지 저장 변수 > turncnt: 진행 턴수 , blacktime : 흑돌 잔여시간, whitetime : 백돌 잔여시간 , arr@ : x,y,turn 저장 ;<br>
	        : 승리시 ajax 통신 서버로 whowin 변수 전송 서버에서 세션에 올라온 플레이어 player1,2 읽어서 (player1 이 무조건 흑) 전적 저장 -> 트랜지션 끝난 후 홈으로 이동 window.location.href = '/omokgame2/game/preboard.do';<br>
	
	click >> <input type="submit" value="이거클릭 잘 안됨 두어세번은 눌러야" onclick="closefunc()">
	
	


</div>

</body>
</html>