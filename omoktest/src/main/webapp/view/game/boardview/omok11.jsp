<%@page import="users.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%


String modeval = (String)request.getParameter("modeval");


/* String modeval = (String)session.getAttribute("mode"); */
UsersVO uservo1 = (UsersVO)session.getAttribute("user1");
UsersVO uservo2 = (UsersVO)session.getAttribute("user2");
String player1 = uservo1.getNickname();
String player2 = uservo2.getNickname();

%> 

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>omok1</title>
<link rel="stylesheet" href="reset.css" type="text/css">
<link rel="stylesheet" href="omok.css?after">
<script type="text/javascript" src="/omokGame/view/game/boardview/js/jagi.js" ></script>
</head>
<body>

 <div class="blakcout" id = "blakcout">   </div>
 <div class="blackin" id = "blackin">   </div>      
<%-- <p>${player1 }${player2 } must be printed</p> --%>
 <div class="realwrap">
 <p>11</p>
    <div class="wrap">
        
        <div class="pan">

            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
          
            </ul>
        </div>
        <div class="pan">
            <ul class="x">
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
                <li ><img src=""></li>
            </ul>
        </div>
<!--   -->
		
        <div class="itembox">
        

            <img class = "panimg" src="${pageContext.request.contextPath}/img/pan5.png">
            <div id = "blurblack">  </div>
            <div id = "blackwin"><img src="${pageContext.request.contextPath}/img/blackwin.png"></div>
            <div id = "whitewin"><img src="${pageContext.request.contextPath}/img/whitewin.png"></div>
        </div>

    </div>

       
       
</div>
    
    
    
        <div class="sub">
        
            <div class="timer">
            	<div id="timetext">TIMER</div>
<!--                 <div id="blacktimer"></div>
                <div id="whitetimer"></div> -->
                <div id="timerprint"></div>
            </div>
            <div class="logbox" id="logbox">   

            </div>

            <div class="turndollback">
                <div class="turnprint"><span class="turnprinttext"> </span>&nbsp&nbspTurn</div>
                <%-- <img id = "turndoll" src="${pageContext.request.contextPath}/img/black.png"> --%>
                <p  onclick="undo()"  id = "undo" >무르기</p>
            </div>

        </div>
        
	     <img class = "panshadow" src="${pageContext.request.contextPath}/img/realshadow.png"> 




    <script>
