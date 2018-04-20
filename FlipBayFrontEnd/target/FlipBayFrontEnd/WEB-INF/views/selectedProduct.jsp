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
<div align="center">
<table width= "80%" height="250" border="5">
<tr>
<td rowspan="6">
<div style="padding-left:80PX" align="left">
<b>Product Name: ${selectedProduct.name}</b>
<br>
<img width= "180" height="180" alt="error" src="resources/images/products/${selectedProduct.name}.png"/>
</div>
</td>
<td rowspan="6">
<div style="padding-left:80PX" align="left">
<b>
Product Category: ${selectedProduct.category.name}</b>
<br>
<img width= "180" height="180" alt="error" src="resources/images/categories/${selectedProduct.category.name}.png"/>
</div>
</td>
<td rowspan="6">
<div style="padding-left:80PX" align="left">
<b>
Product Supplier: ${selectedProduct.supplier.name}</b>
<br>
<img width= "180" height="180" alt="error" src="resources/images/suppliers/${selectedProduct.supplier.name}.png"/>
</div>
</td>

</tr>
</table>
</div>

<br>

<div align="center">
<table width="80%" border="5">
<tr>
<td>
<b>
Product Name:</b> ${selectedProduct.name}
</td>
</tr>
<tr>
<td>
<b>
Product Price:</b> ${selectedProduct.price}
</td>
</tr>
<tr>
<td>
<b>
Product Description:</b> ${selectedProduct.description}
</td>
</tr>
<tr>
<td>
<b>
Quantity Available:</b> ${selectedProduct.quantity}
</td>
</tr>
<tr>
<tr>
<td>
<b>
Product Category:</b> ${selectedProduct.category.name}
</td>
</tr>
<tr>
<tr>
<td>
<b>
Product Supplier:</b> ${selectedProduct.supplier.name}
</td>
</tr>
<tr>
<td>


	<c:if test="${userLoggedIn==true}">
	<form action="cart/add/product" method="post">
	<!-- <b>
Quantity:</b>  -->
<input type="hidden" value="1" name="quantity"  required/>

<input type="hidden" value="${selectedProduct.id}" name="productID" required/>
	<button type="submit"><span class="glyphicon glyphicon-shopping-cart "> Add To Cart</span></button>

</form>
</c:if>
</td>
</tr>
</table>

</div>	

</body>
</html>