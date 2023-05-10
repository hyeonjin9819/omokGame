<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/history.css">
    <title>history</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
    <script>
    function test() {
    	alert($("#filter").val());
    	
    }
    </script>
    
     <script type="text/javascript">
     function historyFilter(id){
    	 location.href="?filter=" + id; 
     }
     
     /* 유저 이름 넘겨주면 찾는 로직  */
     function findUser(id){
    	 
     }
     
     function back() {
    	 window.history.back();
     }

    
	</script>
	
	
</head>


<body class="wrap">
    <div class="borderbox">
    <div>
    	<button type="button" id="btnEvent" class="btnEvent" style="background-color:transparent; border: none;" onclick=back()>
        	<img src = "${pageContext.request.contextPath}/img/back.png" alt="btnImages"> 
        </button>
        </div>
        <div class="userExplain">
           <br>
            <div class="userDetail">
                NAME: ${data.p1Name }<br>
                PLAYED: ${data.gamecnt }<br>
                WINRATE: ${data.winrate}%<br>
             </div>
            <div class="coinTxt">
            <img src = "${pageContext.request.contextPath}/img/COIN.png">${data.point } COIN 
            <hr>
            </div>
           
        </div>
        
        <div class="middleLine"></div>
        <div class="history">
        	<div>
<!-- 			  <select id = "filter" name="filter" onchange="handleOnChange(this)" onclick="historyFilter">
			  	<option value="all">All</option>
			    <option value="win">WIN</option>
			    <option value="defeat">DEFEAT</option>
			  </select>
			  <div id='result'></div>
			  <div> -->
             </div>
             
<!--               <div>
             	<button id ="all" onClick=historyFilter(id) value="all">All</button>
             	<button id ="win" onClick=historyFilter(id) value="win">WIN</button>
             	<button id="defeat" onClick=historyFilter(id) value="defeat">DEFEAT</button>
             </div> -->
             
            <table class="historyTable">
                <tr id = "title">
                    <th>IDX</th>
                    <th>PLAYER1</th>
                    <th>PLAYER2</th>
                    <th>DATE</th>
                    <th>WINNER</th>
                    <th>MODE</th>
                </tr>
                <c:if test="${empty tableList}">
                	<tr>
                		<td colspan='6'>아직 전적이 존재하지 않습니다</td>
                	</tr>
                </c:if>
                
                <c:if test="${!empty tableList}">
                	<c:forEach var ="his" items="${tableList }" varStatus="status">
                	<tr id = "item">
                	<td>${status.count} </td> 
                	<td>${his.p1Name }</td>
                	<td>${his.p2Name }</td>
                	<td>${his.date}</td>
                	<td>${his.winner }</td>
                	
                	<td>${his.mode }</td>
                	</tr>
                	
                	</c:forEach>
                </c:if>
            </table>
            
            
            <div>

페이지처리 하는 곳
			</div>
			
        </div>

    </div>
</body>
</html>