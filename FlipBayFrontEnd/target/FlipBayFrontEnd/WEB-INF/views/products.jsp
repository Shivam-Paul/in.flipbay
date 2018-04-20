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
<br>
<br>
<br>
<div align="center">
		<table width="1000" border="3" bgcolor="lightblue">
			<tr>
				
				<td><div align="center">Product Name</div></td>
				<td><div align="center">Category Name</div></td>
				<td><div align="center">Supplier Name</div></td>
				<td><div align="center">Product Description</div></td>
				<td><div align="center">Quantity Available</div></td>
				
				<td><div align="center">Product Price</div></td>
				<td colspan="2"><div align="center">View</div></td>
				<%-- <c:if test="${userLoggedIn==true}">
				<td><div align="center">Add To Cart</div></td>
				</c:if> --%>
			</tr>

			<c:forEach var="product" items="${products}">
				<tr>
			
					<td><div align="center">${product.name}</div></td>
					<td><div align="center">${product.category.name}</div>
					<td><div align="center">${product.supplier.name}</div>
					<td><div align="center">${product.description}</div></td>
					<td><div align="center">${product.quantity}</div></td>
					
					<td><div align="center">${product.price}</div></td>

					<td><div align="center">
					<a class="btn btn-lg btn-primary" role="button" href="product/get/?id=${product.id}">
					<span class="glyphicon glyphicon-eye-open ">
					</span></a>
					</div>
					</td>
					<td>
					
					<div align="center">
					<c:if test="${userLoggedIn==true}">
					<form action="cart/add/product" method="post">
					
					<input type="hidden" value="1" name="quantity"  required/>
					<input type="hidden" name="productID" value="${product.id}"/>
					<button type="submit"><span class="glyphicon glyphicon-shopping-cart "></span></button>
					
					</form>
					</c:if>
					</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>



</body>
</html>