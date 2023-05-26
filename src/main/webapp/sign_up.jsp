<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Sign Up Page</title>
<!-- JavaScript Functions -->
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

	function registerCheck() {
		const form = document.register
		const uid = form.uid.value.trim()
		const uPassword = form.uPassword.value.trim()
		const uRePass = form.uRePass.value.trim()
		const uName = form.uName.value.trim()
		const uPhone = form.uPhone.value.trim()
		const uEmail = form.uEmail.value.trim()
		const uAddress = form.uAddress.value.trim()

		if(uid.length === 0){
			showAlert("아이디를 입력해주세요.")
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
}

.container {
	margin: 0 auto;
	margin-top: 250px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	width: 600px;
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
	box-sizing: border-box; /* 추가된 부분: 입력 영역이 padding을 포함하도록 설정 */
}

.form-group input:focus {
	border-color: #1e90ff;
}

.button {
	background-color: #1e90ff;
	color: #fff;
	border: none;
	border-radius: 30px;
	padding: 10px;
	font-size: 16px;
	cursor: pointer;
	width: 100%;
}

.button:hover {
	background-color: #1e90ff;
}

.alert-box {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: rgba(0, 0, 0, 0.7);
	color: #fff;
	padding: 10px 20px;
	border-radius: 5px;
}

.header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 999;
}
</style>

</head>
<body>

<!-- Header Start -->
<div class="header">
	<jsp:include page="assets/common/include_common_header.jsp"/>
</div>
<!-- Header End -->

<div class="container">
	<h2>회원 가입</h2>
	<form action="register.do" name="register">
		<div class="form-group">
			아이디 <input type="text" name="uid">
		</div>
		<div class="form-group">
			비밀번호 <input type="password" name="uPassword">
		</div>
		<div class="form-group">
			비밀번호 확인 <input type="password" name="uRePass">
		</div>
		<div class="form-group">
			이름 <input type="text" name="uName">
		</div>
		<div class="form-group">
			전화번호 <input type="text" name="uPhone">
		</div>
		<div class="form-group">
			이메일 <input type="text" name="uEmail">
		</div>
		<div class="form-group">
			주소 <input type="text" name="uAddress">
		</div>
		<input type="button" class="button" value="회원가입" onclick="registerCheck()">
	</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
