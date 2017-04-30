package bean;

public class Orders {
	
	String bookId;
	String bookName;
	String bookISBN;	
	String fine;
	String category;
	String login_name;
	String useremail;
	String flag;
	
	public Orders(String bookId, String bookName, String bookISBN, String fine, String category, String login_name,
			String useremail, String flag) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookISBN = bookISBN;
		this.fine = fine;
		this.category = category;
		this.login_name = login_name;
		this.useremail = useremail;
		this.flag = flag;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookISBN() {
		return bookISBN;
	}

	public void setBookISBN(String bookISBN) {
		this.bookISBN = bookISBN;
	}

	public String getFine() {
		return fine;
	}

	public void setFine(String fine) {
		this.fine = fine;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLogin_name() {
		return login_name;
	}

	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
	
	
}
