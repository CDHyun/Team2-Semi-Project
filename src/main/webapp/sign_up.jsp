<%@page import="com.javalec.shop.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
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
	    const regExpAdmin = /^(admin|root|insert|update|delete|select)$/
	    if (regExpAdmin.test(uid.toLowerCase())) {
	        showAlert("Java Fundmental 규약에 어긋나는 아이디는 사용 불가능합니다.");
	        form.uid.select();
	        return;
	    }
	    console.log(uid);
	    $.ajax({
	        type: 'POST',
	        url: './userRegisterCheckCommand',
	        data: { uid: uid },
	        success: function(result) {
	        	console.log(result);
	            if (result === "0") {
	                showAlert("사용할 수 있는 아이디입니다.");
	            } else {
	                showAlert("사용할 수 없는 아이디입니다.");
	            }
	        },
	        error: function() {
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
	    const regExpAdmin = /^(admin|root|insert|update|delete|select)$/
	    if (regExpAdmin.test(uid.toLowerCase())) {
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
	    

	    if (regExpAdmin.test(uid.toLowerCase())) {
	        showAlert("Java Fundmental 규약에 어긋나는 아이디는 사용 불가능합니다.");
	        form.uid.select();
	        return;
	    }
	    
	    if (uid.trim().length === 0) {
	        showAlert("아이디를 입력해주세요.");
	        return;
	    }
		
		if(!regExpuid.test(uid)){
			showAlert("아이디는 영문&숫자만 사용 가능합니다.")
			form.uid.select();
			return
		}
		
	    if (uPassword.trim().length === 0) {
	        showAlert("비밀번호를 입력해주세요.");
	        return;
	    }
		if(!regExpuPass.test(uPassword)){
			showAlert("비밀번호는 영문&숫자만 사용 가능합니다.")
			form.uPassword.select();
			return
		}
		
	    if (uRePass.trim().length === 0) {
	        showAlert("비밀번호 확인을 입력해주세요.");
	        return;
	    }
		if(!regExpuPass.test(uRePass)){
			showAlert("비밀번호는 영문&숫자만 사용 가능합니다.")
			form.uRePass.select();
			return
		}
		if(uPassword.trim() !== uRePass.trim()){
	        showAlert("비밀번호가 일치하지 않습니다.");
			form.uRePass.select();
			return
		}
		
	    if (uName.trim().length === 0) {
	        showAlert("이름을 입력해주세요.");
	        return;
	    }
		if(!regExpuName.test(uName)){
			showAlert("이름은 한글과 영문만 입력 할 수 있습니다.")
			form.uName.select();
			return
		}
		
	    if (uPhone.trim().length === 0) {
	        showAlert("전화번호를 입력해주세요.");
	        return;
	    }
		if(!regExpuPhone.test(uPhone)){
			showAlert("전화번호를 확인해주세요.\n ex)010-1234-5678")
			form.uPhone.select();
			return
		}
		
	    if (uEmail.trim().length === 0) {
	        showAlert("이메일을 입력해주세요.");
	        return;
	    }
		if(!regExpuEmail.test(uEmail)){
			showAlert("이메일 형식을 확인해주세요. \n ex) id@domain.com")
			form.uEmail.select();
			return
		}
		
	    if (uAddress.trim().length === 0) {
	        showAlert("주소를 입력해주세요.");
	        return;
	    }
		if(!regExpuAddress.test(uAddress)){
			showAlert("주소는 영문/한글/숫자/- 만 입력 가능합니다.")
			form.uAddress.select();
			return
		}
	    
	    console.log(uid);
	    $.ajax({
	        type: 'POST',
	        url: './JazzUserRegisterCommand',
	        data:
	        {
	        	uid: uid,
	        	uPassword: uPassword,
	        	uName: uName,
	        	uPhone: uPhone,
	        	uEmail: uEmail,
	        	uAddress: uAddress
	        },
	        success: function(result) {
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
	        error: function() {
	            showAlert("오류가 발생했습니다. 다시 시도해주세요.");
	        }
	    });
		
	    
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
			아이디 <input type="text" id="uid" name="uid" value="${sessionScope.UID}">
			<input type="button" value="중복체크" onclick="checkDuplicateId()">
		</div>
		<div class="form-group">
			비밀번호 <input type="password" name="uPassword" value="${sessionScope.UPASSWORD}">
		</div>
		<div class="form-group">
			비밀번호 확인 <input type="password" name="uRePass">
		</div>
		<div class="form-group">
			이름 <input type="text" name="uName" value="${sessionScope.UNAME}">
		</div>
		<div class="form-group">
			전화번호 <input type="text" name="uPhone" value="${sessionScope.UPHONE}">
		</div>
		<div class="form-group">
			이메일 <input type="text" name="uEmail" value="${sessionScope.UEMAIL}">
		</div>
		<div class="form-group">
			주소 <input type="text" name="uAddress" ${sessionScope.UADDRESS}>
		</div>
		<input type="button" class="button" value="회원가입" onclick="registerCheck()">
	</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
