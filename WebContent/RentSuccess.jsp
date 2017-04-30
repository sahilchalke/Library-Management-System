<%@page import="bean.Orders"%>
<%@page import="bean.Books"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="bean.User, bean.Orders, database.MySqlJDBC, java.util.*,java.io.*, java.text.*" %>
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
<br/>
<br/>
<br/>
<br/> 

<%
	String name = request.getParameter("login_name");
	MySqlJDBC mysql = new MySqlJDBC();
	String isbn = request.getParameter("bookISBN");
	String useremail = request.getParameter("username");
	mysql.changeFlag(isbn, useremail);
	
	Date date = new Date();

	DateFormat format = new SimpleDateFormat("MM/dd/YYYY");
	date.setTime(date.getTime() + 14 * 1000 * 60 * 60 * 24);
	
	DateFormat dtf = new SimpleDateFormat("MM/dd/yyyy");
	Date localDate = new Date();
	
	
%>

<font size="8" color="red">The book is successfully rented to <%=name %></font>
<br/>
<br/>

<font size="8" color="red">The return date for the book is <%= format.format(date) %></font>

<%

String bookName = request.getParameter("bookName");
String bookISBN = request.getParameter("bookISBN");
String fine = request.getParameter("bookFine");
mysql.insertInvoice(useremail, bookName, bookISBN, fine, format.format(date));
%>

</body>
</html>