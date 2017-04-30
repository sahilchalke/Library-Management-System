package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import com.mysql.jdbc.PreparedStatement;

import bean.Books;
import bean.Invoice;
import bean.Orders;




public class MySqlJDBC implements DatabaseConstants {

	private static Connection conn = null;
	private static Statement stmt = null;
	private static String sqlQuery = "";

	public MySqlJDBC() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}




	public String getUserData(String email, String password){

		String name = null;
		String role = null;

		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			sqlQuery = "select * from registration where LOGIN_EMAIL = '" + email + "'" +"and LOGIN_PWD = '" + password +"'";
			ResultSet rs = stmt.executeQuery(sqlQuery);
			//	System.out.println(sqlQuery);
			while(rs.next()){
				name = rs.getString("LOGIN_NAME");
				role = rs.getString("ROLE");

			}
			//	System.out.println(name + role);
			//Close db connection.
			stmt.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return role;
	}

	public ArrayList<Books> selectProducts(String categ) {
		ArrayList<Books> prodInfo=new ArrayList<Books>();
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			sqlQuery = "Select * from book where CATEGORY = '"+categ+"'";
			ResultSet rs = stmt.executeQuery(sqlQuery);
			System.out.println(sqlQuery);
			while(rs.next()){
				if(!prodInfo.contains(rs.getString(1))){

					Books p = new Books(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
					prodInfo.add(p);
				}
			}
			//Close db connection.
			stmt.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return prodInfo;
	} 

	public String getUser(String email){
		String user = null;
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			sqlQuery = "Select LOGIN_NAME from registration where LOGIN_EMAIL = '"+email+"'";
			ResultSet rs = stmt.executeQuery(sqlQuery);
			while(rs.next()){
				user = rs.getString(1);
			}

			stmt.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return user;
	}

	public void insertOrder(String book_id, String book_name, String book_ISBN, String fine, String category, String login_name, String username){

		String flag ="0";

		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			sqlQuery = "Insert into ORDERS(BOOK_ID, BOOK_NAME, BOOK_ISBN, FINE, CATEGORY, LOGIN_NAME, USEREMAIL, FLAG) values"
					+ "('"+ book_id  +"', '"+book_name+"', '"+book_ISBN+"', '"+fine+"', '"+category+"', '"+login_name+"', '"+username+"', '"+flag+"')";
			int i = stmt.executeUpdate(sqlQuery);
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}

	public ArrayList<Orders> selectBookOrders() {


		ArrayList<Orders> orderInfo=new ArrayList<Orders>();

		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			sqlQuery = "Select * from ORDERS where FLAG='0'";
			ResultSet rs = stmt.executeQuery(sqlQuery);
			while(rs.next()){
				Orders o = new Orders(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
				orderInfo.add(o);
			}
			stmt.close();
			conn.close();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return orderInfo;
	}

	public void changeFlag(String isbn, String useremail){

		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			sqlQuery = "UPDATE ORDERS SET FLAG = '1' WHERE BOOK_ISBN = '"+isbn+"' and USEREMAIL = '"+useremail+"';";
			int i = stmt.executeUpdate(sqlQuery);
		}
		catch(SQLException e){
			e.printStackTrace();
		}

	}

	public void insertInvoice(String useremail, String bookName, String bookISBN, String fine, String date){



		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			sqlQuery = "Insert into INVOICE(USEREMAIL, BOOK_NAME, BOOK_ISBN, FINE, DATE) values"
					+ "('"+ useremail  +"', '"+bookName+"', '"+bookISBN+"', '"+fine+"', '"+date+"')";
			int i = stmt.executeUpdate(sqlQuery);
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}

	public ArrayList<Invoice> viewCheckoutBooks(String userEmail) {


		ArrayList<Invoice> chekcoutInfo=new ArrayList<Invoice>();

		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			sqlQuery = "Select * from INVOICE where useremail = '"+userEmail+"'";
			ResultSet rs = stmt.executeQuery(sqlQuery);
			while(rs.next()){
				Invoice i = new Invoice(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				chekcoutInfo.add(i);
			}
			stmt.close();
			conn.close();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return chekcoutInfo;
	}

	public void insertBook(String bookId, String bookName, String bookISBN, String authorName, String fine, String category, String count){



		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			sqlQuery = "Insert into BOOK(BOOK_ID, BOOK_NAME, BOOK_ISBN, AUTHOR_NAME, FINE, CATEGORY, COUNT) values"
					+ "('"+ bookId  +"', '"+bookName+"', '"+bookISBN+"', '"+authorName+"', '"+fine+"', '"+category+"', '"+count+"')";
			int i = stmt.executeUpdate(sqlQuery);
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}

	public ArrayList<String> selectBookList() {


		ArrayList<String> bookList=new ArrayList<String>();

		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			sqlQuery = "Select BOOK_NAME from BOOK";
			ResultSet rs = stmt.executeQuery(sqlQuery);
			while(rs.next()){
				String bookName = rs.getString(1);
				bookList.add(bookName);
			}
			stmt.close();
			conn.close();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return bookList;
	}

	public void updateBook(String bookName, String isbn, String fine){

		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			sqlQuery = "Update BOOK set BOOK_ISBN = '"+isbn+"', FINE='"+fine+"' where BOOK_NAME = '"+bookName+"'";
			int i = stmt.executeUpdate(sqlQuery);
		}
		catch(SQLException e){
			e.printStackTrace();
		}

	}
	
	public void deleteBook(String bookName){

		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			sqlQuery = "Delete from book where book_name='"+bookName+"'";
			int i = stmt.executeUpdate(sqlQuery);
		}
		catch(SQLException e){
			e.printStackTrace();
		}

	}
	
}


