<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Index Page</title>

<style>
.header {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 999;
	background-color: #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}
</style>
</head>

<body>


<!-- Header Start -->
	<div class="header">
		<jsp:include page="assets/common/include_common_header.jsp"/>
	</div>
	<!-- Header End -->
	


<div style="display: flex; justify-content: center;">
  <form action="index.do" method="get">
    검색 선택: 
    <select name="query">
      <option value="pBrandName">브랜드명</option>
      <option value="pName" selected="selected">상품명</option>  
    </select>
    <input type="text" name="content" size="30">
    <input type="submit" value="검색">
  </form>
</div><br/><br/><br/><br/>


<form action="product_details.do" method="post">

<table border="" style="border: 1px solid black; margin-left: auto; margin-right: auto;">
  <caption>이미지 클릭 시 상세페이지로 이동합니다.</caption>
    <tr>
        <th>상품</th>
        <c:forEach items="${list}" var="dto">
            <td>
                <a href="product_details.do?pCode=${dto.pCode}">
                    <img alt="image" src="${dto.pImage}" width="100" height="100"><br/>
                    
                </a>
            </td>
        </c:forEach>
    </tr>
    <tr>
        <th>브랜드명</th>
        <c:forEach items="${list}" var="dto">
            <td>${dto.pBrandName}</td>
        </c:forEach>
    </tr>
    <tr>
        <th>상품명</th>
        <c:forEach items="${list}" var="dto">
            <td>${dto.pName}</td>
        </c:forEach>
    </tr>
    <tr>
        <th>가격</th>
        <c:forEach items="${list}" var="dto">
            <td>${dto.pPrice}</td>
        </c:forEach>
    </tr>
</table>

<input type="hidden" name="pCode" value="${dto.pCode}">
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>