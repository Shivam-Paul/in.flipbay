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
<h2>
<a href="manageCategories">Manage Categories</a>
<a href="manageSuppliers">Manage Suppliers</a>
<a href="manageProducts">Manage Products</a>
</h2>

<jsp:include page="category.jsp"></jsp:include>
<jsp:include page="supplier.jsp"></jsp:include>
<jsp:include page="product.jsp"></jsp:include>


</body>
</html>