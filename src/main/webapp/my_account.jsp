<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>My Page</title>
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

	function userinfoModify(link) {
		const uid = $('#uid').val();
		const uPassword = $('#uPassword').val();
		const uRePass = $('#uRePass').val();
		const form = document.userinfo
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

		if (uid.trim().length === 0) {
			showAlert("아이디를 입력해주세요.");
			return;
		}

		if (uPassword.trim().length === 0) {
			showAlert("비밀번호를 입력해주세요.");
			return;
		}

		var url = link;
		$("#userinfo").attr("action", url);

		$.ajax({
			type : 'POST',
			url : './UserModifyCommand',
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
				if (result === "0") {
					showAlert("정보 변경 중 오류가 발생하였습니다.")
					return;
				}
				if (result === "1") {
					showAlert("회원 정보가 변경 되었습니다.")
					setTimeout(function() {
						$("#userinfo").submit();
					}, 2000);
					return;
				}
			},
			error : function() {
				showAlert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		});
	}

	function userSecede(link) {
		$('#confirmModal').modal('show');
		$('#cancelBtn').off('click').on('click', function() {
			$('#confirmModal').modal('hide');
		});
		$('#closeBtn').off('click').on('click', function() {
			$('#confirmModal').modal('hide');
		});
		$('#confirmBtn').off('click').on('click', function() {
			// 탈퇴 로직 수행
			const uid = $('#uid').val();
			const uPassword = $('#uPassword').val();
			const uName = $('#uName').val();
			const uPhone = $('#uPhone').val();
			const uEmail = $('#uEmail').val();
			const uAddress = $('#uAddress').val();
			var url = link;
			$("#userinfo").attr("action", url);
			$.ajax({
				type: 'POST',
				url: './JazzUserDeleteCommand',
				data: {
					uid: uid,
				},
				success: function (result) {
					console.log(result);
					if (result === "0") {
						showAlert("탈퇴 중 오류가 발생하였습니다.");
						return;
					}
					if (result === "1") {
						showAlert("회원 탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
						setTimeout(function () {
							$("#userinfo").submit();
						}, 2000);
						return;
					}
				},
				error: function () {
					showAlert("오류가 발생했습니다. 다시 시도해주세요.");
				}
			});
			$('#confirmModal').modal('hide'); // 수정된 부분: 모달 창 닫기
		});
	}

</script>

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
	<div class="header">
		<jsp:include page="assets/common/include_common_header.jsp" />
	</div>

	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog"
		aria-labelledby="confirmModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="confirmModalLabel">확인</h5>
					<button type="button" class="close" id="closeBtn" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>탈퇴하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="cancelBtn" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-danger" id="confirmBtn">탈퇴하기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<h2>My Page</h2>
		<form action="" id="userinfo" name="userinfo" method="post">
			<c:forEach items="${UserInfo}" var="userDto">
				<div class="form-group">
					<label for="uid">아이디</label> <input type="text" id="uid" name="uid"
						value="${userDto.uid}" class="form-control" readonly="readonly">
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
						name="uName" value="${userDto.uName}" class="form-control">
				</div>
				<div class="form-group">
					<label for="uPhone">전화번호</label> <input type="text" id="uPhone"
						name="uPhone" value="${userDto.uPhone}" class="form-control">
				</div>
				<div class="form-group">
					<label for="uEmail">이메일</label> <input type="text" id="uEmail"
						name="uEmail" value="${userDto.uEmail}" class="form-control">
				</div>
				<div class="form-group">
					<label for="uAddress">주소</label> <input type="text" id="uAddress"
						name="uAddress" value="${userDto.uAddress}" class="form-control">
				</div>
				<div class="row justify-content-center">
					<div class="col-auto">
						<input type="button" id="modifyBtn" class="button" value="수정"
							onclick="userinfoModify('userinfoModify.do')">
					</div>
					<div class="col-auto">
						<input type="button" id="deleteBtn" class="button" value="탈퇴하기"
							style="background-color: red;" onclick="userSecede('userSecede.do')">
					</div>
				</div>
			</c:forEach>
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
