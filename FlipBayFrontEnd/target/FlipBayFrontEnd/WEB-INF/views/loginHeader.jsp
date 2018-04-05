<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>FlipBay.com</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
#flipkart-navbar { background-color: #2874f0; color: #FFFFFF; } .row1{
padding-top: 10px; } .row2 { padding-bottom: 20px; padding-right:0px;padding-left:-120px; }

.flipkart-navbar-input { padding: 11px 16px; border-radius: 2px 0 0 2px;
border: 0 none; outline: 0 none; font-size: 15px; }

.flipkart-navbar-button { background-color: #ffe11b; border: 1px solid
#ffe11b; border-radius: 0 2px 2px 0; color: #565656; padding: 10px 0;
height: 43px; cursor: pointer; } .cart-button { background-color:
#2469d9; box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .23), inset 1px 1px 0 0
hsla(0, 0%, 100%, .2); padding: 10px 0; text-align: center; height:
41px; border-radius: 2px; font-weight: 500; width: 120px; display:
inline-block; color: #FFFFFF; text-decoration: none; color: inherit;
border: none; outline: none; } .cart-button:hover{ text-decoration:
none; color: #fff; cursor: pointer; } .cart-svg { display: inline-block;
width: 16px; height: 16px; vertical-align: middle; margin-right: 8px; }

