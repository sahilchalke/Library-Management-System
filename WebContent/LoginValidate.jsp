
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="database.MySqlJDBC"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String email = request.getParameter("email");
		String pass = request.getParameter("psw");
		String role = null;
			MySqlJDBC mysql = new MySqlJDBC();
			role = mysql.getUserData(email, pass);
			if(role.equals("student")){
				response.sendRedirect("UserHome.jsp");
				session.setAttribute("email", email);
			}
			if(role.equals("staff")){
				response.sendRedirect("StaffHome.jsp");
				session.setAttribute("email", email);
			}
			if(role.equals("admin")){
				response.sendRedirect("AdminHome.jsp");
				session.setAttribute("email", email);
			}
	%>
</body>
</html>
