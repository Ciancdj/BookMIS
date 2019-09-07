package model.pojo;
import java.sql.Date;
public class Borrows {
	private String bookcode;
	private String bookname;
	private String bookauthor;
	private String borrowername;
	private String borrowerphone;
	private int userid;
	private Date borrowerdate;
	private int freeday;
	private boolean overstate;
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
	public String getBorrowername() {
		return borrowername;
	}
	public void setBorrowername(String borrowername) {
		this.borrowername = borrowername;
	}
	public String getBorrowerphone() {
		return borrowerphone;
	}
	public void setBorrowerphone(String borrowerphone) {
		this.borrowerphone = borrowerphone;
	}
	public Date getBorrowerdate() {
		return borrowerdate;
	}
	public void setBorrowerdate(Date borrowerdate) {
		this.borrowerdate = borrowerdate;
	}
	public int getFreeday() {
		return freeday;
	}
	public void setFreeday(int freeday) {
		this.freeday = freeday;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public boolean isOverstate() {
		return overstate;
	}
	public void setOverstate(boolean overstate) {
		this.overstate = overstate;
	}
}
