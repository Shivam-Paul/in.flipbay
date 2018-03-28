<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
</head>
<body>
	${productSaveSuccessMessage} ${productSaveErrorMessage}
	${fileUploadSuccessMessage}
	<form action="product/save" method="post" enctype="multipart/form-data">
		<table>

			<tr>
				<td><b>ID</b></td>


				<td><input type="text" placeholder="Enter Product ID"
					name="productID" value="${selectedProduct.id}" required="true" /></td>
			</tr>
			<tr>
				<td><b>Name</b></td>
				<td><input type="text" placeholder="Enter Product Name"
					name="productName" value="${selectedProduct.name}" required="true" /></td>
			</tr>
			<tr>

				<td><b>Description</b></td>
				<td><input type="text" placeholder="Enter Product Description"
					name="productDescription" value="${selectedProduct.description}" /></td>
			</tr>

			<tr>

				<td><b>Category ID</b></td>
				<td><select>
						<c:forEach var="category" items="${allCategories}">
							<option value="${category.id}">${category.name}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>

				<td><b>Supplier ID</b></td>
				<td><select>
						<c:forEach var="supplier" items="${allSuppliers}">
							<option value="${supplier.id}">${supplier.name}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td><b>Price</b></td>
				<td><input type="text" placeholder="Enter Product Price"
					name="productPrice" value="${selectedProduct.price}"
					required="true" /></td>
			</tr>
			<tr>
			<td>
			Product Image <input type="file" name="file">


			<tr>
				<td>
					<input type="submit" value="Create Product">Add Product</button>
				</td>
			</tr>
		</table>
	</form>
	<div>

		<table border="3" bgcolor="lightblue">
			<tr>
				<td>Product ID</td>
				<td>Product Name</td>
				<td>Product Description</td>
				<td>Category ID</td>
				<td>Supplier ID</td>
				<td>Product Price</td>
				<td>Actions</td>
			</tr>

			<c:forEach var="product" items="${allProducts}">
				<tr>
					<td>${product.id}</td>
					<td>${product.name}</td>
					<td>${product.description}</td>
					<td>${category.id}</td>
					<td>${supplier.id}</td>
					<td>${product.price}</td>

					<td><a href="product/delete/?id=${product.id}">Delete</a>/ <a
						href="product/edit/?id=${product.id}">Edit</a>
				</tr>
			</c:forEach>
		</table>
	</div>


</body>
</html>