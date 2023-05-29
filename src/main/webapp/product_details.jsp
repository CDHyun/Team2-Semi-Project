<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Details</title>

    <style>
        body {
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .product-image {
            width: 200px;
            height: 200px;
            margin-bottom: 20px;
        }

        .product-details {
            margin-bottom: 20px;
        }

        .product-details h4 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .product-details label {
            font-weight: bold;
        }

        .product-details input[type="text"],
        .product-details input[type="number"],
        .product-details select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .product-buttons {
            display: flex;
            justify-content: space-between;
        }

        .product-buttons button {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .product-buttons button.addToCart {
            background-color: #007bff;
            border: none;
        }

        .product-buttons button.buyNow {
            background-color: #28a745;
            border: none;
        }
    </style>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function submitForm(link) {
            var pcQty = $('#pcQty').val();
            var pCode = "${content_view.pCode}";
            var pSize = $('#pSize').val();

            var url = link + "?pCode=" + encodeURIComponent(pCode) + "&pSize="
                + encodeURIComponent(pSize) + "&pcQty="
                + encodeURIComponent(pcQty);

            $("#linkValue").val(url);
            $("#myForm").attr("action", url);
            $("#myForm").submit();
        }

        function addToCart(link) {
            var pcQty = $('#pcQty').val();
            var pCode = "${content_view.pCode}";
            var pSize = $('#pSize').val();
            console.log(pSize);

            var url = link + "?pCode=" + encodeURIComponent(pCode) + "&pSize="
                + encodeURIComponent(pSize) + "&pcQty="
                + encodeURIComponent(pcQty);

            $("#linkValue").val(url);
            $("#myForm").attr("action", url);
            $("#myForm").submit();
        }
    </script>
</head>

<body>
<!-- Header Start -->
<div class="header">
    <jsp:include page="assets/common/include_common_header.jsp"/>
</div>
<!-- Header End -->

<div class="container">
    <form id="myForm" action="" method="post">
        <div class="product-details">
            <h4>상품 세부사항</h4>
            <img alt="image" src="${content_view.pImage}" class="product-image"><br/>
            <label>pCode</label>
            <input type="text" name="pCode" value="${content_view.pCode}" readonly="readonly">
            <label>브랜드명</label>
            <input type="text" name="pBrandName" value="${content_view.pBrandName}" readonly="readonly">
            <label>상품명</label>
            <input type="text" name="pName" value="${content_view.pName}" readonly="readonly">
            <label>가격</label>
            <input type="text" name="pPrice" value="${content_view.pPrice}" readonly="readonly">
            <label>사이즈</label>
            <select id="pSize" name="pSize">
                <c:forEach items="${list}" var="dtos">
                    <option value="${dtos.pSize}">${dtos.pSize}</option>
                </c:forEach>
            </select>
            <label>수량</label>
            <input type="number" id="pcQty" name="pcQty" value="1">
        </div>

        <div class="product-buttons">
            <button type="button" class="addToCart" onclick="addToCart('cart.do')">장바구니에 담기</button>
            <button type="button" class="buyNow" onclick="submitForm('purchase_info.do')">바로 주문</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
