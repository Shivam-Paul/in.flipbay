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
<div class="container" style="margin-top: 5%;">
  <div class="row">
    <div class="col-sm-4"> </div>
<div class="col-md-4">
<form action="user/save" method="post">
  

	<div class="form-group">  
    <label for="emailID"><b>Email ID</b></label>
    <input class="form-control" type="text" name="emailID" readonly value="${selectedUser.emailID}">
    
    <label for="Name"><b>Name</b></label>
    <input class="form-control" type="text" placeholder="Enter Name" value="${selectedUser.name}" name="name" required>
    
    <label for="Password"><b>Password</b></label>
    <input class="form-control" type="password" placeholder="Enter Password" value="${selectedUser.pwd}" name="password" required>
   
    <label for="Mobile"><b>Mobile</b></label>
    <input class="form-control" type="text" maxlength="10" placeholder="Enter Mobile" value="${selectedUser.mobile}" name="mobile">
    
    <label for="Role"><b>Role</b></label>
    <input class="form-control" type="text" readonly value="${selectedUser.role}" name="role" required>
    
    <label for="RegisteredDate"><b>Date of Registration</b></label>
    <input class="form-control" type="text"  readonly value="${selectedUser.registeredDate}"  name="registeredDate" >
    
    <label for="SecurityQuestion"><b>Security Question</b></label><br>
   	<input class="form-control" type="text" value="${selectedUser.securityQuestion}" name="securityQuestion" readonly />
   	
    <label for="SecurityAnswer"><b>Security Answer</b></label>
    <input class="form-control" type="text" readonly placeholder="Security Answer" value="${selectedUser.securityAnswer}"
     name="securityAnswer" required>
<div align="center">
<button class="btn btn-lg btn-primary" type="submit" role="button">Update User</button>
</div>
	</div>
</form>
</div>
</div>
</div>
	<div>
<div align="center">
		<table width="80%" border="3" bgcolor="lightblue">
			<tr>
				<td><div align="center"><b>EmailID</b></div></td>
				<td><div align="center"><b>Name</b></div></td>
				<td><div align="center"><b>Password</b></div></td>
				<td><div align="center"><b>Mobile</b></div></td>
				<td><div align="center"><b>Role</b></div></td>
				<td><div align="center"><b>RegisteredDate</b></div></td>
				<td><div align="center"><b>Security Question</b></div></td>
				<td><div align="center"><b>Security Answer</b></div></td>
				<td><div align="center"><b>Actions</b></div></td>
			</tr>

			<c:forEach var="user" items="${allUsers}">
				<tr>
					<td><div align="center"><b>${user.emailID}</b></div></td>
					<td><div align="center">${user.name}</div></td>
					<td><div align="center">${user.pwd}</div></td>
					<td><div align="center">${user.mobile}</div></td>
					<td><div align="center">${user.role}</div></td>
					<td><div align="center">${user.registeredDate}</div></td>
					<td><div align="center">${user.securityQuestion}</div></td>
					<td><div align="center">${user.securityAnswer}</div></td>
					<td><div align="center">
					<a class="btn btn-lg btn-primary" href="user/delete/?emailID=${user.emailID}" role="button">
					<span class="glyphicon glyphicon-trash "></span>
					</a>
					&nbsp;
					 <a class="btn btn-lg btn-primary" href="user/edit/?emailID=${user.emailID}" role="button">
					 <span class="glyphicon glyphicon-pencil "></span>
					 </a>
						</div></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>