.item-number { border-radius: 3px; background-color: rgba(0, 0, 0, .1);
height: 20px; padding: 3px 6px; font-weight: 500; display: inline-block;
color: #fff; line-height: 12px; margin-left: 10px; } .upper-links {
display: inline-block; padding: 0 11px; line-height: 23px; font-family:
'Roboto', sans-serif; letter-spacing: 0; color: inherit; border: none;
outline: none; font-size: 12px; } .dropdown { position: relative;
display: inline-block; margin-bottom: 0px; } .dropdown:hover {
background-color: #fff; } .dropdown:hover .links { color: #000; }

.dropdown:hover .dropdown-menu { display: block; } .dropdown
.dropdown-menu { position: absolute; top: 100%; display: none;
background-color: #fff; color: #333; left: 0px; border: 0;
border-radius: 0; box-shadow: 0 4px 8px -3px #555454; margin: 0;
padding: 0px; } .links { color: #fff; text-decoration: none; }

.links:hover { color: #fff; text-decoration: none; } .profile-links {
font-size: 12px; font-family: 'Roboto', sans-serif; border-bottom: 1px
solid #e9e9e9; box-sizing: border-box; display: block; padding: 0 11px;
line-height: 23px; } .profile-li{ padding-top: 2px; } .largenav {
display: none; } .smallnav{ display: block; } .smallsearch{ margin-left:
15px; margin-top: 15px; } .menu{ cursor: pointer; } @media screen and
(min-width: 768px) { .largenav { display: block;} .smallnav{ display:
none; } .smallsearch{ margin: 0px; } } /*Sidenav*/ .sidenav { height:
100%; width: 0; position: fixed; z-index: 1; top: 0; left: 0;
background-color: #fff; overflow-x: hidden; transition: 0.5s;
box-shadow: 0 4px 8px -3px #555454; padding-top: 0px; } .sidenav a {
padding: 8px 8px 8px 32px; text-decoration: none; font-size: 25px;
color: #818181; display: block; transition: 0.3s } .sidenav .closebtn {
position: absolute; top: 0; right: 25px; font-size: 36px; margin-left:
50px; color: #fff; } @media screen and (max-height: 450px) { .sidenav a
{font-size: 18px;} } .sidenav-heading{ font-size: 36px; color: #fff; }
</style>
</head>
<body>
	<link href="https://fonts.googleapis.com/css?family=Roboto"
		rel="stylesheet">
	<div id="flipkart-navbar">
		<div class="container">
			<div class="row row1">
				<ul class="largenav pull-right">
				<li class="upper-links"><a class="links"
							>Welcome: ${welcomeMessage}</a>
							 </li>
				
					<c:if test="${isAdmin!=true}">
						<li class="upper-links"><a class="links"
							href="/FlipBayFrontEnd/">Home</a></li>
					</c:if>
					<c:if test="${isAdmin==true}">
						<li class="upper-links"><a class="links"
							href="/FlipBayFrontEnd/">Admin Home</a></li>
					</c:if>
					<li class="upper-links"><a class="links"
						href="#">About us</a></li>
					<li class="upper-links"><a class="links"
						href="#">Contact us</a></li>
					<li class="upper-links"><a class="links"
						href="viewAllProducts">All products</a></li>
						<c:if test="${userLoggedIn!=true}">
					<li class="upper-links"><a class="links"
						href="registration">Register now!</a></li>
					<li class="upper-links"><a class="links"
						href="login">Login</a></li>
						</c:if>
						<c:if test="${userLoggedIn==true}">
					<li class="upper-links"><a class="links"
						href="editProfile">Edit profile</a></li>
					<li class="upper-links"><a class="links"
						href="logout">Logout</a></li>
						</c:if>
					
				<!-- 	<li class="upper-links dropdown"><a class="links"
						href="http://clashhacks.in/">Dropdown</a>
						<ul class="dropdown-menu">
							<li class="profile-li"><a class="profile-links"
								href="http://yazilife.com/">Link</a></li>
							<li class="profile-li"><a class="profile-links"
								href="http://hacksociety.tech/">Link</a></li>
							<li class="profile-li"><a class="profile-links"
								href="http://clashhacks.in/">Link</a></li>
							<li class="profile-li"><a class="profile-links"
								href="http://clashhacks.in/">Link</a></li>
							<li class="profile-li"><a class="profile-links"
								href="http://clashhacks.in/">Link</a></li>
							<li class="profile-li"><a class="profile-links"
								href="http://clashhacks.in/">Link</a></li>
							<li class="profile-li"><a class="profile-links"
								href="http://clashhacks.in/">Link</a></li>
						</ul></li> -->
				</ul>
			</div>
			<div class="row row2">
				<div class="col-sm-2">
					<h2 style="margin: 0px;">
						<span class="smallnav menu" onclick="openNav()">FlipBay</span>
					</h2>
					<h1 style="margin: 10px;">
						<span class="largenav">FlipBay</span>
					</h1>
				</div>
				<div class="flipkart-navbar-search smallsearch col-sm-8 col-xs-11">
					<div class="row">
						<input class="flipkart-navbar-input col-xs-11" type=""
							placeholder="Search for Products, Brands and more" name="">
						<button class="flipkart-navbar-button col-xs-1">
							<svg width="15px" height="15px"> <path
								d="M11.618 9.897l4.224 4.212c.092.09.1.23.02.312l-1.464 1.46c-.08.08-.222.072-.314-.02L9.868 11.66M6.486 10.9c-2.42 0-4.38-1.955-4.38-4.367 0-2.413 1.96-4.37 4.38-4.37s4.38 1.957 4.38 4.37c0 2.412-1.96 4.368-4.38 4.368m0-10.834C2.904.066 0 2.96 0 6.533 0 10.105 2.904 13 6.486 13s6.487-2.895 6.487-6.467c0-3.572-2.905-6.467-6.487-6.467 "></path>
							</svg>
						</button>
					</div>
				</div>
										<c:if test="${userLoggedIn==true}">
				
				<div class="cart largenav col-sm-2">
					<a class="cart-button" href="cart"> <svg class="cart-svg " width="16 "
							height="16 " viewBox="0 0 16 16 "> <path
							d="M15.32 2.405H4.887C3 2.405 2.46.805 2.46.805L2.257.21C2.208.085 2.083 0 1.946 0H.336C.1 0-.064.24.024.46l.644 1.945L3.11 9.767c.047.137.175.23.32.23h8.418l-.493 1.958H3.768l.002.003c-.017 0-.033-.003-.05-.003-1.06 0-1.92.86-1.92 1.92s.86 1.92 1.92 1.92c.99 0 1.805-.75 1.91-1.712l5.55.076c.12.922.91 1.636 1.867 1.636 1.04 0 1.885-.844 1.885-1.885 0-.866-.584-1.593-1.38-1.814l2.423-8.832c.12-.433-.206-.86-.655-.86 "
							fill="#fff "></path> </svg> Cart <span class="item-number ">(${cartSize})</span>
					</a>
				</div>
				</c:if>
			</div>
		</div>
	</div>
	<div id="mySidenav" class="sidenav">
						<c:if test="${isAdmin!=true}">
	
		<div class="container"
			style="background-color: #2874f0; padding-top: 10px;">
			<span class="sidenav-heading">Home</span> <a
				href="javascript:void(0)" class="closebtn" onclick="closeNav()">�</a>
		</div>
		</c:if>
							<c:if test="${isAdmin==true}">
		
		<div class="container"
			style="background-color: #2874f0; padding-top: 10px;">
			<span class="sidenav-heading">Admin Home</span> <a
				href="javascript:void(0)" class="closebtn" onclick="closeNav()">�</a>
		</div>
		</c:if>
		<a href="http://clashhacks.in/">About us</a>
		 <a href="http://clashhacks.in/">Contact us</a>
		 <a href="http://clashhacks.in/">All Products</a>
	</div>

</body>
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "70%";
    // document.getElementById("flipkart-navbar").style.width = "50%";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.body.style.backgroundColor = "rgba(0,0,0,0)";
}
</script>
</html>











<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
  
  <ul class="nav navbar-nav navbar-left">
  <c:if test="${isAdmin==true}">
      <li><a href="/FlipBayFrontEnd/"><span class="glyphicon glyphicon-home"></span> Admin Home</a></li>
      </c:if>
      <c:if test="${isAdmin!=true}">
       <li><a href="/FlipBayFrontEnd/"><span class="glyphicon glyphicon-home"></span> Home</a></li>
       </c:if>
       <li><a href="#"><span class="glyphicon glyphicon-cog"></span> About Us</a></li>
       <li><a href="#"><span class="glyphicon glyphicon-envelope"></span> Contact us</a></li>
       <li><a href="#"><span class="glyphicon glyphicon-comment"></span> Feedback</a></li>
       
      <li><a href="viewAllProducts"> Products</a></li>
     
    </ul>
    
    
    
    <ul class="nav navbar-nav navbar-right">
    <c:if test="${userLoggedIn!=true}">
      <li><a href="registration"><span class="glyphicon glyphicon-user"></span> Register</a></li>
      <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </c:if>
      <c:if test="${userLoggedIn==true}">
      <li><a href="editProfile"><span class="glyphicon glyphicon-user"></span> Edit Profile</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span>MyCart(${cartSize}) </a></li>
      
      <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </c:if>
    </ul>
  </div>
</nav>
  


</body>
</html> --%>