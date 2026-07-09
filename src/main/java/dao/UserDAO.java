package dao;
/*
 * Data Access Object: talks to the database.
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import util.DBConnection;

public class UserDAO {
	public boolean signup(User user) {
		try {
			Connection conn = DBConnection.getConnection();
			
			String sql = "INSERT INTO users(username, email, password) VALUES (?, ?, ?);";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPasswordHash());
			
			int rows = ps.executeUpdate();
			
			conn.close();
			
			return rows > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public User findByUsername(String username) {
		User user = null;
		
		try {
			Connection conn = DBConnection.getConnection();
			
			String sql = "SELECT * FROM users WHERE username=?;";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				user = new User();
				
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setPasswordHash(rs.getString("password"));
			}
			
			ps.close();
			rs.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
}