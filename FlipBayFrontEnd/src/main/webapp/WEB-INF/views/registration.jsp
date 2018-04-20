<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">


<style type="text/css">
  
body{
  background-image: url("resources/images/register.jpg");
}


</style>



</head>
<body>
                 
<div class="container" style="margin-top: 5%;">
  <div class="row">
    <div class="col-sm-4"> </div>
<div class="col-md-4">
  
<h1 class="text-center text-success"> Register page</h1>
<br/>

<div class="col-sm-12">

  <ul class="nav nav-pills" >


   <li class="" style="width:50%"><a class="btn btn-lg btn-default" data-toggle="tab" href="#REG">REGISTER</a></li>

   <li class="" style="width:48%"><a class="btn btn-lg btn-default" data-toggle="tab" href="#LOG">SIGN IN</a></li>

   



  </ul>

<br/>


  <div class="tab-content">
    <div id="REG" class="tab-pane fade in active">
      
<form action="register" method="post">

<div class="form-group">
    <label for="email">Email ID:</label>


				<input class="form-control" type="text" placeholder="Enter Email ID"
					name="emailID" required="true" id="emailID" onkeyup="return validateEmailID();" /> 
					<span id="strengthID">Type EmailID</span>
					
					<script language="javascript">
function validateEmailID() {
var strength = document.getElementById('strengthID');
var strongRegex = new RegExp("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
var emailID = document.getElementById("emailID");
if (emailID.value.length==0) {
strength.innerHTML = 'Type Email ID';
} else if (false == strongRegex.test(emailID.value)) {
strength.innerHTML = 'Please enter valid Email ID';
} else {
	strength.innerHTML = 'Email ID is accepted';
}
}
</script>
		
  </div>

  <div class="form-group">
    <label for="UserName">Username</label>
    <input type="text" class="form-control" placeholder="Enter UserName" name="name"
					required="true" />
  </div>
  
  

  <div class="form-group">
      <label for="pwd">Password:</label>
  
  <input type="password" class="form-control" placeholder="Enter Password"
					name="password" required="true" id="password" onkeyup="return passwordStrength();" />
					<span id="strength">Type Password</span>
					
					<script language="javascript">
function passwordStrength() {
var strength = document.getElementById('strength');
var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
var enoughRegex = new RegExp("(?=.{6,}).*", "g");
var pwd = document.getElementById("password");
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
    <label for="pwd">Confirm Password:</label>
    <input type="password" class="form-control" placeholder="Comfirm Password"
					name="confirmPassword" required="true" id="confirmPassword"
					onkeyup="validatePasswordMatch()" /> 
					<span id="strengthID1">Type Confirm Password</span>
					<script>
						var password = document.getElementById('password');
						var confirmPassword = document
								.getElementById('confirmPassword');
						function validatePasswordMatch() {
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
  
  <div class="form-group">
    <label for="mobile">Mobile Number</label>
  <input class="form-control" id="mobile" type="text"
					placeholder="Enter Mobile Number" name="mobile" maxlength="10"
					onkeyup="return validateMobile();" />
										<span id="strengthID2">Type Mobile Number</span>
					
					<script>
						var mobile = document.getElementById('mobile');
						function validateMobile() {
							var strength = document.getElementById('strengthID2');

							var value = mobile.value;
							if (!value || isNaN(value) || value.length > 10
									|| value.length < 10) {
								strength.innerHTML = '<span style="color:red">Please enter valid Mobile Number!</span>';
							} 		
							else {
								strength.innerHTML = '<span style="color:green">Mobile number accepted</span>';
							}
							}
						
					</script>
					</div>
					<div class="form-group">
    <label for="securityQuestion">Security Question</label>
    <input type="text" class="form-control" placeholder="Enter Security Question" name="securityQuestion"
					required="true" />
  </div>
  
  
  <div class="form-group">
    <label for="securityAnswer">Security Answer</label>
    <input type="text" class="form-control" placeholder="Enter Security Answer" name="securityAnswer"
					required="true" />
  </div>



  <button type="submit" class="btn btn-default btn-lg">Submit</button>
  
</form>
<br/>
<a href="#LOG" class="pull-right btn btn-block btn-danger" > Already Register ?   </a>



    </div>

    <div id="LOG" class="tab-pane fade">


<form action="validate" method="post" name="login">
  

  <div class="form-group">
<label for="email"><b>Email address</b></label>
    <input type="text" class="form-control" placeholder="Enter Email Address" name="uname" required>
    </div>
<div class="form-group">
    <label for="psw"><b>Password</b></label>
    <input type="password" class="form-control" placeholder="Enter Password" name="psw" required>
       </div> 
     
    <button type="submit" class="btn btn-default">Login</button>
    
      <input type="checkbox" checked="checked" name="remember"> Remember me
   </form>
   <div class="form-group" style="background-color:#f1f1f1">
     <a href="user/forgotPassword">Forget password</a>
    
  </div>
  </div>

  

<br/>


    



    </div>
   </div>
  </div>
</div>
</div>
<!-- This design is created by manoj chauhan  -->
</body>
</html>

<%-- <style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

form {
	border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>
<body>

	

	<h2>Registration Page</h2>

	<form action="register" onSubmit="return formValidation();"
		method="post">
		<table>

			<tr>
			<tr>
				<td><b>Email ID</b></td>


				<td><input type="text" placeholder="Enter Email ID"
					name="emailID" required="true" id="emailID" onkeyup="return validateEmailID();" /> 
					<td><span id="strengthID">Type EmailID</span></td></tr>
					
					<script language="javascript">
function validateEmailID() {
var strength = document.getElementById('strengthID');
var strongRegex = new RegExp("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
var emailID = document.getElementById("emailID");
if (emailID.value.length==0) {
strength.innerHTML = 'Type Email ID';
} else if (false == strongRegex.test(emailID.value)) {
strength.innerHTML = 'Please enter valid Email ID';
} else {
	strength.innerHTML = 'Email ID is accepted';
}
}
</script>
					
					</td>
			</tr>
			<tr>
				<td><b>Name</b></td>
				<td><input type="text" placeholder="Enter UserName" name="name"
					required="true" /></td>
			</tr>
			<tr>
<tr>
				<td><b>Password</b></td>
				<td><input type="text" placeholder="Enter Password"
					name="password" required="true" id="password" onkeyup="return passwordStrength();" />
					<td><span id="strength">Type Password</span></td></tr>
					
					<script language="javascript">
function passwordStrength() {
var strength = document.getElementById('strength');
var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
var enoughRegex = new RegExp("(?=.{6,}).*", "g");
var pwd = document.getElementById("password");
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
					</td>
			</tr>
			<tr>

				<td><b>Confirm Password</b></td>
				<td><input type="text" placeholder="Comfirm Password"
					name="confirmPassword" required="true" id="confirmPassword"
					onkeyup="validatePasswordMatch()" /> 
					<script>
						var password = document.getElementById('password');
						var confirmPassword = document
								.getElementById('confirmPassword');
						function validatePasswordMatch() {
							var passValue = password.value;
							var conPassValue = confirmPassword.value;
							if (passValue != conPassValue) {
								confirmPassword.style.backgroundColor = 'red';
								password.style.backgroundColor = 'red'
								/* alert('password mismatch!') */
							} else {
								confirmPassword.style.backgroundColor = 'green';
								password.style.backgroundColor = 'green'
							}
						}
					</script></td>
			</tr>

			<tr>

				<td><b>Mobile Number</b></td>

				<td><input id="mobile" type="text"
					placeholder="Enter Mobile Number" name="mobile" maxlength="10"
					onkeyup="validateMobile()" />
					<script>
						var mobile = document.getElementById('mobile');
						function validateMobile() {
							var value = mobile.value;
							if (!value || isNaN(value) || value.length > 10
									|| value.length < 10) {
								mobile.style.backgroundColor = 'red';
							} else {
								mobile.style.backgroundColor = 'green';
							}
						}
					</script></td>


			</tr>
			<tr>

				<td><b>Security Question</b></td>
				<td><input type="text" placeholder="Enter Security Question"
					name="securityQuestion" required="true" /></td>

			</tr>
			<tr>

				<td><b>Security Answer</b></td>
				<td><input type="text" placeholder="Enter Security Answer"
					name="securityAnswer" required="true" /></td>

			</tr>




			<tr>
				<td>
					<button type="submit">Register</button>
				</td>
			</tr>
		</table>
	</form>

</body> --%>

