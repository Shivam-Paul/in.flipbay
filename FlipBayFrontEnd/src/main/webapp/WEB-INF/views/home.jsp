<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

form {
	border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>

</head>
<body>
<%-- 	<c:if test="${isAdmin==true}">
		<a href="/FlipBayFrontEnd/">Admin Home</a>
	</c:if>
	<a href="/FlipBayFrontEnd/">Home</a>
	<c:if test="${userLoggedIn==true}">
	<div align="right">
	<a href="editProfile">Edit Profile</a>
		Logged in as ${welcomeMessage} <a href="logout"> Logout </a><br>
		MyCart(${cartSize})
		
	</div>
	</c:if>
 --%>	
	<c:if test="${userLoggedIn==true}">
</c:if>
	${errorMessage}
	${validSecurityAnswer}
    ${invalidSecurityAnswer}
    ${passwordChanged}
	<br>
	 <jsp:include page="loginHeader.jsp"></jsp:include> 
	<%--  <div style="background-color : #00FF00;color:red;">
	 <center >
		<h2>Welcome to FlipBay</h2>
			Welcome: ${welcomeMessage} 
		
	</center>
	</div> --%>
	 	<%-- <c:if test="${userLoggedIn!=true}">

		<a href="login"> Login</a>
		<a href="registration"> Register</a>
	</c:if>
 --%>
	<hr color="blue" size="5">

	<jsp:include page="product-menu.jsp"></jsp:include>


	<c:if test="${isUserClickedLogin==true}">
		<jsp:include page="login.jsp"></jsp:include>
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

</body>

</html>