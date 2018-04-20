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
<!-- Page Content -->
    <div class="container">

      <!-- Introduction Row -->
      <h1 class="my-4">About Us
        <small>It's Nice to Meet You!</small>
      </h1>
      <p>New business with big goals and a hardworking team of developers.</p>

      <!-- Team Members Row -->
      <div class="row">
        <div class="col-lg-12">
          <h2 class="my-4">Our Team</h2>
        </div>
        <div class="col-lg-3 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="resources/images/user avatar.jpg" alt="">
          <h3>Shivam Paul
            <small>Student</small>
          </h3>
          <p>Head Developer</p>
        </div>
        <div class="col-lg-3 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="resources/images/ceo avatar.jpg" alt="">
          <h3>John Smith
            <small>CEO</small>
          </h3>
          <p>Manages company.</p>
        </div>
        <div class="col-lg-3 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="resources/images/cto avatar.jpg" alt="">
          <h3>John Smith2
            <small>CTO</small>
          </h3>
          <p>Manages hardware.</p>
        </div>
        <div class="col-lg-3 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="resources/images/je avatar.jpg" alt="">
          <h3>John Smith3
            <small>Junior Developer</small>
          </h3>
          <p>Java Developer</p>
        </div>
		<%-- <c:forEach var="supplier" items="${allSuppliers}">
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="resources/images/suppliers/${supplier.name}.png" alt="">
          <h3>${supplier.name}
            <small>${supplier.address}</small>
          </h3>
        </div>
        </c:forEach> --%>
        
      </div>
<div class="row">
        <div class="col-lg-12">
          <h2 class="my-4">Our HardWorking Suppliers</h2>
        </div>
       <c:forEach var="supplier" items="${allSuppliers}">
        <div class="col-lg-3 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="resources/images/suppliers/${supplier.name}.png" alt="">
          <h3>${supplier.name}
            <small>${supplier.address}</small>
          </h3>
        </div>
        </c:forEach>
    </div>
    <!-- /.container -->
    
    
    
    
</body>
</html>