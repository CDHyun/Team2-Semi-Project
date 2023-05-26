<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<!-- Javascript Functions -->
<script type="text/javascript">
	/* 1. 알림 창을 화면 중앙에 표시 */
	function showAlert(message) {
		const alertBox = document.createElement('div');
		alertBox.className = 'alert-box';
		alertBox.innerText = message;

		const container = document.querySelector('.background');
		container.appendChild(alertBox);

		// 화면 중앙에 알림 창을 위치시키기 위해 CSS를 조작
		const alertBoxWidth = alertBox.offsetWidth;
		const alertBoxHeight = alertBox.offsetHeight;
		alertBox.style.left = `calc(50% - ${alertBoxWidth / 2}px)`;
		alertBox.style.top = `calc(50% - ${alertBoxHeight / 2}px)`;

		// 3초 후에 알림 창을 제거
		setTimeout(function() {
			alertBox.remove();
		}, 3000);
	}

	/* 2. 로그인 체크 */
	function loginCheck() {
		const form = document.login_form;
		const uid = form.uid.value.trim();
		const uPassword = form.uPassword.value.trim();

		if(uid.length === 0) {
			showAlert("아이디를 입력하세요.");
			return;
		}
		
		if(uPassword.length ===0){
			showAlert("비밀번호를 입력하세요.");
			return;
		}

		form.submit();
	}
	
	
</script>


<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	width: 400px;
	margin: 0 auto;
}

h2 {
	text-align: center;
	margin-top: 0;
}

.form-group {
	margin-bottom: 20px;
}

.form-group input {
	width: 100%;
	padding: 10px;
	border-radius: 30px;
	border: 1px solid #ccc;
	outline: none;
	transition: border-color 0.3s;
	box-sizing: border-box; /* 추가된 부분: 입력 영역이 내부 패딩을 포함하도록 설정 */
}

.form-group input:focus {
	border-color: dodgerblue;
}

.button {
	background-color: dodgerblue;
	color: #fff;
	border: none;
	border-radius: 30px;
	padding: 10px 20px;
	cursor: pointer;
	width: 100%;
	transition: background-color 0.3s;
}

.button:hover {
	background-color: #009edb;
}

.background {
	background-color: #f2f2f2;
	padding: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.alert-box {
	position: fixed;
	z-index: 9999;
	background-color: rgba(0, 0, 0, 0.8);
	color: #fff;
	padding: 20px;
	border-radius: 10px;
	font-size: 16px;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<body>
	<div class="background">
		<div class="container">
			<h2>회원 로그인</h2>
			<form action="login.do" name="login_form">
				<div class="form-group">
					<input type="text" name="uid" placeholder="아이디">
				</div>
				<div class="form-group">
					<input type="password" name="uPassword" placeholder="비밀번호">
				</div>
				<input type="button" class="button" value="로그인"
					onclick="loginCheck()"><br /> 아직 회원이 아니세요? <a
					href="sign_up.jsp">회원가입</a>
			</form>
		</div>
	</div>
</body>
</html>