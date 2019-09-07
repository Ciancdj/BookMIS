package model.pojo;


public class Books {
	private String bookid;
	private String bookname;
	private String bookauthor;
	// 出版社
	private String bookpress;
	// 书本介绍
	private String bookintro;
	// 书本分类
	private String bookclassify;
	// 书本价格
	private double bookprice;
	// 书本中图法id
	private String bookclassifyid;
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
	public String getBookintro() {
		return bookintro;
	}
	public void setBookintro(String bookintro) {
		this.bookintro = bookintro;
	}
	public String getBookpress() {
		return bookpress;
	}
	public void setBookpress(String bookpress) {
		this.bookpress = bookpress;
	}
	public String getBookclassify() {
		return bookclassify;
	}
	public void setBookclassify(String bookclassify) {
		this.bookclassify = bookclassify;
	}
	public String getBookclassifyid() {
		return bookclassifyid;
	}
	public void setBookclassifyid(String bookclassifyid) {
		this.bookclassifyid = bookclassifyid;
	}
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public double getBookprice() {
		return bookprice;
	}
	public void setBookprice(double bookprice) {
		this.bookprice = bookprice;
	}
}
