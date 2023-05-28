<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Javascript Functions -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
		const uid = $('#uid').val();
		const uPassword = $('#uPassword').val();
		const form = document.login_form

		if (uid.trim().length === 0) {
			showAlert("아이디를 입력해주세요.");
			return;
		}

		if (uPassword.trim().length === 0) {
			showAlert("비밀번호를 입력해주세요.");
			return;
		}

		console.log(uid);
		console.log(uPassword);
		$.ajax({
			type : 'POST',
			url : './JazzUserLoginCommand',
			data : {
				uid : uid,
				uPassword : uPassword
			},
			success : function(result) {
				console.log(result);
				if (result === "0") {
					showAlert("아이디 혹은 비밀번호를 확인해주세요.")
					return;
				}
				if (result === "-1") {
					showAlert("탈퇴한 회원입니다.")
					return;
				}
				if (result === "-2") {
					showAlert("존재하지 않는 회원입니다.")
					return;
				}
				if (result === "1") {
					showAlert("로그인 성공!");
					setTimeout(function() {
						form.submit();
					}, 1500);
				}
			},
			error : function() {
				showAlert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		});
	}
</script>

<style>
.header {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 999;
	background-color: #000;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 500px;
	margin: 50px auto;
	margin-top: 200px;
	padding: 30px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-top: 0;
	color: #000;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-weight: 500;
}

.form-group input:focus {
	border-color: #000;
}

.button {
	width: 100%;
	height: 40px;
	padding: 6px 12px;
	font-size: 14px;
	font-weight: 500;
	color: #fff;
	background-color: #242424;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.button:hover {
	background-color: #324b99;
}

.background {
	background-color: #f2f2f2;
	padding: 20px;
	min-height: 100vh;
}

.alert-box {
	position: fixed;
	z-index: 999;
	background-color: rgba(0, 0, 0, 0.7);
	color: #fff;
	padding: 10px 20px;
	border-radius: 5px;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

a {
	color: #000;
	text-decoration: none;
}

a:hover {
	color: #333;
}

.signup-link {
	color: dodgerblue;
}

.signup-container {
	display: flex;
	justify-content: center;
}

.form-control {
	width: 100%;
	height: 40px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 4px;
}
</style>

</head>

<body>
	<!-- Header Start -->
	<div class="header">
		<jsp:include page="assets/common/include_common_header.jsp" />
	</div>
	<!-- Header End -->
	<div class="background">
		<div class="container">
			<h2>회원 로그인</h2>
			<form action="login.do" name="login_form" method="post">
				<div class="form-group">
					<input type="text" id="uid" name="uid" class="form-control"
						placeholder="아이디">
				</div>
				<div class="form-group">
					<input type="password" id="uPassword" name="uPassword"
						class="form-control" placeholder="비밀번호">
				</div>
				<input type="button" class="button" value="로그인"
					onclick="loginCheck()"><br />
				<br />
				<div class="signup-container text-center">
					아직 회원이 아니신가요? <a href="sign_up.jsp" class="signup-link">&nbsp;회원가입</a>
				</div>
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>

</html>
