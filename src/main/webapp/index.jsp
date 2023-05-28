<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
            width: 100%;
        }

        caption {
            font-size: 20px;
            text-align: center;
            margin-bottom: 20px;
        }

        th, td {
            text-align: center;
            padding: 10px;
        }
    </style>
</head>

<body>
    <!-- Header Start -->
    <div class="header">
        <jsp:include page="assets/common/include_common_header.jsp" />
    </div>
    <!-- Header End -->

    <div class="body">
        <div class="container">
            <form action="index.do" method="get" class="mb-4">
                <div class="row justify-content-center">
                    <div class="col-md-4">
                        <div class="input-group">
                            <select name="query" class="form-select">
                                <option value="pBrandName">브랜드명</option>
                                <option value="pName" selected="selected">상품명</option>
                            </select>
                            <input type="text" name="content" size="30" class="form-control">
                            <button type="submit" class="btn btn-primary">검색</button>
                        </div>
                    </div>
                </div>
            </form>

            <table>
                <caption>이미지 클릭 시 상세 페이지로 이동합니다.</caption>
                <tr>
                    <th>상품</th>
                    <c:forEach items="${list}" var="dto">
                        <td>
                            <a href="product_details.do?pCode=${dto.pCode}">
                                <img alt="image" src="${dto.pImage}" width="100" height="100">
                            </a>
                            <p>${dto.pBrandName}</p>
                            <p>${dto.pName}</p>
                            <p>${dto.pPrice}</p>
                        </td>
                    </c:forEach>
                </tr>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
