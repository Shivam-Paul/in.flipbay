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
<a href="manageCategories">Manage Categories</a>
<a href="manageSuppliers">Manage Suppliers</a>
<a href="manageProducts">Manage Products</a>
</c:if>
</h2>

<c:if test="${isUserClickedManageCategories==true}">
		<jsp:include page="category.jsp"></jsp:include>
	</c:if>
	<c:if test="${isUserClickedManageSuppliers==true}">
		<jsp:include page="supplier.jsp"></jsp:include>
	</c:if>
	<c:if test="${isUserClickedManageProducts==true}">
		<jsp:include page="product.jsp"></jsp:include>
	</c:if>



</body>
</html>