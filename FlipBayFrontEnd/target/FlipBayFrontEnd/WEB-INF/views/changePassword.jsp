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

<div class="container" style="margin-top: 5%;">
  <div class="row">
    <div class="col-sm-4"> </div>
<div class="col-md-4">


<form action="user/changePassword" method="post">
  

<div class="form-group">  
    <label for="NewPassword"><b>Enter New Password</b></label>
    <input id="NewPassword" type="password" class="form-control" placeholder="Enter Your New Password" name="NewPassword" onkeyup="return passwordStrength1();" required>
    <span id="strength">Type Password</span>
					
					<script language="javascript">
function passwordStrength1() {
var strength = document.getElementById('strength');
var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
var enoughRegex = new RegExp("(?=.{6,}).*", "g");
var pwd = document.getElementById("NewPassword");
if (pwd.value.length==0) {
strength.innerHTML = 'Type Password';
} else if (false == enoughRegex.test(pwd.value)) {
strength.innerHTML = 'More Characters';
} else if (strongRegex.test(pwd.value)) {
strength.innerHTML = '<span style="color:green">Strong!</span>';
} else if (mediumRegex.test(pwd.value)) {
strength.innerHTML = '<span style="color:orange">Medium!</span>';
} else {
strength.innerHTML = '<span style="color:red">Weak!</span>';
}
}
</script>
    </div>
    <div class="form-group">  
    
    <label for="ConfirmNewPassword"><b>Confirm New Password</b></label>
    <input id="ConfirmNewPassword" type="password" class="form-control" placeholder="Confirm New Password" name="ConfirmNewPassword" onkeyup="return validatePasswordMatch1();" required>
    <span id="strengthID1">Type Confirm Password</span>
					<script>
						var password = document.getElementById('NewPassword');
						var confirmPassword = document
								.getElementById('ConfirmNewPassword');
						function validatePasswordMatch1() {
							var strength = document.getElementById('strengthID1');

							var passValue = password.value;
							var conPassValue = confirmPassword.value;
							if (passValue != conPassValue) {
								strength.innerHTML = '<span style="color:red">Not Match!</span>';
								/* alert('password mismatch!') */
							} else {
								strength.innerHTML = '<span style="color:green">Password Matched!</span>';

							}
						}
					</script>
</div>
<button class="btn btn-default" type="submit">Submit</button>
</form>
</div>
</div>
</div>
</body>
</html>