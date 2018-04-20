<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password?</title>
</head>
<body>
<div class="container" style="margin-top: 5%;">
  <div class="row">
    <div class="col-sm-4"> </div>
<div class="col-md-4">
<h1 class="text-center text-success"> Forgot Password</h1>

<form action="user/securityQues" method="post">
  

<div class="form-group">  
  <label for="emailID"><b>Enter Your EmailID</b></label>
    <input class="form-control" type="text" placeholder="Enter Your EmailID" name="emailID" required>
    </div>

<button class="btn btn-default" type="submit">Submit</button></form>

</div></div></div>

</body>
</html>