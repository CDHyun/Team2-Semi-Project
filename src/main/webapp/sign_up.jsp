<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Page</title>
<!-- JavaScript Functions -->
<script type="text/javascript">
function registerCheck() {
	const form = document.register
	
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
	box-sizing: border-box;
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
</style>
</head>
<body>
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
</body>
</html>
