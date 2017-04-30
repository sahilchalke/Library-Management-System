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

	String bookRole = request.getParameter("BookFunction");
	//System.out.println(bookRole);
	 if (bookRole.equals("AddBook")){
	%>
	
							<div id="login_container">
							<form action='AddBooksToDB.jsp' method="">
								<div align="center">
									<h2>Book To Added</h2><br><br>
								</div>
								<label><b>Subject:</b></label>
								<br>
								<div class="form-group">
								 <select name="category" id="sel1">
										<option value=Science>Science</option>
										<option value=Maths>Maths</option>
										<option value=Psychology>Psychology</option>
										<option value=History>History</option>
										<option value=Geography>Geography</option>
									</select>
								</div>
								<br>

								<label><b>Book ID:</b></label><br> <input type="text"
									placeholder="Enter Book Id" name="bid" id="bid" required><br>

								<label><b>Book Name:</b></label><br> <input type="text"
									placeholder="Enter Book Name" name="bookName" id="bookNAme" required><br>

								<label><b>Author Name:</b></label><br> <input type="text"
									placeholder="Enter Author Name" name="authorName" id="authorName" required><br>
								
								<label><b>Book ISBN:</b></label><br> <input type="text"
									placeholder="Enter Book ISBN" name="bookIsbn" id="bookIsbn" required><br>

								<label><b>Fine:</b></label><br> <input type="text"
									placeholder="Enter Fine" name="fine" id="fine" required><br>

								<label><b>Count:</b></label><br> <input type="text"
									placeholder="Enter Count" name="count" id="count" required><br> 
								<button type="submit">Add Book</button>
								
								<br>
							</form>
							
						</div>
	
	<% 	 
	 }
	 %>

<%
MySqlJDBC mysql = new MySqlJDBC();
if (bookRole.equals("UpdateBook")){
	
	ArrayList<String> bList= new ArrayList<String>();
	bList = mysql.selectBookList();
	%>
	
							<div id="login_container">
							<form action='UpdateBooksToDB.jsp' method="">
								<div align="center">
									<h2>Book to Update</h2><br><br>
								</div>
								<label><b>Book Name :</b></label>
								<br>
								
								<div class="form-group">
								 <select name="bookName" id="sel1">
								 <%
									for(String bookList : bList){
								%>
										<option value=<%= bookList %>><%=bookList%></option>
										<%} %>
									</select>
								</div>
								<br>

																
								<label><b>Book ISBN:</b></label><br> <input type="text"
									placeholder="Enter Book ISBN" name="bookIsbn" id="bookIsbn" required><br>

								<label><b>Fine:</b></label><br> <input type="text"
									placeholder="Enter Fine" name="fine" id="fine" required><br>

								 
								<button type="submit">Update Book</button>
								
								<br>
							</form>
							
						</div>
	
	<% 	 
	 }
	 %>



<%

if (bookRole.equals("DeleteBook")){
	
	ArrayList<String> bList= new ArrayList<String>();
	bList = mysql.selectBookList();
	%>
	
							<div id="login_container">
							<form action='DeleteBooksToDB.jsp' method="">
								<div align="center">
									<h2>Choose book to be deleted</h2><br><br>
								</div>
								<label><b>Book Name :</b></label>
								<br>
								
								<div class="form-group">
								 <select name="bookName" id="sel1">
								 <%
									for(String bookList : bList){
								%>
										<option value=<%= bookList %>><%=bookList%></option>
										<%} %>
									</select>
								</div>
								<br/>							 
								<button type="submit">Delete Book</button>
								
								<br>
							</form>
							
						</div>
	
	<% 	 
	 }
	 %>


</body>
</html>