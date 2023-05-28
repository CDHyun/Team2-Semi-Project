<%@page import="com.javalec.shop.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-TYUH3bRBjiBq7xSlFjwUNx67MU17nIxF4qPa9JvZxt7H3BRX8cD/teXUIstzk95Q"
	crossorigin="anonymous">
<title>Sign Up Page</title>
<!-- JavaScript Functions -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	/* 1. 알림 창을 화면 중앙에 표시 */
	function showAlert(message) {
		const alertBox = document.createElement('div');
		alertBox.className = 'alert-box';
		alertBox.innerText = message;

		const container = document.querySelector('.container'); // 수정: .background -> .container
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

	function checkDuplicateId() {
		const uid = $('#uid').val();
		const regExpAdmin = /^(?!.*(?:admin|root|insert|update|delete|select)).*$/
		if (!regExpAdmin.test(uid.toLowerCase())) {
			showAlert("Java Fundmental 규약에 어긋나는 아이디는 사용 불가능합니다.");
			form.uid.select();
			return;
		}
		if (uid.trim().length === 0) {
			showAlert("아이디를 입력해주세요.");
			return;
		}
		console.log(uid);
		$.ajax({
			type : 'POST',
			url : './userRegisterCheckCommand',
			data : {
				uid : uid
			},
			success : function(result) {
				console.log(result);
				if (result === "0") {
					showAlert("사용 가능한 아이디입니다.");
				} else {
					showAlert("중복되는 아이디입니다.");
				}
			},
			error : function() {
				showAlert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		});
	}

	function registerCheck() {
		/*  var uid = $('#uid').val(); */
		const uid = $('#uid').val();
		const form = document.register;
		const uPassword = form.uPassword.value
		const uRePass = form.uRePass.value
		const uName = form.uName.value
		const uPhone = form.uPhone.value
		const uEmail = form.uEmail.value
		const uAddress = form.uAddress.value
		const regExpAdmin = /^(?!.*(?:admin|root|insert|update|delete|select)).*$/
		if (!regExpAdmin.test(uid.toLowerCase())) {
			showAlert("Java Fundmental 규약에 어긋나는 아이디는 사용 불가능합니다.");
			form.uid.select();
			return;
		}

		const regExpuid = /^[a-z|A-Z|0-9]*$/;
		const regExpuPass = /^[a-z|A-Z|0-9]*$/;
		const regExpuName = /^[a-z|A-Z|가-힣]*$/;
		const regExpuPhone = /^\d{3}-\d{3,4}-\d{4}$/;
		const regExpuEmail = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
		const regExpuAddress = /^[가-힣|0-9|a-z|A-Z|-|\s]*$/;

		if (!regExpAdmin.test(uid.toLowerCase())) {
			showAlert("Java Fundmental 규약에 어긋나는 아이디는 사용 불가능합니다.");
			form.uid.select();
			return;
		}

		if (uid.trim().length === 0) {
			showAlert("아이디를 입력해주세요.");
			return;
		}

		if (!regExpuid.test(uid)) {
			showAlert("아이디는 영문&숫자만 사용 가능합니다.")
			form.uid.select();
			return

		}

		if (uPassword.trim().length === 0) {
			showAlert("비밀번호를 입력해주세요.");
			return;
		}
		if (!regExpuPass.test(uPassword)) {
			showAlert("비밀번호는 영문&숫자만 사용 가능합니다.")
			form.uPassword.select();
			return

		}

		if (uRePass.trim().length === 0) {
			showAlert("비밀번호 확인을 입력해주세요.");
			return;
		}
		if (!regExpuPass.test(uRePass)) {
			showAlert("비밀번호는 영문&숫자만 사용 가능합니다.")
			form.uRePass.select();
			return

		}
		if (uPassword.trim() !== uRePass.trim()) {
			showAlert("비밀번호가 일치하지 않습니다.");
			form.uRePass.select();
			return

		}

		if (uName.trim().length === 0) {
			showAlert("이름을 입력해주세요.");
			return;
		}
		if (!regExpuName.test(uName)) {
			showAlert("이름은 한글과 영문만 입력 할 수 있습니다.")
			form.uName.select();
			return

		}

		if (uPhone.trim().length === 0) {
			showAlert("전화번호를 입력해주세요.");
			return;
		}
		if (!regExpuPhone.test(uPhone)) {
			showAlert("전화번호를 확인해주세요.\n ex)010-1234-5678")
			form.uPhone.select();
			return

		}

		if (uEmail.trim().length === 0) {
			showAlert("이메일을 입력해주세요.");
			return;
		}
		if (!regExpuEmail.test(uEmail)) {
			showAlert("이메일 형식을 확인해주세요. \n ex) id@domain.com")
			form.uEmail.select();
			return

		}

		if (uAddress.trim().length === 0) {
			showAlert("주소를 입력해주세요.");
			return;
		}
		if (!regExpuAddress.test(uAddress)) {
			showAlert("주소는 영문/한글/숫자/- 만 입력 가능합니다.")
			form.uAddress.select();
			return

		}

		console.log(uid);
		$.ajax({
			type : 'POST',
			url : './JazzUserRegisterCommand',
			data : {
				uid : uid,
				uPassword : uPassword,
				uName : uName,
				uPhone : uPhone,
				uEmail : uEmail,
				uAddress : uAddress
			},
			success : function(result) {
				console.log(result);
				if (result === "1") {
					showAlert("회원 가입을 축하합니다!");
					setTimeout(function() {
						form.submit();
					}, 2000);
				} else {
					showAlert("회원 가입에 실패했습니다. 중복을 확인해주세요.");
					return;
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
	background-color: #f8f9fa;
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

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-weight: 500;
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

.btn-primary {
	background-color: #242424;
	border-color: #3f5de7;
}

.btn-primary:hover {
	background-color: #324b99;
	border-color: #324b99;
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
</style>

</head>
<body>
	<!-- Header Start -->
	<div class="header">
		<jsp:include page="assets/common/include_common_header.jsp" />
	</div>
	<!-- Header End -->

	<div class="container">
		<h2>회원 가입</h2>
		<form action="register.do" name="register" method="post">
			<div class="form-group">
				<label for="uid">아이디</label>
				<div class="input-group">
					<input type="text" id="uid" name="uid" class="form-control">
					<button class="btn btn-primary" type="button"
						onclick="checkDuplicateId()">중복체크</button>
				</div>
			</div>
			<div class="form-group">
				<label for="uPassword">비밀번호</label> <input type="password"
					id="uPassword" name="uPassword" class="form-control">
			</div>
			<div class="form-group">
				<label for="uRePass">비밀번호 확인</label> <input type="password"
					id="uRePass" name="uRePass" class="form-control">
			</div>
			<div class="form-group">
				<label for="uName">이름</label> <input type="text" id="uName"
					name="uName" class="form-control">
			</div>
			<div class="form-group">
				<label for="uPhone">전화번호</label> <input type="text" id="uPhone"
					name="uPhone" class="form-control">
			</div>
			<div class="form-group">
				<label for="uEmail">이메일</label> <input type="text" id="uEmail"
					name="uEmail" class="form-control">
			</div>
			<div class="form-group">
				<label for="uAddress">주소</label> <input type="text" id="uAddress"
					name="uAddress" class="form-control">
			</div>
			<input type="button" class="button" value="회원가입"
				onclick="registerCheck()">
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>

</html>