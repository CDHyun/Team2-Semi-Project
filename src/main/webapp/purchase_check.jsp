<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 내역</title>
</head>
<body>

	<div>
		<h2>구매 내역</h2>
		<hr/>
	</div>
 		<br/>
		<br/>

	<table border="1">
		<tr>
			<th>seq</th>
			<th>상품</th>
			<th>제품 번호</th>
			<th>상품명</th>
			<th>주문 가격</th>
			<th>사이즈</th>
			<th>주문 수량</th>
			<th>주문 일자</th>
		
		</tr>
		<c:forEach items="${PurchaseList}" var="dto">
		<tr>
			<td>${dto.pcno}</td>
			<td><img alt="image" src="${content_view.pImage }" width="200" height="200"></td>
			<td>${dto.pCode}</td>
			<td>${dto.pBrandName}</td>
			<td>${dto.pPrice}</td>
			<td>${dto.pSize}</td>
			<td>${dto.pcQty}</td>
			<td>${dto.pcInsertDate}</td>
			
		</tr>
		</c:forEach>
</table>

<br/>
<br/>
<hr/>
<form action="index.do">
<input type="submit" value="확인"><br/>
</form>


</body>
</html>