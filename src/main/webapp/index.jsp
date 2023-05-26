<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
</head>
<body>
<table border="1" style="border:1px solid black;margin-left:auto;margin-right:auto;">
		<tr>
			<th>pImage</th>
			<th>pBrandName</th>
			<th>pName</th>
			<th>pPrice</th>
		</tr><!-- Dao에서 준list -->
		<c:forEach items="${list }" var="dto">
			<tr>
				<td><img alt="image" src="${dto.pImage }" width="100" height="100"></td>
				<td>${dto.pBrandName }</td>
				<td>${dto.pName }</td>
				<td>${dto.pPrice }</td>
			</tr>
		</c:forEach>		
	
	
	</table>

</body>
</html>