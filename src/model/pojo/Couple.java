package model.pojo;

public class Couple {
	private String defination;
	private int amount;
	public Couple(String defination, int amount) {
		this.defination = defination;
		this.amount = amount;
	}
	public String getDefination() {
		return defination;
	}
	public void setDefination(String defination) {
		this.defination = defination;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
}
