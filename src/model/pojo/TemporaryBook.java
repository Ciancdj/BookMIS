
package model.pojo;

public class TemporaryBook {
	// ³ö°æÉç
	private String bookpress;
	// Ë÷ÊéºÅ
	private String bookindex;
	private String bookcode;
	private String bookname;
	private String bookauthor;
	private String bookid;
	public TemporaryBook(String bookcode, String bookname, String bookauthor, String bookindex, String bookpress, String bookid) {
		this.bookpress = bookpress;
		this.bookindex = bookindex;
		this.bookcode = bookcode;
		this.bookname = bookname;
		this.bookauthor = bookauthor;
		this.bookid = bookid;
	}
	public String getBookpress() {
		return bookpress;
	}
	public void setBookpress(String bookpress) {
		this.bookpress = bookpress;
	}
	public String getBookindex() {
		return bookindex;
	}
	public void setBookindex(String bookindex) {
		this.bookindex = bookindex;
	}
	public String getBookcode() {
		return bookcode;
	}
	public void setBookcode(String bookcode) {
		this.bookcode = bookcode;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getBookauthor() {
		return bookauthor;
	}
	public void setBookauthor(String bookauthor) {
		this.bookauthor = bookauthor;
	}
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	
}
