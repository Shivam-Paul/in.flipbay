<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>
</head>
<body>

<div class="container" style="margin-top: 5%;">


	
	
	<table>
	<tr>
	<td>
	<div align="left" class="form-group">  
	<form action="category/save" method="post" id="addCategory" enctype="multipart/form-data">	
	<table>
	<tr>
	<td colspan="2"> <b> Save </b> </td></tr>
	
			<tr>
			
				<td><b>Category ID</b></td>
				
			
				<td><input class="form-control" type="text" placeholder="Enter Category ID"
					name="categoryID"   /></td>
			</tr>
			<tr>
				<td><b>Category Name</b></td>
				<td><input class="form-control" type="text" placeholder="Enter Category Name"
					name="categoryName" 
					required="true" /></td>
			</tr>
			<tr>

				<td><b>Category Description</b></td>
				<td><input class="form-control" type="text" placeholder="Enter Category Description"
					name="categoryDescription"  /></td>
			</tr>
			<tr>
				<td><b>Category Image </b></td>
				<td><input class="form-control" type="file" name="file"></td>
			</tr>
			<tr>
			<td colspan="2">
			<div align="center">
			<button class="btn btn-lg btn-primary" type="submit" role="button">Add Category</button>
			</div>
			</td>
			</tr>
		</table>
		</form>
		</div>
	
	</td>
	<td>
	<br>
	<br>
	</td>
	<td>
	<div align="right" class="form-group">
	<form action="category/update" method="post" id="addCategory" enctype="multipart/form-data">	
	<div align="center">
	<table width="100%">
	
	<tr>
	<td colspan="2"><b> Update</b> </td></tr>
			<tr>
			
				<td><b>Category ID</b></td>
				
			
				<td><input class="form-control" type="text" placeholder="Enter Category ID"
					name="categoryID" value="${selectedCategory.id}"  /></td>
			</tr>
			<tr>
				<td><b>Category Name</b></td>
				<td><input class="form-control" type="text" placeholder="Enter Category Name"
					name="categoryName" value="${selectedCategory.name}"
					required="true" /></td>
			</tr>
			<tr>

				<td><b>Category Description</b></td>
				<td><input class="form-control" type="text" placeholder="Enter Category Description"
					name="categoryDescription" value="${selectedCategory.description}" /></td>
			</tr>
			<tr>
				<td><b>Category Image </b></td>
				<td><input class="form-control" type="file" name="file"></td>
			</tr>
			<tr>
			<td colspan="2">
			<div align="center">
<button class="btn btn-lg btn-primary" type="submit" role="button">Update Category</button>		
	</div>
			</td>
			</tr>
		</table>
		</div>
	</form>
	</div>
	</td>
	</tr>
	
	
	
	
	
	</table>
		
		
	</div>
	
	<br>
	<br>
	<div>
	
<div align="center">
		<table width="80%" border="3" bgcolor="lightblue">
		
			<tr>
				<td><div align="center"><b>Category ID</b></div></td> 
				<td><div align="center"><b>Category Name</b></div></td>
				<td><div align="center"><b>Category Description</b></div></td>
				<td><div align="center"><b>Category Image</b></div></td>
				<td><div align="center"><b>Actions</b></div></td>
			</tr>

			<c:forEach var="category" items="${allCategories}">
				<tr>
					<td><div align="center"><b>${category.id}</b></div></td>
					<td><div align="center">${category.name}</div></td>
					<td><div align="center">${category.description}</div></td>
					<td><div align="center"><img width="100px" height="100px" 
					alt="No Image Uploaded" src="resources/images/categories/${category.name}.png"/></div></td>
					<td><div align="center">
					<a class="btn btn-lg btn-primary" href="category/delete/?id=${category.id}" role="button">
					<span class="glyphicon glyphicon-trash "></span></a>
					&nbsp;
					<a class="btn btn-lg btn-primary" href="category/edit/?id=${category.id}" role="button">
					<span class="glyphicon glyphicon-pencil "></span>
					</a></div></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

</body>
</html>