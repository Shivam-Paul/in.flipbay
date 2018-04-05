<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
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

	<script>
function formValidation() {
    var x, text;

    x = document.getElementByName("mobile").value;

    if (isNaN(x)) {
        text = "Only numbers allowed in mobile";
        return false;
    }
    document.getElementById("invalidMobile").innerHTML = text;
    return true;
}
</script>

	<h2>Registration Page</h2>

	<form action="user/save" onSubmit="return formValidation();"
		method="post">
		<table>

			<tr>
				<td><b>Email ID</b></td>


				<td><input type="text" placeholder="Enter Email ID"
					name="emailID" required="true" /></td>
			</tr>
			<tr>
				<td><b>Name</b></td>
				<td><input type="text" placeholder="Enter UserName" name="name"
					required="true" /></td>
			</tr>
			<tr>

				<td><b>Password</b></td>
				<td><input type="text" placeholder="Enter Password"
					name="password" required="true" id="password" /></td>
			</tr>
			<tr>

				<td><b>Confirm Password</b></td>
				<td><input type="text" placeholder="Comfirm Password"
					name="confirmPassword" required="true" id="confirmPassword"
					onkeyup="validatePasswordMatch()"/> <script>
					
						var password = document.getElementById('password');
					var confirmPassword = document.getElementById('confirmPassword');
					function validatePasswordMatch() {
					var passValue=password.value;
					var conPassValue=confirmPassword.value;
	if (passValue!=conPassValue) {
	 confirmPassword.style.backgroundColor = 'red';
	password.style.backgroundColor='red' 
	/* alert('password mismatch!') */
	} 
	else {
		confirmPassword.style.backgroundColor = 'green';
		password.style.backgroundColor='green'
	}
	}

					</script></td>
			</tr>

			<tr>

				<td><b>Mobile Number</b></td>

				<td><input id="mobile" type="text"
					placeholder="Enter Mobile Number" name="mobile" maxlength="10"
					onkeyup="validateMobile()" /> <script>
				

var mobile = document.getElementById('mobile');
function validateMobile() {
  var value = mobile.value;
  if (!value || isNaN(value) || value.length > 10 || value.length < 10) {
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











</body>


</html>