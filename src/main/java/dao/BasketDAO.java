package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Basket;
import util.DBConnection;

public class BasketDAO {
	public boolean createBasket(Basket basket) {
		try {
			Connection conn = DBConnection.getConnection();
			
			String sql = "INSERT INTO basket(b_user_id) VALUES (?);";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, basket.getBUserId());
			int rows = ps.executeUpdate();
			
			conn.close();
			
			return rows > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean updateBasket(Basket basket, int updatedCounter) {
		try {
			Connection conn = DBConnection.getConnection();
			
			String sql = "UPDATE basket set counter=? WHERE b_user_id=?;";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, updatedCounter);
			ps.setString(2, basket.getBUserId());
			int rows = ps.executeUpdate();
			
			conn.close();
			return rows > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public Basket findBasket(String bUserId) {
		Basket basket = null;
		
		try {
			Connection conn = DBConnection.getConnection();
			
			String sql = "SELECT * FROM basket where b_user_id=?;";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, bUserId);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				basket = new Basket();
				
				basket.setBUserId(rs.getString("b_user_id"));
				basket.setCounter(rs.getInt("counter"));
				basket.setCapacity(rs.getInt("capacity"));
			}
			
			rs.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return basket;
	}
	
	public boolean isBasketFull(String bUserId, Basket basket, int quantityAdded) {
		if (basket.getCounter() + quantityAdded > basket.getCapacity()) {
			return true;
		}
		
		return false;
	}
}