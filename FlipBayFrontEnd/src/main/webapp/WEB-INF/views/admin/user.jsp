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
<form action="user/save" method="post">
  

  <div class="container">
    <label for="emailID"><b>Email ID</b></label>
    <input type="text" value="${userDetails.emailID}" disabled>
     <label for="Name"><b>Name</b></label>
    <input type="text" placeholder="Enter Name" value="${userDetails.name}" name="Name" required>
    
    <label for="Password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" value="${userDetails.pwd}" name="Password" required>
    
   
    <label for="Mobile"><b>Mobile</b></label>
    <input type="text" placeholder="Enter Mobile" value="${userDetails.mobile}" name="Mobile" required>
    <label for="Role"><b>Role</b></label>
    <input type="text"  value="${userDetails.role}" name="Role" >
    
    <label for="RegisteredDate"><b>Date of Registration</b></label>
    <input type="text"  value="${userDetails.registeredDate}" name="RegisteredDate" >
   <%--  <label for="SecurityQuestion"><b>Security Question</b></label>
   	<select>
   	<option value="${userDetails.securityQuestion}">
   	<option value="Your first pet name">
   	<option value="Your school name">
   	</select>
   	
    <label for="SecurityAnswer"><b>Security Answer</b></label>
    <input type="text" placeholder="Security Answer" value="${userDetails.securityAnswer}" name="SecurityAnswer" required> --%>

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
					<td><a href="user/delete/?id=${category.id}">Delete</a>/ <a
						href="user/edit/?id=${category.id}">Edit</a>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>