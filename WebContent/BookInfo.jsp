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
<%
MySqlJDBC mysql = new MySqlJDBC();
String username = request.getParameter("username");
String login_name = request.getParameter("loginName");
	String subject = request.getParameter("myradio");
	//System.out.println(subject);
		if(subject.equals("Science")){
		ArrayList<Books> science= new ArrayList<Books>();
       science = mysql.selectProducts("Science");
       
   //    System.out.println(username + login_name);
       %>
       <div id="container">
       <div class="tabbed">
         <!-- First Tab Content -->
         <div class="tab-content" style="display:block;">
           <div class="items">
             <div class="cl">&nbsp;</div>
             
             <ul>
              <% 
             	for(Books p : science){
             %>
               <li>
                 <%-- <div class="image"> <img src="<%=p.getImagePath() %>" alt="" style="width: 150px; height: 150px;"/></div> --%>
                 <br><p> Book Name : <span><%= p.getBookName() %></span>
                 <br><p> Author Name : <span><%= p.getAuthorName() %></span>
                 <br><p> ISBN: <span><%= p.getBookISBN() %></span>
                 
                  <form class = 'submit-button' method = 'post' action = 'BookRequest.jsp'>
                  		 <input type='hidden' name = 'bookId' value = '<%=p.getBookId()%>' />
			            <input type='hidden' name = 'authorName' value = '<%=p.getAuthorName()%>' />
			             <input type='hidden' name = 'bookISBN' value = '<%=p.getBookISBN()%>' />
			             <input type='hidden' name = 'bookName' value = '<%=p.getBookName()%>' />
			             <input type='hidden' name = 'bookFine' value = '<%=p.getFine()%>' />
			             <input type='hidden' name = 'category' value = '<%=p.getCategory()%>' />
			             <input type='hidden' name = 'login_name' value = '<%=login_name%>' />
			             <input type='hidden' name = 'username' value = '<%=username%>' />			           
			            <input class = 'submit-button' type = 'submit'  value = 'Request to Rent' style="margin-left: 45px; width: 100px; height: 30px;"/>
			        </form>
               </li>
             <%}
		}
             %>
             </ul>
             <div class="cl">&nbsp;</div>
           </div>
         </div>
	<!-- Second Tab Content -->
	 <div id="container">
       <div class="tabbed">
         <div class="tab-content" style="display:block;">
           <div class="items">
             <div class="cl">&nbsp;</div>
             
             <ul>
              <% 
               if(subject.equals("Maths")){
          		ArrayList<Books> maths= new ArrayList<Books>();
          		maths = mysql.selectProducts("Maths");
             	%>
          		 <div id="container">
       <div class="tabbed">
         
         <div class="tab-content" style="display:block;">
           <div class="items">
             <div class="cl">&nbsp;</div>
             
             <ul>
          		<% 
          		for(Books p : maths){
             %>
               <li>
                 <%-- <div class="image"> <img src="<%=p.getImagePath() %>" alt="" style="width: 150px; height: 150px;"/></div> --%>
                 <br><p> Book Name : <span><%= p.getBookName() %></span>
                 <br><p> Author Name : <span><%= p.getAuthorName() %></span>
                 <br><p> ISBN: <span><%= p.getBookISBN() %></span>
                 
                 <form class = 'submit-button' method = 'post' action = 'BookRequest.jsp'>
                  		 <input type='hidden' name = 'bookId' value = '<%=p.getBookId()%>' />
			            <input type='hidden' name = 'authorName' value = '<%=p.getAuthorName()%>' />
			             <input type='hidden' name = 'bookISBN' value = '<%=p.getBookISBN()%>' />
			             <input type='hidden' name = 'bookName' value = '<%=p.getBookName()%>' />
			             <input type='hidden' name = 'bookFine' value = '<%=p.getFine()%>' />
			             <input type='hidden' name = 'category' value = '<%=p.getCategory()%>' />
			             <input type='hidden' name = 'login_name' value = '<%=login_name%>' />
			             <input type='hidden' name = 'username' value = '<%=username%>' />			           
			            <input class = 'submit-button' type = 'submit'  value = 'Request to Rent' style="margin-left: 45px; width: 100px; height: 30px;"/>
			        </form>
               </li>
             <%}
              }
             %>
             </ul>
             <div class="cl">&nbsp;</div>
           </div>
         </div>
		<!-- Third Tab Content -->
		 <div id="container">
       <div class="tabbed">
         <div class="tab-content" style="display:block;">
           <div class="items">
             <div class="cl">&nbsp;</div>
             
             <ul>
              <% 
               if(subject.equals("Psychology")){
            		ArrayList<Books> psy= new ArrayList<Books>();
            		psy = mysql.selectProducts("Psychology");
               	
            %>
             <div id="container">
       <div class="tabbed">
         <!-- First Tab Content -->
         <div class="tab-content" style="display:block;">
           <div class="items">
             <div class="cl">&nbsp;</div>
             
             <ul>
            <% 		
            		for(Books p : psy){
             %>
               <li>
                 <%-- <div class="image"> <img src="<%=p.getImagePath() %>" alt="" style="width: 150px; height: 150px;"/></div> --%>
                 <br><p> Book Name : <span><%= p.getBookName() %></span>
                 <br><p> Author Name : <span><%= p.getAuthorName() %></span>
                 <br><p> ISBN: <span><%= p.getBookISBN() %></span>
                 
                  <form class = 'submit-button' method = 'post' action = 'BookRequest.jsp'>
                  		 <input type='hidden' name = 'bookId' value = '<%=p.getBookId()%>' />
			            <input type='hidden' name = 'authorName' value = '<%=p.getAuthorName()%>' />
			             <input type='hidden' name = 'bookISBN' value = '<%=p.getBookISBN()%>' />
			             <input type='hidden' name = 'bookName' value = '<%=p.getBookName()%>' />
			             <input type='hidden' name = 'bookFine' value = '<%=p.getFine()%>' />
			             <input type='hidden' name = 'category' value = '<%=p.getCategory()%>' />
			             <input type='hidden' name = 'login_name' value = '<%=login_name%>' />
			             <input type='hidden' name = 'username' value = '<%=username%>' />			           
			            <input class = 'submit-button' type = 'submit'  value = 'Request to Rent' style="margin-left: 45px; width: 100px; height: 30px;"/>
			        </form>
               </li>
             <%}
               	}
              
             %>
             </ul>
             <div class="cl">&nbsp;</div>
           </div>
         </div>

</div>
</body>
</html>