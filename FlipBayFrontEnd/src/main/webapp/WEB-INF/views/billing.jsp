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
<div align="left">
<a class="btn btn-lg btn-primary" href="home" role="button">Continue Shopping</a>

</div>
<div align="center">
<b><h3>Thank you for shopping with us!</h3></b>
</div>

<br>
<div align="center">
<table height="500" width="1000" border="5px">
<tr><td colspan="4"><div align="center">
<h1>Your Bill:</h1></div></td>
</tr>

<tr>
<td colspan="2">
<div align="center">
<h3> FlipBay.com </h3><br>
Address: Niit, Fun City Mall <br>
Plot No. - 2, NIT Sector-21B<br>
Faridabad(121002)<br>
Haryana, India
</div>
</td>
<td colspan="2">
<div align="center"> 

<h3>Shipping Address:</h3>
${shippingAddress.houseNumber} <br>
${shippingAddress.street}<br>
${shippingAddress.city}<br>
${shippingAddress.state},
${shippingAddress.country}<br>
${shippingAddress.pincode}

</div>
</td>

</tr>

<tr>
<th> <div align="center">Product Name</div></th>
<th> <div align="center">Quantity</div></th>
<th> <div align="center">Price</div></th>
<th> <div align="center">Total</div></th>
</tr>


<c:forEach var="userCartItems" items="${myCart}">
<tr align="center">


<td> <div align="center">${userCartItems.productName} </div></td>
<td> <div align="center">${userCartItems.quantity} </div></td>


 <td><div align="center"> ${userCartItems.price}</div> </td>

 <td><div align="center"> ${userCartItems.subTotal} </div></td>

</tr>

</c:forEach>
<tr>

<th colspan="3"> <div align="center">Grand Total</div></th>


<th><div align="center">${grandTotal}</div></th>

</tr>
</table> 
</div>
<br>
<div align="center">
<a class="btn btn-lg btn-primary" href="home" role="button">Continue Shopping</a>

</div>

</body>
</html>