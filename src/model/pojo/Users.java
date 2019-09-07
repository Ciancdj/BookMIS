package model.pojo;

public class Users {
	private int id;
	private String account;
	private String password;
	private int power;
	private String usersname;
	private String usersphone;
	private int holday;
	private double rate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsersname() {
		return usersname;
	}
	public void setUsersname(String usersname) {
		this.usersname = usersname;
	}
	public String getUsersphone() {
		return usersphone;
	}
	public void setUsersphone(String usersphone) {
		this.usersphone = usersphone;
	}
	public int getHolday() {
		return holday;
	}
	public void setHolday(int holday) {
		this.holday = holday;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
}
