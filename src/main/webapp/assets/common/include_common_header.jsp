<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<div class="d-flex align-items-center justify-content-between">
			<!-- 이미지와 다른 요소들을 수평 정렬 -->
			<div>
				<a href="index.do"><img alt=""
					src="https://play-lh.googleusercontent.com/10RJI8Gb86U7d14fwtWpINZEXqRJLv7pldQIojv8u-PD5qwl-EKrHq8yvEJuwX1f8g"
					width="100"></a>
			</div>
			<ul class="navbar-nav ml-auto">
				<!-- 다른 요소들을 오른쪽으로 정렬 -->
				<li class="nav-item"><a class="nav-link" href="index.do">Home</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">Brand</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul></li>
				<c:if test="${empty sessionScope.SUID}">
					<li><a class="nav-link" href="login_form.jsp">Login</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.SUID}">
					<li><a class="nav-link" href="my_account.do">My Page</a></li>
					<li><a class="nav-link" href="purchase_Check.do">PurchaseHistory</a></li>
					<li><a class="nav-link" href="logOut.do">LogOut</a></li>
					</c:if>
			</ul>
		</div>
		<form action="index.do" method="get"
			class="d-flex justify-content-center mt-4 align-items-center">
			<!-- 가운데 정렬 및 수직 가운데 정렬을 위해 align-items-center 클래스 추가 -->
			<div class="input-group text-center">
				<!-- 검색 폼을 input 그룹으로 감싸기 -->
				<select name="query" class="form-select" style="width: 150px;">
					<!-- select 태그 창의 너비 조정 -->
					<option value="pBrandName">브랜드명</option>
					<option value="pName" selected="selected">상품명</option>
				</select> <input type="text" name="content" size="30" class="form-control"
					style="width: 200px;">
				<!-- 검색 창의 너비 조정 -->
				<button type="submit" class="btn btn-dark">검색</button>
				<!-- 검색 버튼의 색깔을 검정으로 변경 -->
			</div>
		</form>
	</div>
</nav>



