<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
    .table-container {
        float: right;
    }
    .center-align{
    	text-align: center;
    }
</style>
   
</head>
<body>
			<h3 class="center-align">상품 목록</h3>
			<br/>
	
	<table>
	<tr>
		<td>
		<a href="adminInsert.jsp">등록</a>
			<a href="">수정</a>
			<a href="">삭제</a>
		</td>
		</tr>
	</table>		
			
	<div class="table-container">
	<table>
		<tr>
			<td>
			<input type="text" name="Search" placeholder="입력하세요."> 
			<input type="button" value="검색">
			</td>
		</tr>
	</table>
	</div>
	<br/>
	<br/>
	
	
	
	
	
	<table>
	<tr>
	<th style="width: 500px;">상품 이미지</th>
	<th style="width: 50px;">번호</th>
	<th style="width: 300px;">브랜드 명</th>
	<th style="width: 300px;">상품 명</th>
	<th style="width: 200px;">가격</th>
	<th style="width: 200px;">사이즈</th>
	</tr>
	
	<c:forEach items="${productList }" var="dto">
		<tr>
			<td>${dto.pImage }</td>	
			<td>${dto.pCode }</td>	
			<td>${dto.pBrandName }</td>	
			<td>${dto.pName }</td>	
			<td>${dto.pPrice }</td>	
		</tr>
	
	</c:forEach>
		<tr>
			

		</tr>
	
	
	</table>
		



</body>
</html>