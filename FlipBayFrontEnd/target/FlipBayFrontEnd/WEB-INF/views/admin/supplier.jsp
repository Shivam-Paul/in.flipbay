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
	${supplierSaveSuccessMessage}
	${supplierSaveErrorMessage}
	<form action="supplier/save" method="post" id="addSupplier" enctype="multipart/form-data">
<table>
		<tr>
			<td><b>ID</b></td>
			<td><input type="text" placeholder="Enter supplier ID"
				name="supplierID" value="${selectedSupplier.id}" readonly required="true" /></td>
		</tr>
		<tr>
			<td><b>Name</b></td>
			<td><input type="text" placeholder="Enter supplier Name"
				name="supplierName" value="${selectedSupplier.name}" required="true" /></td></tr>
		<tr>
		
			<td><b>Address</b></td>
			<td><input type="text" placeholder="Enter supplier Address"
				name="supplierAddress" value="${selectedSupplier.address}" /></td>
		</tr>
		<tr>
				<td><b>Supplier Image </b></td>
				<td><input type="file" name="file"></td>
			</tr>
		<tr>
			<td>
				<button type="submit">Add supplier</button>
			</td>
		</tr>
		</table>
	</form>
	<div>

		<table border="3" bgcolor="lightblue">
			<tr>
				<td>Supplier ID</td>
				<td>Supplier Name</td>
				<td>Supplier Address</td>
				
				<td>Actions</td>
			</tr>

			<c:forEach var="supplier" items="${allSuppliers}">
				<tr>
					<td>${supplier.id}</td>
					<td>${supplier.name}</td>
					<td>${supplier.address}</td>
					<td><img alt="No Image Uploaded" src="${supplierImagesDirectory}${supplier.id}.png"/></td>
					<td><a href="supplier/delete/?id=${supplier.id}">Delete</a>/
					<a href="supplier/edit/?id=${supplier.id}">Edit</a>
				</tr>
			</c:forEach>
		</table>
	</div>
	 

</body>
</html>