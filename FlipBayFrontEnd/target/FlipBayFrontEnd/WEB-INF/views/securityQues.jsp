<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div>
<center><b>Your Security question is:
${securityQuestion}</b></center>

</div>


<form action="checkQues" method="post">
  

  <div class="container">
    <label for="SecurityAnswer"><b>SecurityAnswer</b></label>
    <input type="text" placeholder="Enter Your Answer" name="SecurityAnswer" required>

<button type="submit">Submit</button></div></form>


</body>

</body>
</html>