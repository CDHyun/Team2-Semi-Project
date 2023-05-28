<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>구매 내역</title>
</head>
<body>
	<!-- Header Start -->
	<div class="header">
		<jsp:include page="assets/common/include_common_header.jsp"/>
	</div>
	
	
	<c:set var="pur" value="${PurchaseList}" />
	<!-- Header End -->
	<div>
		<h2>구매 내역</h2>
		<hr/>
	</div>
 		<br/>
		<br/>

	<table border="1">
		<tr>
			<th>상품이미지</th>
			<th>주문 번호</th>
			<th>상품명</th>
			<th>주문 가격</th>
			<th>사이즈</th>
			<th>주문 수량</th>
			<th>주문 일자</th>
		
		</tr>
		<c:forEach items="${PurchaseList}" var="purchaseDto">
		<tr>
			<td><img alt="image" src="${purchaseDto.pImage}" width="200" height="200"></td>
			<td>${purchaseDto.pcNo}</td>
			<td>${purchaseDto.pBrandName}</td>
			<td>${purchaseDto.pPrice}</td>
			<td>${purchaseDto.pSize }</td>
			<td>${purchaseDto.pcQty }</td>
			<td>${purchaseDto.pcInsertDate}</td>
			
		</tr>
		</c:forEach>
</table>

<br/>
<br/>
<hr/>
<form action="index.do">
<input type="submit" value="확인"><br/>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>