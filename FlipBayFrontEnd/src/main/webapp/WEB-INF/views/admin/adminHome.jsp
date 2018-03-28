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
<c:if test="${isAdmin==true}">
<a href="category">Manage Categories</a>
<a href="supplier">Manage Suppliers</a>
<a href="product">Manage Products</a>
</c:if>
</h2>

<c:if test="${isAdminClickedManageCategories==true}">
		<jsp:include page="category.jsp"></jsp:include>
	</c:if>
	<c:if test="${isAdminClickedManageSuppliers==true}">
		<jsp:include page="supplier.jsp"></jsp:include>
	</c:if>
	<c:if test="${isAdminClickedManageProducts==true}">
		<jsp:include page="product.jsp"></jsp:include>
	</c:if>



</body>
</html>