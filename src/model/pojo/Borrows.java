package model.pojo;
import java.sql.Date;
public class Borrows {
	private String bookcode;    //书本ID
	private String bookname;	//书本名称
	private String bookauthor; 	//书本作者
	private String borrroweraccount; //借阅者账号
	private String borrowername;//借阅者名字
	private String borrowerphone;//借阅者电话
	private int userid;			 //借阅者id
	private Date borrowerdate;	 //借阅日期
	private int freeday;		//免费时间
	private boolean overstate;  //是否超时
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
	public String getBorrroweraccount() {return borrroweraccount;}
	public void setBorrroweraccount(String borrroweraccount) {this.borrroweraccount = borrroweraccount;}
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
