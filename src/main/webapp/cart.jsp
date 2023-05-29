<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>장바구니</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function submitForm(link) {
            var pcQty = "${dto.cQty }";
            var pCode = "${dto.pCode}";
            var pSize = "${dto.pSize}";

            var url = link + "?pCode=" + encodeURIComponent(pCode) + "&pSize=" + encodeURIComponent(pSize) + "&pcQty=" + encodeURIComponent(pcQty);

            $("#linkValue").val(url);
            $("#purchaseForm").attr("action", url);
            $("#purchaseForm").submit();
        }
       </script>

 <style>
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 999;
            background-color: #000;
            color: #fff;
            padding: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .body {
            margin-top: 200px;
        }

        table {
            border: 1px solid #000;
            margin-left: auto;
            margin-right: auto;
        }

        caption {
            font-size: 20px;
            text-align: center;
            margin-bottom: 20px;
        }

        dl {
            padding: 20px;
        }

        dt {
            font-weight: bold;
        }

        dd {
            margin-top: 10px;
        }

        button {
            margin-top: 10px;
        }
        
    </style>
</head>
<body>

<!-- Header Start -->
	<div class="header">
		<jsp:include page="assets/common/include_common_header.jsp"/>
	</div>
	<!-- Header End -->
	
	
	<c:set var="users" value="${selectUser}" />
	
	
	
	<h1>장바구니</h1>
	<form class="body" id="purchaseForm" action="purchase_info.do" method="post">
	<table border="1">
	<tr>
		<th>번호</th>
		<th>브랜드</th>
		<th>제품명</th>
		<th>가격</th>
		<th>수량</th>
		<th>사이즈</th>
	</tr>
		<c:forEach items="${cart}" var="dto">
		<tr>
			<td>${dto.cNo}</td>
			<td>${content_view.pBrandName }</td>
			<td>${content_view.pName }</td>
			<td>${content_view.pPrice }</td>
			<td>${param.pcQty }</td>
			<td>${param.pSize } </td>
		
		</tr>
		</c:forEach>
	<tr>
	<td colspan ="6"><a href="javascript:history.back()">이전으로</a><input type="button" value="구매" onclick="submitForm('purchase_info.do')"></td>
	</tr>
	</table>
	</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>