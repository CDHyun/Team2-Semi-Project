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



</head>
<body>
	<form action="register.do" name="register">
		아이디 <input type="text" name="uid"> <br/>
		비밀번호 <input type="password" name="uPassword"> <br/>
		비밀번호 확인 <input type="password" name="uRePass"> <br/>
		이름 <input type="text" name="uName"> <br/>
		전화번호 <input type="text" name="uPhone"> <br/>
		이메일 <input type="text" name="uEmail"> <br/>
		주소 <input type="text" name="uAddress"> <br/>
		<input type="button" value="회원가입" onclick="registerCheck()">
	</form>
</body>
</html>