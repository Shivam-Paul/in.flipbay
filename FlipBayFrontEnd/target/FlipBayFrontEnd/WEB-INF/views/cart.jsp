<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
.button { 
    border: none;
    text-align: center;
    cursor: pointer;
    width: 150px;
    height: 100px;
}

.button:hover {
    background-color: green;
}
</style>
</head>
<body>



<br>
<br>
<div align="center">
<table width="1000">
<tr>
<td>
<div  align="left">
<button class="button"><a href="cart/deleteWholeCart" > Remove Whole Cart</a></button>
</div>
</td>

<td>
 <div  align="right">
<button class="button"><a href="cart/fillShippingAddress"> Checkout </a></button>
</div>
</td>
</tr>
</table>
</div>

<br>
<div align="center">
<table  width="1000" border="5">
<tr>
<th><div align="center"> Product Name</div> </th>
<th><div align="center"> Product Image </div></th>
<th><div align="center"> Product Quantity </div></th>
<th><div align="center"> Product Price </div></th>
<th><div align="center"> Sub Total </div></th>
<th><div align="center"> Remove Product </div></th>

</tr>
<c:forEach var="userCartItems" items="${myCart}">
<tr>


<td> <div align="center">${userCartItems.productName} </div></td>
<td><div align="center"><img alt="" src="resources/images/products/${userCartItems.productName}.png" width="100" height="100"/></div></td>
<td> <div align="center"> 
<form action="cart/update/${userCartItems.cartItemID}">
<input type="number" value="${userCartItems.quantity}" name="count" min="1" max="${userCartItems.avlQuantity}"
							class="form-control text-center" >
							<input hidden="true" type="number" name="productID" value="${userCartItems.productID}">
							<button type="submit">  
							<span class="glyphicon glyphicon-refresh"></span>
							</button>
							</form></div></td>
 <td> <div align="center">${userCartItems.price} </div></td>

							
<td><div align="center"> ${(userCartItems.price)*(userCartItems.quantity)} </div></td>
<td><div align="center"> <a href="/FlipBayFrontEnd/cart/delete/${userCartItems.cartItemID}">Remove</a></div></td>
</tr>
</c:forEach>

<tr> <td colspan="4">
<br>
<br>
<div align="center">

<b>Grand Total : </b></div><br> </td>
<td colspan="2">
<br>
<br>
<div align="center">

 ${grandTotal} 
 
 </div>
 <br>
 </td>
</tr>
</table>
</div>


</body>
</html>