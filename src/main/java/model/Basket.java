package model;

public class Basket {
	private String bUserId;
	private int capacity;
	private int counter;
	
	public Basket() {
	}
	
	public String getBUserId() {
		return bUserId;
	}
	
	public void setBUserId(String bUserId) {
		this.bUserId = bUserId;
	}
	
	public int getCapacity() {
		return capacity;
	}
	
	public int getCounter() {
		return counter;
	}
	
	public void setCounter(int counter) {
		this.counter = counter;
	}
}