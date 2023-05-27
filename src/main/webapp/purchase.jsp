<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
</head>
<body>
<%

	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	String uName = request.getParameter("uName");
	String uPhone = request.getParameter("uPhone");
	String uAddress = request.getParameter("uAddress");
	String pBrandName = request.getParameter("pBrandName");
	String pSize = request.getParameter("pSize");
	String pcQty = request.getParameter("pcQty");
	String pPrice = request.getParameter("pPrice");
	
	

%>


<form action="index.jsp" method="post">
<input type="submit" value="Home"><%=uid %>고객님 
</form>
<form action="mypage.jsp" method="post">
<input type="submit" value="My Page">
</form>
<form action="index.jsp" method="post">
<input type="submit" value="Logout">
</form>
<br/>
<br/>

	<div>
		<h2>주문서 작성</h2>
		<hr/>
	</div>
	<div>
		<h3>배송지</h3>
		이름 :${uName }<br/>
		전화번호 :${uPhone }<br/>
		주소 :${uAddress }<br/>
		<%
		session.invalidate(); 
		%>
		 <br/>
		  <br/>
	<hr/>
	
	
	</div>
	<div>
		<h3>상품 정보</h3>
		<table border="1">
  <tr>
    <td rowspan="6" >이미지</td>
    <td>상품명 :</td>
    <td> ${pBrandName }</td>
  </tr>
  <tr>
    <td>사이즈 :</td>
    <td> ${pSize }</td>
  </tr>
  <tr>
    <td>상품금액 :</td>
    <td> ${pPrice }</td>
  </tr>
  <tr>
    <td>수량 :</td>
    <td> ${pcQty }</td>
  </tr>
  <tr>
    <td>총금액 :</td>
    <td> ${pSize }</td>
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
	  
	<form action="purchase_check.jsp" method="post">
	<input type="submit" value="결제">
	 <br/>
	  <br/>
</form>


</body>
</html>