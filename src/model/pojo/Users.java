package model.pojo;

import java.util.Date;

public class Users {
	private int id;
	private String account;
	private String password;
	private int power;
	private String usersname;
	private String usersphone;
	private int holday;
	private int state;
	private double rate;
	private long lastActivityTime;
	public long getLastActivityTime() {
		return lastActivityTime;
	}
	public void setLastActivityTime(long lastActivityTime) {
		this.lastActivityTime = lastActivityTime;
	}
	public void updateLastActivityTime(){
		setLastActivityTime(System.currentTimeMillis());
	}
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
	public void setState(int state) { this.state = state; }
	public int getState() { return state; }
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
