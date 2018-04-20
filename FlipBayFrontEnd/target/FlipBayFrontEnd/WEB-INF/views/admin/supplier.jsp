<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplier</title>
<style>
td {align: center;}
</style>
</head>
<body>
<div class="container" style="margin-top: 5%;">
  <table>
  <tr>
  <td>
  		<div align="left" class="form-group">  
  
  <form action="supplier/save" method="post" id="addSupplier" enctype="multipart/form-data">
	
<table width="100%">
		<tr>
			<td><div align="center"><b>ID</b></div></td>
			<td><div align="center"><input class="form-control" type="text" placeholder="Enter supplier ID"
				name="supplierID" readonly required="true" /></div></td>
		</tr>
		<tr>
			<td><div align="center"><b>Name</b></div></td>
			<td><div align="center"><input class="form-control" type="text" placeholder="Enter supplier Name"
				name="supplierName"  required="true" /></div></td></tr>
		<tr>
		
			<td><div align="center"><b>Address</b></div></td>
			<td><div align="center"><input class="form-control" type="text" placeholder="Enter supplier Address"
				name="supplierAddress"  /></div></td>
		</tr>
		<tr>
				<td><div align="center"><b>Supplier Image </b></div></td>
				<td><div align="center"><input class="form-control" type="file" name="file"></div></td>
			</tr>
		<tr>
			<td colspan="2"><div align="center">
			<button class="btn btn-lg btn-primary" type="submit" role="button">Add Supplier</button>
			</div></td>
		</tr>
		</table>
	</form>
	</div>
  </td>
  <td>
  </td>
  <td>
  <div align="right" class="form-group">  
  
  <form action="supplier/update" method="post" id="addSupplier" enctype="multipart/form-data">
	<div align="center">
<table width="100%">
		<tr>
			<td><div align="center"><b>ID</b></div></td>
			<td><div align="center"><input class="form-control" type="text" placeholder="Enter supplier ID"
				name="supplierID" value="${selectedSupplier.id}" readonly required="true" /></div></td>
		</tr>
		<tr>
			<td><div align="center"><b>Name</b></div></td>
			<td><div align="center"><input class="form-control" type="text" placeholder="Enter supplier Name"
				name="supplierName" value="${selectedSupplier.name}" required="true" /></div></td></tr>
		<tr>
		
			<td><div align="center"><b>Address</b></div></td>
			<td><div align="center"><input class="form-control" type="text" placeholder="Enter supplier Address"
				name="supplierAddress" value="${selectedSupplier.address}" /></div></td>
		</tr>
		<tr>
				<td><div align="center"><b>Suppliers Image </b></div></td>
				<td><div align="center"><input class="form-control" type="file" name="file"></div></td>
			</tr>
		<tr>
			<td colspan="2">
			<div align="center">
			
			<button class="btn btn-lg btn-primary" type="submit" role="button">Update Supplier</button>
			</div></td>
		</tr>
		</table>
		</div>
	</form>
	</div>
  </td>
  </tr>
  </table>

	</div>
	
<div align="center">
		<table width="80%" border="3" bgcolor="lightblue">
			<tr>
				<td><div align="center"><b>ID</b></div></td>
				<td><div align="center"><b>Name</b></div></td>
				<td><div align="center"><b>Address</b></div></td>
				<td><div align="center"><b>Image</b></div></td>
				<td><div align="center"><b>Actions</b></div></td>
			</tr>

			<c:forEach var="supplier" items="${allSuppliers}">
				<tr>
					<td><div align="center"><b>${supplier.id}</b></div></td>
					<td><div align="center">${supplier.name}</div></td>
					<td><div align="center">${supplier.address}</div></td>
					<td><div align="center"><img height="100px" width="100px" alt="No Image Uploaded" 
					src="resources/images/suppliers/${supplier.name}.png"/></div></td>
					<td><div align="center">
					<a class="btn btn-lg btn-primary" href="supplier/delete/?id=${supplier.id}" role="button">
					<span class="glyphicon glyphicon-trash "></span></a>
					&nbsp;
					<a class="btn btn-lg btn-primary" href="supplier/edit/?id=${supplier.id}" role="button">
					<span class="glyphicon glyphicon-pencil "></span></a>
					</div></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	 

</body>
</html>