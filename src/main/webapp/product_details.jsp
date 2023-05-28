<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script>
    function submitOrder() {
        var pcQty = document.getElementById("quantity").value;
        var pCode = "${content_view.pCode}";
        var pSize = "${dtos.pSize}";

        var url = "purchase.do?pCode=" + encodeURIComponent(pCode) + "&pSize=" + encodeURIComponent(pSize) + "&pcQty=" + encodeURIComponent(pcQty);
        window.location.href = url;
    }
</script>
<meta charset="UTF-8">
<title>Details</title>

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
	
	
	<form action="" method="get">
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
                     <dd><a href="cart.do">장바구니 담기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="purchase.do" onclick="submitOrder()">바로 주문</a></dd>
                </dl>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>