package db;

import java.sql.*;

public class ConnectionProvider {

	public static Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingjsp","root","root");
			return conn;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.print(e);
			return null;
		}
		
	}
}
	