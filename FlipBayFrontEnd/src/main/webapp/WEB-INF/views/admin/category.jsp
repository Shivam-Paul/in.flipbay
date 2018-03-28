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
	${categorySaveSuccessMessage} ${categorySaveErrorMessage}
	<form action="category/save" method="post">
		<table>
		
			<tr>
				<td><b>ID</b></td>
				
			
				<td><input type="text" placeholder="Enter Category ID"
					name="categoryID" value="${selectedCategory.id}" required="true" /></td>
			</tr>
			<tr>
				<td><b>Name</b></td>
				<td><input type="text" placeholder="Enter Category Name"
					name="categoryName" value="${selectedCategory.name}"
					required="true" /></td>
			</tr>
			<tr>

				<td><b>Description</b></td>
				<td><input type="text" placeholder="Enter Category Description"
					name="categoryDescription" value="${selectedCategory.description}" /></td>
			</tr>
			<tr>
				<td>
					<button type="submit">Add Category</button>
				</td>
			</tr>
		</table>
	</form>
	<div>

		<table border="3" bgcolor="lightblue">
			<tr>
				<td>Category ID</td>
				<td>Category Name</td>
				<td>Category Description</td>
				<td>Actions</td>
			</tr>

			<c:forEach var="category" items="${allCategories}">
				<tr>
					<td>${category.id}</td>
					<td>${category.name}</td>
					<td>${category.description}</td>
					<td><a href="category/delete/?id=${category.id}">Delete</a>/ <a
						href="category/edit/?id=${category.id}">Edit</a>
				</tr>
			</c:forEach>
		</table>
	</div>


</body>
</html>