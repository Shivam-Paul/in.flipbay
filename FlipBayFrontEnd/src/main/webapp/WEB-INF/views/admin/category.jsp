<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
${successMessage}
${errorMessage}
<form action="saveCategory" method="post">

<tr><td><b>ID</b></td><td>
<input type="text" placeholder="Enter Category ID"
					 name="categoryID" required="true" />
</td>
</tr>
<tr><td><b>Name</b></td><td>
<input type="text" placeholder="Enter Category Name"
					 name="categoryName" required="true" />
</td>
</tr>
<tr><td><b>Description</b></td><td>
<input type="text" placeholder="Enter Category Description"
					 name="categoryDescription" required="true" />
</td>
</tr>



</form>





</body>
</html>