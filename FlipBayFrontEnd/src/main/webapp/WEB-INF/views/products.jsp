<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>

		<table border="3" bgcolor="lightblue">
			<tr>
				
				<td>Product Name</td>
				<td>Product Description</td>
				<td>Product Price</td>
				<td>Actions</td>
			</tr>

			<c:forEach var="product" items="${products}">
				<tr>
			
					<td>${product.name}</td>
					<td>${product.description}</td>
					<td>${product.price}</td>

					<td><a href="product/get/?id=${product.id}">View</a>/ <a
						href="product/cart/add/?productID=${product.id}">Add To Cart</a>
				</tr>
			</c:forEach>
		</table>
	</div>



</body>
</html>