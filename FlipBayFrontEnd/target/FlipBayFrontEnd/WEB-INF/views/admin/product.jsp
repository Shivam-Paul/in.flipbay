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
<div align="center" class="container" style="margin-top: 5%;">

 <table>
 <tr>
 <td>
 <div class="form-group">  
			<form action="product/save" method="post" id="addProduct" enctype="multipart/form-data">
		
	
		<table width="100%">
		<tr>
		<th colspan="2"><div align="center">Add Product</div></th>
		</tr>

			 <tr>
				<td><div align="center"><b>Product ID</b></div></td>
				<td><div align="center"><input class="form-control" type="text" placeholder="Enter Product ID"
					  name="productID" required="true" /></div></td>
			</tr>
			<tr>
				<td><div align="center"><b>Product Name</b></div></td>
				<td><div align="center"><input class="form-control" type="text" placeholder="Enter Product Name"
					name="productName"  required="true" /></div></td>
			</tr>
			<tr>

				<td><div align="center"><b>Product Description</b></div></td>
				<td><div align="center"><input class="form-control" type="text" placeholder="Enter Product Description"
					name="productDescription"  /></div></td>
			</tr>

			<tr>

				<td><div align="center"><b>Category ID</b></div></td>
				<td><div align="center"><select name="categoryID">
						<c:forEach var="category" items="${allCategories}">
							<option value="${category.id}">${category.name}</option>
						</c:forEach>
				</select></div></td>
			</tr>
			<tr>

				<td><div align="center"><b>Supplier ID</b></div></td>
				<td><div align="center"><select name="supplierID">
						<c:forEach var="supplier" items="${allSuppliers}">
							<option value="${supplier.id}">${supplier.name}</option>
						</c:forEach>
				</select></div></td>
			</tr>
			<tr>
				<td><div align="center"><b>Product Price</b></div></td>
				<td><div align="center"><input class="form-control" type="text" placeholder="Enter Product Price"
					name="productPrice"
					required="true" /></div></td>
			</tr>
			<tr>
				<td><div align="center"><b>Product Quantity</b></div></td>
				<td><div align="center"><input class="form-control" type="text" placeholder="Enter Product Quantity"
					name="productQuantity" 
					required="true" /></div></td>
			</tr>
			<tr>
				<td><div align="center"><b>Product Image </b></div></td>
				<td><div align="center"><input class="form-control" type="file" name="file"></div></td>
			</tr>
			<tr>
				<td colspan="2"><div align="center">
				<button class="btn btn-lg btn-primary" type="submit" role="button">Add Product</button>
				
					</div></td>
			</tr>
		</table>
	</form>
	</div>
 </td>
 
 
 <td>
 
 <div align="right" class="form-group">  
			<form action="product/update" method="post" id="updateProduct" enctype="multipart/form-data">
		
	
		<table width="100%">
		<tr>
 		<th colspan="2"><div align="center">Update Product</div></th>
 		<th></th>
		</tr>
			<tr>
				<td><div align="center"><b>Product ID</b></div></td>


				<td><div align="center"><input class="form-control" type="text" placeholder="Enter Product ID"
					name="productID" value="${selectedProduct.id}" readonly required="true" /></div></td>
			</tr>
			<tr>
				<td><div align="center"><b>Product Name</b></div></td>
				<td><div align="center"><input class="form-control" type="text" placeholder="Enter Product Name"
					name="productName" value="${selectedProduct.name}" required="true" /></div></td>
			</tr>
			<tr>

				<td><div align="center"><b>Product Description</b></div></td>
				<td><div align="center"><input class="form-control" type="text" placeholder="Enter Product Description"
					name="productDescription" value="${selectedProduct.description}" /></div></td>
			</tr>

			<tr>

				<td><div align="center"><b>Category ID</b></div></td>
				<td><div align="center"><select name="categoryID">
						<c:forEach var="category" items="${allCategories}">
							<option value="${category.id}">${category.name}</option>
						</c:forEach>
				</select></div></td>
			</tr>
			<tr>

				<td><div align="center"><b>Supplier ID</b></div></td>
				<td><div align="center"><select name="supplierID">
						<c:forEach var="supplier" items="${allSuppliers}">
							<option value="${supplier.id}">${supplier.name}</option>
						</c:forEach>
				</select></div></td>
			</tr>
			<tr>
				<td><div align="center"><b>Product Price</b></div></td>
				<td><div align="center"><input class="form-control" type="text" placeholder="Enter Product Price"
					name="productPrice" value="${selectedProduct.price}"
					required="true" /></div></td>
			</tr>
			<tr>
				<td><b>Product Quantity</b></div></td>
				<td><input class="form-control" type="text" placeholder="Enter Product Quantity"
					name="productQuantity" value="${selectedProduct.quantity}"
					required="true" /></div></td>
			</tr>
			<tr>
				<td><div align="center"><b>Product Image </b></div></td>
				<td><div align="center"><input class="form-control" type="file" name="file"></div></td>
			</tr>
			<tr>
				<td colspan="2">
				<div align="center">
				<button class="btn btn-lg btn-primary" type="submit" role="button">Update Product</button>
				</div>
					</td>
			</tr>
		</table>
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
				<td><div align="center"><b>Description</b></div></td>
				<td><div align="center"><b>Category ID</b></div></td>
				<td><div align="center"><b>Supplier ID</b></div></td>
				<td><div align="center"><b>Price</b></div></td>
				<td><div align="center"><b>Image</b></div></td>
				<td><div align="center"><b>Actions</b></div></td>
			</tr>

			<c:forEach var="product" items="${allProducts}">
				<tr>
					<td><div align="center"><b>${product.id}</div></td>
					<td><div align="center">${product.name}</div></td>
					<td><div align="center">${product.description}</div></td>
					<td><div align="center">${product.categoryID}</div></td>
					<td><div align="center">${product.supplierID}</div></td>
					<td><div align="center">${product.price}</div></td>
					<td><div align="center">
					<img width= "100px" height="100px" alt="No Image Uploaded" src="resources/images/products/${product.name}.png"/>
					</div></td>

					<td><div align="center">
					<a class="btn btn-lg btn-primary" href="product/delete/?id=${product.id}" role="button">
					<span class="glyphicon glyphicon-trash "></span></a>
					&nbsp;
					<a class="btn btn-lg btn-primary" href="product/edit/?id=${product.id}" role="button">
					<span class="glyphicon glyphicon-pencil "></span></a>
					</div></td>
				</tr>
			</c:forEach>
		</table>
	</div>


</body>
</html>