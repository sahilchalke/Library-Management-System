<%@page import="bean.Books"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="bean.User, database.MySqlJDBC, java.util.Map,java.util.HashMap, java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>IllinoisTech Sporting Goods</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--[if lte IE 6]><style type="text/css" media="screen">.tabbed { height:420px; }</style><![endif]-->
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery.slide.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
<script src="js/Ajax.js" type="text/javascript"></script>
</head>
<body onload="init()">
<div id="body">
<%
	
    MySqlJDBC mysql = new MySqlJDBC();
%>
<!-- Top -->
<div id="top">
  <div class="shell">
    <!-- Header -->
    <div id="header">
      <h1 id="logo"><a href="UserHome.jsp">IllinoisTech Sporting Goods</a></h1>
      <div id="navigation">
        <ul>
          <li><a href="UserHome.jsp">Home</a></li>
          <li><a href="#">Support</a></li>
          <li><a href="MyOrders.html">My Orders</a></li>
          <li><a href="#">Contact</a></li>
          <li><a href="index.jsp?value=logout">Logout</a></li>
        </ul>
      </div>
    </div>
    <!-- End Header -->
    <!-- Slider -->
    <div id="slider">
      <div id="slider-holder">
        <ul>
          <li><a href="#"><img src="css/images/slide1.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/slide2.jpg" alt="" /></a></li>
          <!--<li><a href="#"><img src="css/images/slide1.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/slide2.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/slide1.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/slide2.jpg" alt="" /></a></li>-->
        </ul>
      </div>
      <div id="slider-nav"> <a href="#" class="prev">Previous</a> <a href="#" class="next">Next</a></div>
    </div>
    <!-- End Slider -->
  </div>
</div>
<!-- Top -->
<!-- Main -->
<div id="main">
  <div class="shell">
    <!-- Search, etc -->
    <div class="options">
    <div style="float: left; margin-top: 10px; padding-right: 7px;">
    	 <p>Search IllinoisTech</p>
      </div>
      <div class="search">
      		<div>
      			<span class="field">	
				<input type="text" class="blink" name="searchId" id="searchId" onkeyup="doCompletion()" value="  Search here.." autocomplete="on"/>
				</span>
				<input type="text" class="search-submit" value="GO" />
			</div>	
			<div id="autocompleteContainer" style="height: auto; float: top; margin-top: 25px;">
					<table id="complete-table" 
					style="position: absolute; border-collapse: collapse; background: white; font-size: 14px; width: 195px; z-index: 1">
					</table>
			</div>	
	  </div>
      <div style="float: left; margin-top: 10px; margin-left:220px; padding-right: 10px; width: 150px:">
      
      </div>
      <div class="right" style="float: left; margin-left:30px"> 
      	<span class="cart"><a href="ViewCart.jsp" class="cart-ico">&nbsp;</a><strong>$0.00</strong></span> 
      	<span class="left more-links"> <a href="UserHome.jsp">Products</a></span>
      </div>
    </div>
    
    <!-- End Search, etc -->
    <!-- Content -->
     <div id="content"> 
     
     <%
     
     String username = session.getAttribute("email").toString();
   //  System.out.println(username);
     String login_name = mysql.getUser(username);
  //   System.out.println(login_name); 
     %>
    
    <font size="10" color="red">Welcome <%=login_name %></font>
    <br/>
    <br/>
    <br/>
    <form action="BookInfo.jsp" method="post">
       <br/><font size="8" color="black">select your Subject:</font>
       <br/>
       <br/>
       <br/>
        <input type="radio" name=myradio value="Science" /><font size="8" color="black">Science </font>
        <br/>
       <br/>
       <br/>
        <input type="radio" name=myradio value="Maths" /><font size="8" color="black">Maths </font>
        <br/>
       <br/>
       <br/>
        <input type="radio" name=myradio value="Psychology" /><font size="8" color="black">Psychology </font>
      <br/>
      <br/>
      <br/>
      <button type="submit"><font size="6" color="black">Submit</font></button>
      <input type='hidden' name = 'username' value = '<%=username%>' />
      <input type='hidden' name = 'loginName' value = '<%=login_name%>' />
        </form>
        
        
			        
		 <form class = 'submit-button' method = 'post' action = 'ViewStudentInfo.jsp'>                  		 			           
			            <input class = 'submit-button' type = 'submit'  value = 'View Student Information' style="margin-left: 45px; width: 500px; height: 50px;"/>
			       	<input type='hidden' name = 'username' value = '<%=username%>' /> 
			        </form>
			        	        
		<form class = 'submit-button' method = 'post' action = 'ViewCheckoutBooks.jsp'>                  		 			           
			            <input class = 'submit-button' type = 'submit'  value = 'View Checkout Books' style="margin-left: 45px; width: 500px; height: 50px;"/>
			       		<input type='hidden' name = 'username' value = '<%=username%>' />
			        </form>
			        
      </div>
      <!-- End Container -->
    </div>
    <!-- End Content -->
  </div>
</div>
</div>

<!-- End Main -->
</body>
</html>