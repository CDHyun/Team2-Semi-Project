<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>My Page</title>
    <style>
        body {
            background-color: #f7f7f7;
        }

        .header {
            background-color: #000;
            height: 60px;
            margin-bottom: 20px;
        }

        .header jsp\\:include {
            color: #fff;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            margin-top: 100px;
            padding: 20px;
            background-color: #fff;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .button {
            background-color: #000;
            color: #fff;
            border: none;
            padding: 10px 30px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            display: block;
            margin: 0 auto;
        }
    </style>
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
    
        function userinfoModify() {
       	    const uid = $('#uid').val();
       	    const uPassword = $('#uPassword').val();
       	    const uRePass = $('#uRePass').val();
       	    const form = document.login_form
      
       	 const uid = $('#uid').val();
    	    const form = document.register;
    	    const uPassword = form.uPassword.value
    	    const uRePass = form.uRePass.value
    	    const uName = form.uName.value
    	    const uPhone = form.uPhone.value
    	    const uEmail = form.uEmail.value
    	    const uAddress = form.uAddress.value
    	    const regExpuPass = /^[a-z|A-Z|0-9]*$/;
    	    const regExpuName = /^[a-z|A-Z|가-힣]*$/;
    	    const regExpuPhone = /^\d{3}-\d{3,4}-\d{4}$/;
    		const regExpuEmail = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
    	    const regExpuAddress = /^[가-힣|0-9|a-z|A-Z|-|\s]*$/;
    	    
    	    
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
       	    
       	    
       	    if(uid.trim().length === 0){
       	    	showAlert("아이디를 입력해주세요.");
       	    	return;
       	    }
       	    
       	    if(uPassword.trim().length === 0){
       	    	showAlert("비밀번호를 입력해주세요.");
       	    	return;
       	    }
       	    
       	    
       	    console.log(uid);
       	    console.log(uPassword);
       	    $.ajax({
       	        type: 'POST',
       	        url: './JazzUserLoginCommand',
       	        data: {
       	        	uid: uid,
       	        	uPassword: uPassword
       	        	},
       	        success: function(result) {
       	        	console.log(result);
       	            if(result === "0"){
       	            	showAlert("아이디 혹은 비밀번호를 확인해주세요.")
       	            	return;
       	            }
       	            if(result === "-1"){
       	            	showAlert("탈퇴한 회원입니다.")
       	            	return;
       	            }
       	            if(result === "-2"){
       	            	showAlert("존재하지 않는 회원입니다.")
       	            	return;
       	            }
       	            if(result === "1") {
       	                showAlert("로그인 성공!");
       	                form.submit();
       	            }
       	        },
       	        error: function() {
       	            showAlert("오류가 발생했습니다. 다시 시도해주세요.");
       	        }
       	    });
        }
    </script>
</head>
<body>
<div class="header">
    <jsp:include page="assets/common/include_common_header.jsp"/>
</div>

<div class="container">
    <h2>My Page</h2>
    <form action="modify" name="register" method="post">
        <c:forEach items="${UserInfo}" var="userDto">
            <div class="form-group">
                <label for="uid">아이디</label>
                <input type="text" id="uid" name="uid" value="${userDto.uid}" class="form-control" readonly="readonly">
            </div>
            <div class="form-group">
                <label for="uPassword">비밀번호</label>
                <input type="password" id="uPassword" name="uPassword" class="form-control">
            </div>
            <div class="form-group">
                <label for="uRePass">비밀번호 확인</label>
                <input type="password" id="uRePass" name="uRePass" class="form-control">
            </div>
            <div class="form-group">
                <label for="uName">이름</label>
                <input type="text" id="uName" name="uName" value="${userDto.uName}" class="form-control">
            </div>
            <div class="form-group">
                <label for="uPhone">전화번호</label>
                <input type="text" id="uPhone" name="uPhone" value="${userDto.uPhone}" class="form-control">
            </div>
            <div class="form-group">
                <label for="uEmail">이메일</label>
                <input type="text" id="uEmail" name="uEmail" value="${userDto.uEmail}" class="form-control">
            </div>
            <div class="form-group">
                <label for="uAddress">주소</label>
                <input type="text" id="uAddress" name="uAddress" value="${userDto.uAddress}" class="form-control">
            </div>
            <input type="button" class="button mx-auto" value="수정" onclick="userinfoModify()">
        </c:forEach>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
