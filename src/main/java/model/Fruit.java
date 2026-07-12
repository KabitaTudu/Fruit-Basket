package model;

public class Fruit {
	private String userId;
	private String fruitName;
	private double price;
	private int quantity;
	
	public Fruit() {
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getFruitName() {
		return fruitName;
	}
	
	public void setFruitName(String fruitName) {
		this.fruitName = fruitName;
	}
	
	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		this.price = price;
	}
	
	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}