<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>결제</title>
</head>
<body>
	<!-- Header Start -->
	<div class="header">
		<jsp:include page="assets/common/include_common_header.jsp"/>
	</div>
	<!-- Header End -->



<!-- 	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	String uName = request.getParameter("uName");
	String uPhone = request.getParameter("uPhone");
	String uAddress = request.getParameter("uAddress");
	String pBrandName = request.getParameter("pBrandName");
	String pSize = request.getParameter("pSize");
	int pcQty = Integer.parseInt(request.getParameter("pcQty"));
	int pPrice = Integer.parseInt(request.getParameter("pPrice"));
	int pStock = Integer.parseInt(request.getParameter("pStock")); -->
	
	<c:set var="users" value="${selectUser}" />

	<div>
		<h2>주문서 작성</h2>
		<hr/>
	</div>
	<div>
		<h3>배송지</h3>
			이름 :${users[0].uName }<br/>
			전화번호 :${users[0].uPhone }<br/>
			주소 :${users[0].uAddress }<br/>
		 <br/>
		 <br/>
	<hr/>
	
	
	</div>
	<div>
		<h3>상품 정보</h3>
			<table border="1">
	  	<tr>
	     	<td rowspan="6" ><img alt="image" src="${content_view.pImage }" width="200" height="200"></td>
		    <td>상품명 :</td>
		    <td> ${content_view.pBrandName }</td>
	  	</tr>
	 	 <tr>
		    <td>사이즈 :</td>
		    <td><%=request.getParameter("pSize") %> </td>
	 	 </tr>
	   	 <tr>
		    <td>상품금액 :</td>
		    <td> ${content_view.pPrice }</td>
		  </tr>
		  <tr>
		    <td>수량 :</td>
		    <td> ${param.pcQty }</td>
		  </tr>
		  <tr>
		    <td>총금액 :</td>
		    <td> ${param.pcQty *content_view.pPrice }</td>
	 	 </tr>
			</table>
		<br/>
		<br/>
		<br/>
<hr/>
		   
	
	</div>
	 <div>
		<h3>결제 정보</h3>
			<input type="radio" name="purchase" value="카드" checked="checked">카드 
			<input type="radio" name="purchase" value="계좌" >계좌
	  <br/>
	  <br/>
<hr/>
	</div> 
	  
			<form action="purchase.do?pCode=${content_view.pCode}&pcQty=${param.pcQty }&pSize=${param.pSize}" method="post">
			<input type="submit" value="결제">
	 <br/>
	 <br/>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>