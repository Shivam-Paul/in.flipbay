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


<table>
<tr>
<td> Product Name </td>
<td> Product Price </td>
<td> Product Quantity </td>
<td> Subtotal </td>


<c:forEach var="cart" items="${userCart}">

<img alt="" src="${imageDirectory}${product.id}.png"/>
<tr>
<td> ${cart.productName} </td>
<td> ${cart.price} </td>
<td> ${cart.quantity} </td>
<td> ${(cart.price)*(cart.quantity)} </td>

</c:forEach>
<tr> <td> Grand Total </td> 
<td> ${grandTotal}</td>
</tr>
</table>


</body>
</html>