<%@page import="bean.Registration"%>
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

<% String username = request.getParameter("username");
	MySqlJDBC mysql = new MySqlJDBC();
	ArrayList<Registration> reg= new ArrayList<Registration>();
	reg = mysql.selectRegistrationInfo(username);
	for(Registration r : reg){
%>

	<div id="login_container">
							<li>
                 <%-- <div class="image"> <img src="<%=p.getImagePath() %>" alt="" style="width: 150px; height: 150px;"/></div> --%>
                 <br><p> Login Name : <span><%= r.getLogin_name() %></span>
                 <br><p> Login Email : <span><%= r.getLogin_email() %></span>
                 <br><p> Phone: <span><%= r.getPhone() %></span>
                 <br><p> Role: <span><%= r.getRole() %></span>
                  <form class = 'submit-button' method = 'post' action = 'UpdateStudentInfo.jsp'>
                  		 <input type='hidden' name = 'loginName' value = '<%=r.getLogin_name()%>' />
			            <input type='hidden' name = 'loginEmail' value = '<%=r.getLogin_email()%>' />
			             <input type='hidden' name = 'phone' value = '<%=r.getPhone()%>' />
			             <input type='hidden' name = 'role' value = '<%=r.getRole()%>' />
			             			           
			            <input class = 'submit-button' type = 'submit'  value = 'Update Info' style="margin-left: 45px; width: 100px; height: 30px;"/>
			        </form>
               </li>
							
						</div>
						<% } %>
	
</body>
</html>