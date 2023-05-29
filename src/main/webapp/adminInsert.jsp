<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<style>
	.table-container {
        margin-top: 150px;
        margin-left: auto;
        margin-right: auto;
        width: 850px;
    }
    .table-container {
        float: right;
    }
    .center-align{
    	text-align: center;
    }
</style>
</head>
<body>

		<h3 class="center-align"> 상품 등록</h3>
		
		<div class="table-container">
		<table>
			<tr>
				<td>
				<input type="file" name="productImage">
				<input type="submit" value="업로드">
				</td>
			</tr>
			<tr>
			<td>
				번호 :<input type="text" name="pCode">
				</td>
			</tr>
			<tr>
			<td>
				브랜드 명 :<input type="text" name="pBrandName">
			</td>
			</tr>
			<tr>
			<td>
				상품 명 :<input type="text" name="pName">
			</td>
			</tr>
			<tr>
			<td>
				가격 :<input type="text" name="pPrice">
			</td>
			</tr>
			<tr>
			<td>
				사이즈 :<input type="text" name="pSize">
			</td>
			</tr>
			<tr>
				<td>
				<input type="submit" value="등록">
				</td>
			</tr>
		
		
		
		</table>
		</div>
</body>
</html>