<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/view/login/login.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	//window.onload = function(){}
	let cnt = 1;
	function userCheck(playerNum) {
		// 유효성 검사
		if ($("#idInput" + playerNum).val() == "") {
			alert("아이디를 입력하세요");
			$("#idInput" + playerNum).focus();
			return false; // 정상종료
		}
		if ($("#pwdInput" + playerNum).val() == "") {
			alert("비밀번호를 입력하세요");
			$("#pwdInput" + playerNum).focus();
			return false; // 정상종료
		}

		// 회원확인
		$.ajax({
			type : 'post',
			async : true, //기본값 true
			url : "../users/check",
			data : {
				cnt : cnt,
				num : playerNum,
				id : $("#idInput" + playerNum).val(),
				pwd : $("#pwdInput" + playerNum).val()
			},
			success : function(res) {
				console.log(res)
				if (res == 'true') {
					$("#ready" + playerNum).css("z-index", "3");
					$("#ready" + playerNum).children("#readytxt").attr("class",
							"animate__animated animate__flipInX");
					cnt++;
				} else if (res == 'dupli') {
					alert("이미 로그인 된 아이디입니다.");
					$("#idInput" + playerNum).val('');
					$("#pwdInput" + playerNum).val('');
				} else {
					alert("회원정보를 찾을 수 없습니다.");
					$("#idInput" + playerNum).val('');
					$("#pwdInput" + playerNum).val('');
				}
			},
			complete : function() {
				if (cnt == 3) {
					setTimeout(() => {
						location.replace("../users/login");
					}, 1000)
					
				}
			}

		})

		//로그인 완료하면 이동
		function sleep(num) {
			var now = new Date();
			var stop = now.getTime() + num;
			while (true) {
				now = new Date();
				if (now.getTime() > stop)
					return;
			}
		}
	}
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<img
				src="${pageContext.request.contextPath}/view/login/image/mainLogo.png"
				alt="" />
		</div>
		<div id="loginForm">
			<div id="player" class="user1">
				<div id="ready1">
					<div id="readytxt" style="color: #5fd4ff;">READY!!</div>
				</div>
				<div class="playerNum" id="num1">1P</div>
				<div id="info">
					<div class="userText" id="userID">
						<div id="idText">ID</div>
						<input type="text" id="idInput1" />
					</div>
					<div class="userText" id="userPwd">
						<div id="pwdText">Password</div>
						<input type="password" id="pwdInput1" />
					</div>
					<input class="loginBtn" id="btn1" type="button" value="Login"
						onclick="userCheck('1')" />
				</div>
			</div>

			<div id="center">
				<img
					src="${pageContext.request.contextPath}/view/login/image/VS.png"
					width="200px" alt="" id="vsImg" />
			</div>

			<div id="player" class="user2">
				<div id="ready2">
					<div id="readytxt" style="color: #f87aff;">READY!!</div>
				</div>
				<div class="playerNum" id="num2">2P</div>
				<div id="info">
					<div class="userText" id="userID">
						<div id="idText">ID</div>
						<input type="text" id="idInput2" />
					</div>
					<div class="userText" id="userPwd">
						<div id="pwdText">Password</div>
						<input type="password" id="pwdInput2" />
					</div>
					<input class="loginBtn" id="btn2" type="button" value="Login"
						onclick="userCheck('2')" />
				</div>
			</div>
		</div>
		<div id="footer">
			<a href="">want JOIN?</a>
		</div>
	</div>
</body>
</html>