<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
</head>
<body>
	<form action="">
    <table border="" style="margin-left: auto; margin-right: auto;">
        <caption><h4>상품 세부사항</h4></caption>
        <tr>
            <td>
                <dl>		
                    <dd><img alt="image" src="${content_view.pImage }" width="200" height="200"></dd>
                    <dd>pCode</dd>
                    <dd><input type="text" name="pCode" value="${content_view.pCode}" readonly="readonly"></dd>
                    <dd>브랜드명</dd>
                    <dd><input type="text" name="pBrandName" value="${content_view.pBrandName}" readonly="readonly"></dd>
                    <dd>상품명</dd>
                    <dd><input type="text" name="pName" value="${content_view.pName}" readonly="readonly"></dd>
                    <dd>가격</dd>
                    <dd><input type="text" name="pPrice" value="${content_view.pPrice}" readonly="readonly"></dd>
                    <dd>사이즈</dd>
                    <dd>
                        <select name="pSize">
   						 	<c:forEach items="${list}" var="dtos">
        						<option value="${dtos.pSize}">${dtos.pSize}</option>
    						</c:forEach>
							</select>
                    </dd>
                    <dd>수량</dd>
                    <dd><input type="number" name="pcQty" value="1"></dd>
                </dl>
                
                <dl>
                     <dd><a href="장바구니">장바구니 담기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="purchase.do">바로 주문</a></dd>
                </dl>
</form>
</body>
</html>