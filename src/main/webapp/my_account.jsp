<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>My Page</title>
</head>
<body>
	<div class="header">
		<jsp:include page="assets/common/include_common_header.jsp"/>
	</div>
	
	<h2>My Page</h2>
	<form action="modify" name="register" method="post">
		<div class="form-group">
			아이디 <input type="text" id="uid" name="uid">
			<input type="button" value="중복체크" onclick="checkDuplicateId()">
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
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>