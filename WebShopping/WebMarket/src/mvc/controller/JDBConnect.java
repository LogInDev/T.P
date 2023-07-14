package mvc.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBConnect {
	public Connection con = null;
	public Statement stmt = null;
	public PreparedStatement psmt = null;
	public ResultSet rs = null;
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException  {		

		Connection conn = null;		
	
		String url = "jdbc:mysql://localhost:3306/webmarketdb?useSSL=false";
		String user = "root";
		String password = "rpass";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);		
		
		return conn;
	}	
	
	public JDBConnect() {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/webmarketdb?useSSL=false";
		String id = "root";
		String pwd = "rpass";
		
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, id ,pwd);
			System.out.println("conn 연결");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			System.out.println("JDBC 연결");
		} catch (Exception e) {
			
		}
	}
    
    
    
}