/*     var arr; */

    	var arr;
        var x;
        var y;
        var turn = 0;
        var whowin = "none"
        var pans = document.querySelectorAll(".x");
        
        
        //시간변수
        var blacktime;
        var whitetime;
    	
        //omok.jsp 열리자마자 초기값 지정하는 함수
    	window.onload = function(){

    		var mode = '<%= modeval %>';
    		console.log(mode);
    		console.log(mode == 1);
    		console.log(mode == '1');
    		console.log(mode == 2);
    		console.log(mode == '2');
        	
        	
			//세션 스토리지 길이 strlen 에 저장 
			var strlen = window.sessionStorage.length;
			
			
			//초기 빈array 만들기 
			 arr = new Array(19);

		        for (var i = 0; i < arr.length; i++) {
		            arr[i] = new Array(19);
		        }
		        
		        for (var j = 0; j < 19; j ++) {
		        	for (var i = 0; i < 19; i ++) {
		        		
		        		arr[j][i] = 0;
		        	}
		        	
		        }
			
		        
		    //만약 세선스토리지 길이가 0이라면 -> 이 페이지 접속이 처음이라면 (새로고침 하지 않고 정상 접속하였을떄 )
			if (strlen == 0) {
				
				//turncnt -> 총 몇번쨰 수인지 / 저장이유 : 각 수를 sessionstorage 에 저장하는데 이때 저장 id가 "id" +" turncnt " 형식이라 뒤에서 for문돌려서 추출함				
				var turncnt = 0;
				//sessionstorage 에 turncnt 값 저장 -> 
				sessionStorage.setItem("turncnt", turncnt);
				
				//시간설정
				blacktime = 30;
				whitetime = 30;
				//시간 sessionstorage에 올림 / 이유 : 15초남았는데 새로고침이 다시 잔여시간이 1분이 되면 안되므로 저장해서 뿌려줘야한다고 생각함
				sessionStorage.setItem("blacktime", blacktime);
				sessionStorage.setItem("whitetime", whitetime);
				
				
				
				//0515
	/* 			document.getElementById("blacktimer").innerHTML = "00:30";
				document.getElementById("whitetimer").innerHTML = "00:30"; */
				document.getElementById("timerprint").innerHTML = "00:30";
				
				//초기 turn은 black 
				var spanElement = document.querySelector('.turnprinttext');
                    var spanElement2 = document.querySelector('.turnprint');
					spanElement.innerHTML = '';
					spanElement.innerHTML = '<%= player1 %>';
					spanElement2.style.color = "black";
				
				turn = 1;
	
			 
			}
		    
		    //만약 sesstorage 길이가 0보다 클떄 -> 새로고침이나 기타 비정상 접속일때 (정상적으로 게임이 종료될때 sessstorage 비우는 실행이 뒤에 있으므로)   # else 안쓴이유 : 혹시몰라서 
			else if (strlen > 0) {
				
				// 위에 선언했던 turncnt 에 turncnt 값 받아서 저장  
				turncnt = Number(sessionStorage.getItem("turncnt"));
				
				//시간도 load
				blacktime = Number(sessionStorage.getItem("blacktime"));
				whitetime = Number(sessionStorage.getItem("whitetime"));
				
				
				// 시간 출력 부분 
				var minblk = parseInt(blacktime/60) + "";
    			var secblk = parseInt(blacktime%60) + "";
    			var timetext1 = timerlen(minblk) + ":" + timerlen(secblk);
				var minwht = parseInt(whitetime/60) + "";
    			var secwht = parseInt(whitetime%60) + "";
    			var timetext2 = timerlen(minwht) + ":" + timerlen(secwht);
   /*  			document.getElementById("blacktimer").innerHTML = timetext1; */
    	/* 		document.getElementById("whitetimer").innerHTML = timetext2; */
    			
    			

				// 이건 초기 턴 지정 turncnt 가 짝수면 blakc 턴이고 홀수면 white턴임 -> 인덱스에 turn값도 저장 되어 있는데 맨 마지막 착수의 turn값만 불러오는게 귀찮아서 이렇게함
				if (turncnt % 2 == 0) {
					
					turn = 1;
					var spanElement = document.querySelector('.turnprinttext');
                    var spanElement2 = document.querySelector('.turnprint');
					spanElement.innerHTML = '';
					spanElement.innerHTML = '<%= player1 %>';
					spanElement2.style.color = "black";
					document.getElementById("timerprint").innerHTML = timetext1;
					
					
	
				}
				else if (turncnt % 2 == 1) {
					turn = 2;
					var spanElement = document.querySelector('.turnprinttext');
                    var spanElement2 = document.querySelector('.turnprint');
					spanElement.innerHTML = '';
					spanElement.innerHTML = '<%= player2 %>';
					spanElement2.style.color = "white";
					document.getElementById("timerprint").innerHTML = timetext2;
					
					
					
		
				}

				
				
				
				//저장된 인덱스값 읽어서 바둑판에 뿌려주는부분 (새로고침시 빈 arr에 세션에 저장된 인덱스 값을 뿌려줌 ))
				for(let i = 0; i < window.sessionStorage.length; i++) {
					  // key 찾기
					  var key = window.sessionStorage.key(i);
					  
					  // value 찾기
					  var value = window.sessionStorage.getItem(key);
					  
					 //세션 다긁어 오는 거라 조건을 필요없는거 뺴고 다 긁어와라 이런식으로 지정 
					  if (key.trim() !== 'turncnt' && key.trim() !== 'blacktime' && key.trim() !== 'whitetime') {
						  
						  //저장값이 숫자 쉽표 숫자 형식이라 쉼표 기준으로 스플릿 해서 arr에 저장 
						  var valarr = value.split(',');
						  //arr[0] 은 x 로 저장했엇고 arr[1] 은 y로 저장 했었음 그거 받아서 arr에 넣어줌 
						  var x = Number(valarr[0]);
						  var y = Number(valarr[1]);
						  //arr[2] 는 turn값 / 1은 흑의 착수 2는 백의 착수 arr에 넣어줄값 
						  var turn2 = Number(valarr[2]);
						  arr[x][y] = turn2;
						  
						  
						  
						 //아래로는 읽어온 인덱스 값을 기준으로 src 경로에 흑, 백돌 넣어주기 
						// 첫번째 pan의 ul 요소 찾기
						  const firstPanUl = document.querySelectorAll('.pan')[x].querySelector('ul');

						  // 두번째 li 요소 찾기
						  const secondLi = firstPanUl.querySelectorAll('li')[y];

						  // img 요소 찾기
						  const img = secondLi.querySelector('img');

						  // src 속성 설정
						  if (turn2 == 1) {

							  img.src = '${pageContext.request.contextPath}/img/black.png';
  
						  }
						  
						  else if (turn2 == 2) {

							  img.src = '${pageContext.request.contextPath}/img/white.png';
	  
						  }
  
					  }

					}
	

			}
			
			
			//이건 omok.jsp 접속시 효과용 
 			var blackout = document.querySelector(".blakcout");
		    blackout.style.opacity = 0;

    	  }
        
        function printjari(x) {
        	
        	if (x < 10) {
        		
        		return "00" + x;
        		
        		
        	}
        	else if (x >= 10 && x < 99) {
        		
        		return "0" + x;	
        	}
        	else {
        		return x;
        		
        	}
        	
			
		}
        
       	function printjari2(x) {
       		
       		if(x < 10) {
       			
       			return "0" + x;
       		}
       		else {
       			return x;
       		}
       		
       		
       	}
        
     
    	
        
        
    	//log 로그 프린트용 
    	
    	function logprint(turncnt, turn,x, y) {
    		
    		
    		var element = document.querySelector("#logbox");

    		// 새로운 <p> 요소를 생성합니다.
    		var newParagraph = document.createElement("p");
    		
    		var blackorwhite;
    		
    		if (Number(turn) == 1) {
    			blackorwhite = 'Black';
    		}
    		else {
    			blackorwhite = 'White';
    			
    		}
    		
    		
    		
    		if (Number(turn) == 1){
    			
    			
    			var thisturncnt = printjari(turncnt)
        		newParagraph.style.color = "#E259ED";
    			newParagraph.style.fontSize = "32px";
    			newParagraph.style.fontWeight = "900";
    			newParagraph.style.marginBottom = "7%";
        		// <p> 요소에 내용을 추가합니다.
        		var nickname = '<%= player1 %>';
        		newParagraph.innerHTML = thisturncnt + "&nbsp&nbsp&nbsp" + blackorwhite + "&nbsp&nbsp(" + printjari2(x) + ",&nbsp" + printjari2(y) + ")&nbsp&nbsp&nbsp" + nickname;     

        		// 선택한 요소에 새로운 <p> 요소를 추가합니다.
        		element.appendChild(newParagraph);
        		
    			
    			
    		}
    		else if (Number(turn) == 2){
    			
    			
    			var thisturncnt = printjari(turncnt)
        		newParagraph.style.color = "#3699F8";
    			newParagraph.style.fontSize = "32px";
    			newParagraph.style.fontWeight = "900";
    			newParagraph.style.marginBottom = "7%";
    			// <p> 요소에 내용을 추가합니다.
    			var nickname = '<%= player2 %>';
        		newParagraph.innerHTML = thisturncnt + "&nbsp&nbsp&nbsp" + blackorwhite + "&nbsp(" + printjari2(x) + ",&nbsp" + printjari2(y) + ")&nbsp&nbsp&nbsp" + nickname;

        		// 선택한 요소에 새로운 <p> 요소를 추가합니다.
        		element.appendChild(newParagraph);
        		
    			
    			
    			
    		}
    		 /* (Number(turn) == -1)  */
				else{
    			
    			
    			newParagraph.style.fontSize = "32px";
    			newParagraph.style.marginBottom = "7%";
    			
    			
    			newParagraph.innerHTML = "무르기";
    			
    			
    			element.appendChild(newParagraph);
    			
    			
    		}
    		
    		
	
    	}
    	
    	
    	//timer 1분 1초일떄 1:1 출력이 아니라 01:01 출력 하고 싶어서 만든 함수 인터벌 안에서 사용됨 
    	
    	function timerlen(text) {
    		
    		var outtext;
    		
    		if (text.length == 1) {
    			
    			outtext = "0" + text;
    			
    			return outtext;
    		}
    		else{

    			return text;
    			
    		}
	
    	}
    	
    	//timer 1초마다 실행 
    	var timer = setInterval(function() {
    		
    		
    		//흑턴일떄 
    		if (turn == 1) {
    			
    			var min = parseInt(blacktime/60) + "";
    			var sec = parseInt(blacktime%60) + "";
    		
    			var timetext = timerlen(min) + ":" + timerlen(sec);
    			
        		sessionStorage.setItem("blacktime", blacktime);
    	/* 		document.getElementById("blacktimer").innerHTML = timetext; */
    			document.getElementById("timerprint").innerHTML = timetext;
    			
    			
    			
    			//흑의 시간초 패배 
    			if (blacktime <= 0) {
    				
    				whowin = 'whitewin';
    				
    				ajax(whowin) ;
                    
    				document.getElementById('whitewin').style.display = 'block';
                    document.getElementById('blurblack').style.display = 'block';
                    sessionStorage.clear();
                    closefunc();
                    clearInterval(timer);
                    return;
    				
    				} 
					
				//아마 omok승리시 main으로 넘어가도 인터벌함수가 종료 안되는 문제때문에 만든 함수일듯 (기억이잘안남 ㅈㅅ )
    				if (whowin != "none") {
    					clearInterval(timer);
    				return
    				}
    			
    			
        			blacktime--;
	
    		}
    		
    		//백턴일떄 else안쓴이유 상동 
    		else if (turn == 2){
    			
    			
    			var min = parseInt(whitetime/60)+ "";
    			var sec = parseInt(whitetime%60)+ "";
    			var timetext = timerlen(min) + ":" + timerlen(sec);
    			sessionStorage.setItem("whitetime", whitetime);
    		/* 	document.getElementById("whitetimer").innerHTML = timetext; */
    			document.getElementById("timerprint").innerHTML = timetext;
				
    			//백의 시간초 패배 
    			if (whitetime <= 0){
    				
					whowin = 'blackwin';
    				
    				ajax(whowin) ;
    				
    				document.getElementById('blackwin').style.display = 'block';
                    document.getElementById('blurblack').style.display = 'block';
                    sessionStorage.clear();
                    closefunc();
                    clearInterval(timer);
                    return;
	
    			}
				//아마 omok승리시 main으로 넘어가도 인터벌함수가 종료 안되는 문제때문에 만든 함수일듯 (기억이잘안남 ㅈㅅ )
    			if (whowin != "none") {
    				clearInterval(timer);
    				return;
    			}
    			whitetime--;
	
    		}

		}, 1000);
 

        //승리판단로직
        function iswin() {
            var cnt = 0;//각 for문 마다 연속돌 새는거
            var flag = turn == 1? "black" : "white";

            //garo
            for(var i = 0; i < 19; i++) {
                if (Number(arr[x][i]) == turn) {
                    cnt += 1;
                    if (cnt >= 5) {
                        whowin = flag + "win" // 연속돌 5개면 flag(black or white) + win 문자열 생성  whowin = 전역변수임
                        return;
                    }
                }
                else {
                    cnt = 0
                }
            }
            //sero
            for(var j = 0 ; j < 19; j ++) {
                if (Number(arr[j][y]) == turn) {
                    cnt += 1;
                    if (cnt >= 5) {
                        whowin = flag + "win"
                    }
                }
                else {
                    cnt = 0
                }
            }

            //  \left\
            for(var i=0;i<=10;i++) {
    		var indexX = x-4+i;
			var indexY = y-4+i;
			//Number(arr[x][i]) == turn
			if(0<=indexX && indexX<=18 && 0<=indexY && indexY<=18) {
				if(Number(arr[indexX][indexY]) == turn) {
					cnt+=1;
					
					if (cnt >= 5) {
                        whowin = flag + "win"
                    }

				}else {
					cnt = 0;
				}
			}
    	}
            // /right/
            for(var i=0;i<=10;i++) {
    		var indexX = x-4+i;
			var indexY = y+4-i;
			if(0<=indexX && indexX<=18 && 0<=indexY && indexY<=18) {
				if(Number(arr[indexX][indexY]) == turn) {
					cnt+= 1;
					if (cnt >= 5) {
                        whowin = flag + "win"
                    }
				}else {
					cnt = 0;
				}
			}
    	}
        }

  
        function ajax(whowin) {
        	var xhr = new XMLHttpRequest(); //XMLHttpRequest객체 생성

        	var whowinsend = whowin;
        	var url = '/omokGame/game/gameend.do?whowinsend=' + whowinsend;
        	xhr.open('GET', url, true); //open(방식,url,비동기(true)동기(false))
        	xhr.send();//전송임
        	xhr.onload = () => {
        		if(xhr.status == 200) {
        			console.log(xhr.response);
        			
        		} else {
        			console.log('false');
        		}
        	}
        }
        
        
        function undo() {
        	
        	var turncnt = Number(sessionStorage.getItem("turncnt"));
        	
        	
        	if (turncnt > 0) {
        		
        		var arridx = 'arr' + turncnt;
            	var sessarr = sessionStorage.getItem(arridx);
            	var valarr = sessarr.split(',');
            	var undox = Number(valarr[0]);
            	var undoy = Number(valarr[1]);
            	var undoturn = Number(valarr[2]);
     
            	
            	arr[undox][undoy] = 0; 
            	
            	
            	
            	 const firstPanUl = document.querySelectorAll('.pan')[undox].querySelector('ul');
            	 
            	 const secondLi = firstPanUl.querySelectorAll('li')[undoy];
            	 
            	 const img = secondLi.querySelector('img');
            	 
            	img.src = '';	
    			turncnt = turncnt - 1;
    			sessionStorage.setItem("turncnt", turncnt);
            	
            	if (undoturn == 1) {
            		
            		turn = 1;
            	}
            	else if (undoturn == 2) {
            		
            		turn = 2;
            		
            	}
            	

        	}
            	sessionStorage.removeItem(arridx);
            	logprint(-1,0,0,0);

		}
        function handleTransitionEnd() {
        	 window.location.href = '/omokGame/main.do';
        	
        	
        }
        
        
        function closefunc() {
        	  // 클릭 이벤트 핸들러 등록을 지연시키기 위해 setTimeout 함수.
      /*   	 window.location.href = '/omokGame/main.do'; */
        	  setTimeout(function() {
        		  
        		  
        	    document.addEventListener('click', function() {
        	       sessionStorage.clear();
        	       
        	       

        	       
        	       var blackin = document.querySelector(".blackin");
        	       blackin.style.opacity = 1;
        	       
        	       blackin.addEventListener("transitionend", handleTransitionEnd);
      
        	    });
        	  }, 0.5);
        	}
        

        pans.forEach(e => { //클릭시 이벤트 발생
            e.onclick = (e1) => {
                // dup처리 포함
                if (turn == 1 && e1.target.firstChild.src != "") { //만약 흑turn 이면서 둘곳이 빈자리가 아닐떄 

                   /*  document.getElementById('turndoll').src = '${pageContext.request.contextPath}/img/white.png';  */ //턴 표시해주는 돌을 흑돌 이미지 표시해주고
                    var spanElement = document.querySelector('.turnprinttext');
                    var spanElement2 = document.querySelector('.turnprint');
					spanElement.innerHTML = '';
					spanElement.innerHTML = '<%= player2 %>';
					spanElement2.style.color = "white";
					
                    var nodes = [...e1.target.parentElement.children];  // 인덱스 관련 nodes변수에 이벤트 타겟 부모 요소 찾아가서 다시 자식요소들 list에 담기
                    var nodes2 = [...e1.target.parentElement.parentElement.parentElement.children]; // 상동 */
                    y = nodes.indexOf(e1.target);//위에 담은 list중에 이벤트 타겟과 같은 아이를 찾고 그 인덱스 변수에 저장
                    x = nodes2.indexOf(e1.target.parentElement.parentElement);

                    arr[x][y] = 1;
                    e1.target.firstChild.src = '${pageContext.request.contextPath}/img/black.png';   // 비어있는 img src에 흑돌이미지 경로 넣어주기

                    iswin();

                if (whowin != "none") { // 만약 iswin() 로직이 전역변수 "none" 을 변경 시켰을 때 (누군가 승리했을떄) 이유: 흑이 뒀는때 백이 이길순 없음
                        document.getElementById('blackwin').style.display = 'block';   //승리 display속성 block
                        document.getElementById('blurblack').style.display = 'block';
                        
                        //효과
                        ajax(whowin) ;
                        
                        
                        sessionStorage.clear();
                        closefunc();
                        return;     

                }
                turncnt = Number(sessionStorage.getItem("turncnt"));
                turncnt += 1;
                sessionStorage.setItem('turncnt', turncnt);
 
                var arridx = 'arr' + turncnt;
                var arridxval = x+','+y+','+turn;
              /*   var arridxval2 =JSON.stringify(arridxval); */
                	
				sessionStorage.setItem(arridx, arridxval); 
					
              
				blacktime = 30;
                sessionStorage.setItem("blacktime", blacktime);
                
/*                 document.getElementById("blacktimer").innerHTML = "01:00"; */
		/* 		document.getElementById("whitetimer").innerHTML = "01:00"; */
				

               //temp
                logprint(turncnt, turn,x, y);
                turn=2;	
                
                }
                else if(turn==2 && e1.target.firstChild.src != ""){
                	
                	
                    /* document.getElementById('turndoll').src = '${pageContext.request.contextPath}/img/black.png'; */
                    var spanElement = document.querySelector('.turnprinttext');
                    var spanElement2 = document.querySelector('.turnprint');
					spanElement.innerHTML = '';
					spanElement.innerHTML = '<%= player1 %>';
					spanElement2.style.color = "black";
					
					
                    var nodes = [...e1.target.parentElement.children];
                    var nodes2 = [...e1.target.parentElement.parentElement.parentElement.children];
                    y = nodes.indexOf(e1.target);
                    x = nodes2.indexOf(e1.target.parentElement.parentElement);
                    arr[x][y] = 2;
                    e1.target.firstChild.src = "${pageContext.request.contextPath}/img/white.png";
                    iswin();
             
                    /* doPass(x, y); */
                    if (whowin != "none") {
      
                        document.getElementById('whitewin').style.display = 'block';
                        document.getElementById('blurblack').style.display = 'block';
              
                        ajax(whowin) ;
                        
                        sessionStorage.clear();
                        closefunc();
                        
                        
                        return;
                    }
                    
                    turncnt = Number(sessionStorage.getItem("turncnt"));
                    
                  
                    
                    turncnt += 1;
                    sessionStorage.setItem('turncnt', turncnt);
     
                    var arridx = 'arr' + turncnt;
                    var arridxval = x+','+y+','+turn;

					sessionStorage.setItem(arridx, arridxval); 
	
					whitetime = 30;
                    sessionStorage.setItem("whitetime", whitetime);
                    
       /*              document.getElementById("blacktimer").innerHTML = "01:00";
    				document.getElementById("whitetimer").innerHTML = "01:00"; */
    				 
                    
                    logprint(turncnt, turn,x, y);
                    turn = 1;
                }else{}
           
            } 
    
        })

    </script>
    


</body>
</html>