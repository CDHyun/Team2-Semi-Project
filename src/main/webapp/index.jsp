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


<form action="product_details.jsp" method="post">

<table border="" style="border: 1px solid black; margin-left: auto; margin-right: auto;">
  <caption>이미지 클릭 시 상세페이지로 이동합니다.</caption>
    <tr>
        <th>pImage</th>
        <c:forEach items="${list}" var="dto">
            <td>
                <a href="product_details.jsp">
                    <img alt="image" src="${dto.pImage}" width="100" height="100"><br/>
                    
                </a>
            </td>
        </c:forEach>
    </tr>
    <tr>
        <th>pBrandName</th>
        <c:forEach items="${list}" var="dto">
            <td>${dto.pBrandName}</td>
        </c:forEach>
    </tr>
    <tr>
        <th>pName</th>
        <c:forEach items="${list}" var="dto">
            <td>${dto.pName}</td>
        </c:forEach>
    </tr>
    <tr>
        <th>pPrice</th>
        <c:forEach items="${list}" var="dto">
            <td>${dto.pPrice}</td>
        </c:forEach>
    </tr>
</table>

<input type="hidden" name="pCode" value="${content_view.pCode}">
</form>
</body>
</html>