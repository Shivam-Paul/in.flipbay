<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
${supplierSaveSuccessMessage}
${supplierSaveErrorMessage}
<form action="supplier/save" method="post">
<table>
<tr><td><b>ID</b></td><td>
<input type="text" placeholder="Enter supplier ID"
					 name="supplierID" required="true" />
</td>
</tr>
<tr><td><b>Name</b></td><td>
<input type="text" placeholder="Enter supplier Name"
					 name="supplierName" required="true" />
</td>
</tr>
<tr><td><b>Description</b></td><td>
<input type="text" placeholder="Enter supplier Description"
					 name="supplierDescription" />
</td>
</tr>
<tr>
<td>
<button type="submit">Add supplier</button>
    </td>
    </tr>

</table>

</form>

</body>
</html>