package com.connection;

import java.sql.*;


public class ConnectionProvider {

	public static Connection getConnection() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshoppingdata","root","root");
			
			return connection;
		}
		
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return  null;
		}
	}
}
