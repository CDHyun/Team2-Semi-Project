<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>구매 내역</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        body {
            background-color: #F5F5F5;
        }
        .header {
            padding: 10px;
        }
        .container {
            margin-top: 20px;
        }
        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        table {
            background-color: #FFF;
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #EEE;
        }
        caption {
            font-size: 14px;
            font-style: italic;
            margin-bottom: 10px;
        }
        img {
            max-width: 200px;
            max-height: 200px;
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="header">
    <jsp:include page="assets/common/include_common_header.jsp"/>
</div>
<div class="container">
    <h2 style="text-align: center">구매 내역</h2>
    <table>
        <caption>주문 번호를 클릭하면 해당 상품이 주문 취소됩니다.</caption>
        <tr>
            <th>상품 이미지</th>
            <th>주문 번호</th>
            <th>상품명</th>
            <th>주문 가격</th>
            <th>사이즈</th>
            <th>주문 수량</th>
            <th>주문 일자</th>
        </tr>
        <c:forEach items="${PurchaseList}" var="purchaseDto">
            <tr>
                <td><img alt="image" src="${purchaseDto.pImage}" width="200" height="200"></td>
                <td><a href="purchase_delete.do?pcNo=${purchaseDto.pcNo}">${purchaseDto.pcNo}</a></td>
                <td>${purchaseDto.pBrandName}</td>
                <td>${purchaseDto.pPrice}</td>
                <td>${purchaseDto.pSize}</td>
                <td>${purchaseDto.pcQty}</td>
                <td>${purchaseDto.pcInsertDate}</td>
            </tr>
        </c:forEach>
    </table>
    <form action="index.do">
        <input type="submit" value="확인"><br/>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
