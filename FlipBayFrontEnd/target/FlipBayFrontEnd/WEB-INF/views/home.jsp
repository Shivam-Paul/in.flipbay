<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="http://localhost:8080/FlipBayFrontEnd/">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

	
	<br>
	 <jsp:include page="loginHeader.jsp"></jsp:include> 
	
	<hr color="blue" size="5">

	<%-- <jsp:include page="product-menu.jsp"></jsp:include> --%>
	

<c:if test="${isUserClickedHome==true}">
		<jsp:include page="carousal.jsp"></jsp:include>
	</c:if>

	
	<c:if test="${isUserClickedRegister==true}">
		<jsp:include page="registration.jsp"></jsp:include>
	</c:if>
	<c:if test="${isUserClickedForgotPassword==true}">
		<jsp:include page="forgotPassword.jsp"></jsp:include>
	</c:if>
	<c:if test="${isUserClickedSecurityQues==true}">
		<jsp:include page="securityQues.jsp"></jsp:include>
	</c:if>
	<c:if test="${isAdmin==true}">
		<jsp:include page="admin/adminHome.jsp"></jsp:include>
	</c:if>
	<c:if test="${isUserClickedChangePassword==true}">
		<jsp:include page="changePassword.jsp"></jsp:include>
	</c:if>
	<c:if test="${isUserClickedSearchProducts==true}">
		<jsp:include page="searchedProducts.jsp"></jsp:include>
	</c:if>
	<c:if test="${isUserClickedEditProfile==true}">
		<jsp:include page="editProfile.jsp"></jsp:include>
	</c:if>
	<c:if test="${isUserClickedViewAllProducts==true}">
		<jsp:include page="products.jsp"></jsp:include>
	</c:if>
	<c:if test="${isUserSelectedAProduct==true}">
		<jsp:include page="selectedProduct.jsp"></jsp:include>
	</c:if>
	<c:if test="${isUserClickedMyCart==true}">
		<jsp:include page="cart.jsp"></jsp:include>
	</c:if>
	<c:if test="${isUserClickedCheckout==true}">
		<jsp:include page="shippingAddress.jsp"></jsp:include>
	</c:if>
	<c:if test="${isUserFilledShippingAddress==true}">
		<jsp:include page="billing.jsp"></jsp:include>
	</c:if>
		<c:if test="${isUserClickedAbout==true}">
		<jsp:include page="aboutUs.jsp"></jsp:include>
	</c:if>
		<c:if test="${isUserClickedContact==true}">
		<jsp:include page="contactUs.jsp"></jsp:include>
	</c:if>
	<br>
	<br>
	<hr>
	<hr>
	
	<jsp:include page="footer.jsp"></jsp:include>
	

</body>

</html>