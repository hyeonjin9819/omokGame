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
    

    
     <script type="text/javascript">
     function historyFilter(id){
    	 location.href="?user=${userno}&pg=1&filter=" + id; 
     }
     
     function back() {
    	 location.href = "${pageContext.request.contextPath}/main.do"
     }

    
	</script>
	
	
</head>


<body class="wrap">
    <div class="borderbox">
        <div class="userExplain">
            <div class="backBtn">
		    	<button type="button" id="btnEvent" class="btnEvent" style="background-color:transparent; border: none;" onclick=back()>
		        	<img src = "${pageContext.request.contextPath}/img/back.png" alt="btnImages"> 
		        </button>
        	</div>
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
        	<div class= "rightSide">
             
             <div>
             	<button id ="1" onClick=historyFilter(id) value="1">All</button>
             	<button id ="2" onClick=historyFilter(id) value="2">WIN</button>
             	<button id="3" onClick=historyFilter(id) value="3">DEFEAT</button>
             </div>
             
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
                	<td>${(status.count) + (param.pg-1)*10 }</td>
                	<td>${his.p1Name }</td>
                	<td>${his.p2Name }</td>
                	<td>${his.date}</td>
                	<td>${his.winner }</td>
                	<td>${his.mode }</td>
                	</tr>
                	
                	</c:forEach>
                </c:if>
            </table>

        </div>
        
        <div class="tableWrap">

		<nav aria-label="..." >
			<div style="width:100%" class="halfpage">
			<ul class="pagination pagination-sm">
				<c:forEach begin="1" end="${data.totalPage / 10 +1}" step="1" var="i">
						<li class="page-item"><a style="background-color: black; color: white; font-size:larger" class="page-link"href="index.do?user=${userno}&pg=${i}&filter=${param.filter}">${i}</a></li>
				</c:forEach>
			</ul>
			</div>
		</nav>	
	</div>
	 </div> 
	
    </div>
</body>
</html>