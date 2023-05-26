<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<i><h3>Shoes</h3></i>
	
	<table border="1">
		<tr>
			<th>image</th><th>pBrandName</th><th>pName</th><th>pPrice</th>
		</tr>
		<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.image}</td>
				<td>${dto.pBrandName}</td>
				<td>${dto.pName}</td>
				<td>${dto.pPrice}</td>
			</tr>
		</c:forEach>		
	</table>
</body>
</html>