package common;

import java.io.FileReader;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JdbcTemplate {
	private JdbcTemplate() {}
	
	// static 메소드로 만들기
	  public static Connection getSemiConnection(boolean isLocalhost) throws Exception {
	        Connection conn = null;
	        Properties prop = new Properties();
	        try {
	            // 프로퍼티 파일에서 JDBC 정보를 읽어옴
	            String currentPath = JdbcTemplate.class.getResource("../").getPath();
	            prop.load(new FileReader(currentPath + "common/driver.properties"));

	            // JDBC 드라이버 로드
	            Class.forName(prop.getProperty("jdbc.driver"));

	            // 로컬 또는 서버에 연결
	            if (isLocalhost) {
	                conn = DriverManager.getConnection(
	                        prop.getProperty("jdbc.url"),
	                        prop.getProperty("jdbc.username"),
	                        prop.getProperty("jdbc.password")
	                );
	            } else {
	                conn = DriverManager.getConnection(
	                        prop.getProperty("jdbc.dbserver.url"),
	                        prop.getProperty("jdbc.username"),
	                        prop.getProperty("jdbc.password")
	                );
	            }

	            if (conn != null) {
	                System.out.println("Connection successful");
	            } else {
	                System.out.println("Connection failed!");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return conn;
	    }
	
	
	public static Connection getConnection() {
		Connection conn = null;
		Properties prop = new Properties();
		//TODO
		try {
			String currentPath = JdbcTemplate.class.getResource("./").getPath(); 

			prop.load(new FileReader(currentPath+"driver.properties"));
			Class.forName(prop.getProperty("jdbc.driver"));
			conn = DriverManager.getConnection(prop.getProperty("jdbc.url")
											, prop.getProperty("jdbc.username")
											, prop.getProperty("jdbc.password"));
			
			if(conn != null) System.out.println("연결성공"); else System.out.println("연결실패!!!!!!!!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static void autoCommit(Connection con, boolean autocommit) {
		try {
			if(con!=null) con.setAutoCommit(autocommit);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void commit(Connection con) {
		try {
			if(con!=null) con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection con) {
		try {
			if(con!=null) con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Connection con) {
		try {
			if(con != null) con.close();
		} catch (Exception e) {
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt != null) stmt.close();
		} catch (Exception e) {
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs != null) rs.close();
		} catch (Exception e) {
		}
	}
	
}