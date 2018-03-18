<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	<%-- <spring:url value="/category/save" var="categoryActionUrl" />
	<form:form action="/category/save" modelAttribute="categoryForm"
		method="POST">

		<div class="container">
			<spring:bind path="categoryName">
				<label><b>Category Name</b></label>
				<form:input type="text" placeholder="Enter Category Name"
					path="categoryName" id="categoryName" required="true" />
			</spring:bind>
			<spring:bind path="categoryID">
				<label><b>Category ID</b></label>
				<form:input type="text" placeholder="Enter Category ID"
					path="categoryID" id="categoryID" required="true" />
			</spring:bind>
			<spring:bind path="categoryDescription">
				<label><b>Category Description</b></label>
				<form:input type="text" placeholder="Enter Category Description"
					path="categoryDescription" id="categoryDescription" />
			</spring:bind>
		</div>
		<div class="container" style="background-color: #f1f1f1">
			<button type="submit">Add Category</button>
		</div>
	</form:form> --%>
	<form action="category/save" 
		method="POST">

		<div class="container">
		<label><b>Category ID</b></label>
				<input type="text" placeholder="Enter Category ID"
					 name="categoryID" required="true" />
		
				<label><b>Category Name</b></label>
				<input type="text" placeholder="Enter Category Name"
					 name="categoryName" required="true" />
			

				
				<label><b>Category Description</b></label>
				<input type="text" placeholder="Enter Category Description"
					 name="categoryDescription" />

		</div>
		<div class="container" style="background-color: #f1f1f1">
			<button type="submit">Add Category</button>
		</div>
	</form>

</body>
</html> 