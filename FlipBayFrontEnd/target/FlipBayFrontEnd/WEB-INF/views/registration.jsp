<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
</head>
<body>

<h2> Registration Page</h2>

<form:form id="registrationForm" modelAttribute="user" action="registerProcess" method="post">
                <table align="center">
                    <tr>
                        <td>
                            <form:label path="emailID">EmailID</form:label>
                        </td>
                        <td>
                            <form:input path="emailID" name="emailID" id="emailID" />
                        </td>
                    </tr>
                    <tr>
                    <tr>
                        <td>
                            <form:label path="name">Name</form:label>
                        </td>
                        <td>
                            <form:input path="name" name="name" id="name" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="password">Password</form:label>
                        </td>
                        <td>
                            <form:password path="password" name="password" id="password" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="mobile">Mobile Number</form:label>
                        </td>
                        <td>
                            <form:input path="mobile" name="mobile" id="mobile" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="securityQuestion">Security Question</form:label>
                        </td>
                        <td>
                            <form:input path="securityQuestion" name="securityQuestion" id="securityQuestion" />
                        </td>
                    </tr>
                    <tr>
                    <tr>
                        <td>
                            <form:label path="securityAnswer">Security Answer</form:label>
                        </td>
                        <td>
                            <form:input path="securityAnswer" name="securityAnswer" id="securityAnswer" />
                        </td>
                    </tr>
                    
      <%--               <select class="form-control" name="menu" id="menu">         
      <c:forEach var="categories" items="${categories}">
          <option value="${category.name}">${category.name} 
          <c:if test="${menu.name == category.name}">
           selected
           </c:if>
          </option>
      </c:forEach>
   </select> --%>
                    
                    <tr>
                        <td></td>
                        <td>
                            <form:button id="register" name="register">Register</form:button>
                        </td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td></td>
                        <td><a href="home.jsp">Home</a>
                        </td>
                    </tr>
                </table>
            </form:form>











</body>


</html>