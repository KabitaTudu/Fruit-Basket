package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import model.Fruit;
import util.DBConnection;

public class FruitDAO {
	public boolean addFruit(Fruit fruit) {
		try {
			Connection conn = DBConnection.getConnection();
			
			String sql = "INSERT INTO fruit(user_id, fruit_name, price, quantity) VALUES(?, ?, ?, ?);";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, fruit.getUserId());
			ps.setString(2, fruit.getFruitName());
			ps.setDouble(3, fruit.getPrice());
			ps.setInt(4, fruit.getQuantity());
			
			int rows = ps.executeUpdate();
			
			conn.close();
			
			return rows > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}