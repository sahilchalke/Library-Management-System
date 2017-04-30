package bean;

public class Invoice {
	String useremail;
	String bookName;
	String bookIsbn;
	String fine;
	String date;
	public Invoice(String useremail, String bookName, String bookIsbn, String fine, String date) {
		super();
		this.useremail = useremail;
		this.bookName = bookName;
		this.bookIsbn = bookIsbn;
		this.fine = fine;
		this.date = date;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookIsbn() {
		return bookIsbn;
	}
	public void setBookIsbn(String bookIsbn) {
		this.bookIsbn = bookIsbn;
	}
	public String getFine() {
		return fine;
	}
	public void setFine(String fine) {
		this.fine = fine;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	
}
