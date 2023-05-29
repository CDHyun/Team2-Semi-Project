<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function showAlert(message) {
			const alertBox = document.createElement('div');
			alertBox.className = 'alert alert-dark';
			alertBox.innerText = message;

			const container = document.querySelector('.container');
			container.appendChild(alertBox);

			setTimeout(function() {
				alertBox.remove();
			}, 3000);
		}

		function payment() {
			
		    var pCode = '<%=request.getParameter("pCode")%>';
		    var pcQty = '<%=request.getParameter("pcQty")%>';
		    var pSize = '<%=request.getParameter("pSize")%>';
			
			$.ajax({
				type : 'POST',
				url : './JazzPaymentCommand',
				data : {
					pCode : pCode,
					pcQty : pcQty,
					pSize : pSize
				},
				success : function(result) {
					console.log(result);
					if (result === "1") {
						showAlert("재고가 부족합니다.");
						return;
					}
					if (result === "0") {
						showAlert("성공");
						$("#purchase").submit();
					}
				},
				error : function() {
					showAlert("오류가 발생했습니다. 다시 시도해주세요.");
				}
			});
		}
	</script>
<meta charset="UTF-8">
<title>결제</title>
<style type="text/css">
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

.container {
	max-width: 600px;
	margin: 50px auto;
	padding: 30px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.card-img-top {
	width: 200px;
	height: 200px;
	object-fit: cover;
	border-radius: 5px;
}

.btn-primary {
	background-color: #000;
	border-color: #000;
}

.alert {
	margin-top: 20px;
	border-radius: 5px;
}
</style>
</head>
<body>
	<!-- Header Start -->
	<div class="header">
		<jsp:include page="assets/common/include_common_header.jsp" />
	</div>
	<!-- Header End -->

	<c:set var="users" value="${selectUser}" />

	<div class="container">
		<h2>주문서 작성</h2>
		<hr />

		<div>
			<h3>배송지</h3>
			이름: ${users[0].uName}<br /> 전화번호: ${users[0].uPhone}<br /> 주소:
			${users[0].uAddress}<br />
			<br />
			<hr />
		</div>

		<div>
			<h3>상품 정보</h3>
			<table class="table">
				<tr>
					<td style="width: 200px;"><img alt="image"
						src="${content_view.pImage}" class="card-img-top"></td>
					<td>
						<p>
							<strong>상품명:</strong> ${content_view.pBrandName}
						</p>
						<p>
							<strong>사이즈:</strong>
							${param.pSize}</p>
						<p>
							<strong>상품금액:</strong> ${content_view.pPrice}
						</p>
						<p>
							<strong>수량:</strong> ${param.pcQty}
						</p>
						<p>
							<strong>총금액:</strong> ${param.pcQty * content_view.pPrice}
						</p>
					</td>
				</tr>
			</table>
			<hr />
		</div>

		<div>
			<h3>결제 정보</h3>
			<input type="radio" name="purchase" value="카드" checked="checked">카드
			<input type="radio" name="purchase" value="계좌">계좌 <br />
			<br />
			<hr />
		</div>
		<form id="purchase" action="purchase_Check.do" name="purchase">
			<input type="button" class="btn btn-primary" value="결제" onclick="payment()">
		</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>
