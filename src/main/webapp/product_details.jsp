<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <dd><img alt="image" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2F20150810_18%2Fdrog7_1439181539344IL1RU_JPEG%2FIMG_3593.JPG&type=sc960_832" width="200" height="200"></dd>
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
                            <option value=""></option>
                            <option value=""></option>
                            <option value=""></option>
                            <option value=""></option>
                        </select>
                    </dd>
                    <dd>수량</dd>
                    <dd><input type="number" name="pcQty" value="1"></dd>
                </dl>
                
                <dl>
                     <dd><a href="장바구니">장바구니 담기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="결제">바로 주문</a></dd>
                </dl>
                     

</body>
</html>