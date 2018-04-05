<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Users</title>
</head>
<body>
<form action="user/save" method="post">
  

  <div class="container">
    <label for="emailID"><b>Email ID</b></label>
    <input type="text" name="emailID" readonly value="${selectedUser.emailID}">
     <label for="Name"><b>Name</b></label>
    <input type="text" placeholder="Enter Name" value="${selectedUser.name}" name="name" required>
    
    <label for="Password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" value="${selectedUser.pwd}" name="password" required>
    
   
    <label for="Mobile"><b>Mobile</b></label>
    <input type="text" maxlength="10" placeholder="Enter Mobile" value="${selectedUser.mobile}" name="mobile">
    <label for="Role"><b>Role</b></label>
    <input type="text" readonly value="${selectedUser.role}" name="role" required>
    
    <label for="RegisteredDate"><b>Date of Registration</b></label>
    <input type="text"  readonly value="${selectedUser.registeredDate}"  name="registeredDate" >
    <label for="SecurityQuestion"><b>Security Question</b></label><br>
   	<select name="securityQuestion">
   	<option selected="selected" value="${selectedUser.securityQuestion}">${selectedUser.securityQuestion}</option>
   	</select><br><br>
   	
    <label for="SecurityAnswer"><b>Security Answer</b></label>
    <input type="text" readonly placeholder="Security Answer" value="${selectedUser.securityAnswer}" name="securityAnswer" required>

	<button type="submit">Submit</button></div>
</form>
	<div>

		<table border="3" bgcolor="lightblue">
			<tr>
				<td>User EmailID</td>
				<td>Username</td>
				<td>User Password</td>
								<td>User Mobile</td>
				
							<td>User Role</td>
							<td>User RegisteredDate</td>
							<td>User Security Question</td>
							<td>User Security Answer</td>
			
				<td>Actions</td>
			</tr>

			<c:forEach var="user" items="${allUsers}">
				<tr>
					<td>${user.emailID}</td>
					<td>${user.name}</td>
					<td>${user.pwd}</td>
										<td>${user.mobile}</td>
					
					<td>${user.role}</td>
					<td>${user.registeredDate}</td>
					<td>${user.securityQuestion}</td>
					<td>${user.securityAnswer}</td>
					<td><a href="user/delete/?emailID=${user.emailID}">Delete</a>/ <a
						href="user/edit/?emailID=${user.emailID}">Edit</a>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>