<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<div class="container">
    <div class="row">
        <div class="col-md-7">
            <div class="well well-sm">
                <form action="cart/shippingAddress" method="post">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="name">House/Flat Number:</label>
                            <input type="text" class="form-control" name="houseNumber" placeholder="Enter Your House/Flat Number" 
                            required />
                        </div>
                        <div class="form-group">
                            <label for="name">Street Name:</label>
                            <input type="text" class="form-control" name="street" placeholder="Enter Your Street Name" required />
                        </div>
                        <div class="form-group">
                            <label for="name">City:</label>
                            <input type="text" class="form-control" name="city" placeholder="Enter Your City" required />
                        </div>
                        <div class="form-group">
                            <label for="name">State:</label>
                            <input type="text" class="form-control" name="state" placeholder="Enter Your State" required />
                        </div>
                        <div class="form-group">
                            <label for="name">Country:</label>
                            <input type="text" class="form-control" name="country" placeholder="Enter Your Country" required />
                        </div>
                        <div class="form-group">
                            <label for="name">Pincode:</label>
                            <input type="text" class="form-control" 
                            minlength="6" maxlength="6"name="pincode" placeholder="Enter Your Pincode" required />
                        </div>

<div class="col-md-12">
                        <button type="submit" class="btn btn-primary pull-right" id="btnContactUs">
                            Save Address</button>
                    </div>

</div></div>




</form>
</div>
</div>
</div>
</div>
<br>

<a class="btn btn-lg btn-primary pull-right" href="cart/checkout" role="button">Proceeds To Checkout</a>

</body>
</html>