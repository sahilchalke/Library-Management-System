package bean;

public class Books {
	
	String bookId;
	String bookName;
	String bookISBN;
	String authorName;
	String fine;
	String category;
	String count;
	
	public Books(){}

	public Books(String bookId, String bookName, String bookISBN, String authorName, String fine, String category,
			String count) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookISBN = bookISBN;
		this.authorName = authorName;
		this.fine = fine;
		this.category = category;
		this.count = count;
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

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
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

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}
	
	
	
}
