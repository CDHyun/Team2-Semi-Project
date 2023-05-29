<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Index Page</title>
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

.body {
	margin-top: 200px;
}

.product-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); /* 이미지 및 텍스트 크기 조정 */
	gap: 20px;
	justify-items: center;
}

.product-item {
	text-align: center;
}

.product-image {
	width: 250px; /* 이미지 크기 조정 */
	height: 250px; /* 이미지 크기 조정 */
	object-fit: cover;
	border-radius: 5px;
}

.product-brand {
	font-weight: bold;
	margin-top: 10px;
}

.product-name {
	margin-top: 5px;
}

.product-price {
	margin-top: 5px;
}

.scrollable-table {
	margin-top: 200px;
	max-height: 1000px;
	overflow-y: auto;
	overflow-x: auto;
}
</style>
</head>

<body>
	<!-- Header Start -->
	<div class="header">
		<jsp:include page="assets/common/include_common_header.jsp" />
	</div>
	<!-- Header End -->



			<div class="scrollable-table">
				<div class="product-grid">
					<c:forEach items="${list}" var="dto">
						<div class="product-item">
							<a href="product_details.do?pCode=${dto.pCode}"> <img
								alt="image" src="${dto.pImage}" class="product-image">
							</a>
							<p class="product-brand">${dto.pBrandName}</p>
							<p class="product-name">${dto.pName}</p>
							<p class="product-price">${dto.pPrice}</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>

</body>
</html>
