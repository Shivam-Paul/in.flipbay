
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
</head>
<body>
<div class="container" style="margin-top: 5%;">
  <div class="row">
    <div class="col-sm-4"> </div>
<div class="col-md-4">

<form action="changeProfile" method="post" enctype="multipart/form-data">
  

<div class="form-group">  
    <label for="emailID"><b>Email ID</b></label>
    <input type="text" class="form-control" name="emailID" value="${userDetails.emailID}" readonly>
    </div>
    
    <div class="form-group">  
     <label for="Name"><b>Name</b></label>
    <input type="text" class="form-control" placeholder="Enter Name" value="${userDetails.name}" name="name" required>
    </div>
    
    <div class="form-group">  
    <label for="Password"><b>Password</b></label>
    <input type="password" class="form-control" placeholder="Enter Password" value="${userDetails.pwd}" name="password" readonly>
    </div>
    
   <div class="form-group">  
    <label for="Mobile"><b>Mobile</b></label>
    <input type="text" class="form-control" placeholder="Enter Mobile" value="${userDetails.mobile}" name="mobile" required>
    </div>
    
    <div class="form-group">  
    <label for="Role"><b>Role</b></label>
    <input type="text" class="form-control" value="${userDetails.role}" name="Role" readonly>
    </div>
    
    <div class="form-group">  
    <label for="RegisteredDate"><b>Date of Registration</b></label>
    <input type="text" class="form-control" value="${userDetails.registeredDate}" name="registeredDate" readonly>
    </div>
    
    
    <div class="form-group">  
    <label for="SecurityQuestion"><b>Security Question</b></label> <br> 
	<input type="text" class="form-control" placeholder="Security Question" value="${userDetails.securityQuestion}" name="securityQuestion" required>
	</div>
	
	<div class="form-group"> 
    <label for="SecurityAnswer"><b>Security Answer</b></label>
    <input type="text" class="form-control" placeholder="Security Answer" value="${userDetails.securityAnswer}" name="securityAnswer" required>
	</div>
	
	<div class="form-group"> 
	
    <label for="userImage"><b>Profile Image</b></label>
	<input class="form-control" type="file" name="file">
	
	</div>
			
	
<button class="btn btn-default" type="submit">Submit</button>
</form>
</div>
</div>
</div>

</body>
</html>