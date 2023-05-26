<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<h1>장바구니</h1>
	<form action="">
	<table border="1">
	<tr>
		<th>번호</th>
		<th>브랜드</th>
		<th>제품명</th>
		<th>제품코드</th>
		<th>가격</th>
		<th>수량</th>
	</tr>
		<c:forEach items="${cart}" var="dto">
		<tr>
			<td>${dto.cNo}</td>
			<td>${dto.pBrand}</td>
			<td>${dto.pName}</td>
			<td>${dto.pCode}</td>
			<td>${dto.pPrice}></td>
			<td>${dto.cQty}</td>
		
		</tr>
		</c:forEach>
	<tr>
	<td colspan ="6"><a href="">이전으로</a><input type="submit" value="구매"></td>
	</tr>
	</form>
	</table>
</body>
</html>