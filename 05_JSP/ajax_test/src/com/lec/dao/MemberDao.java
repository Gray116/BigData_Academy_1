package com.lec.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
	public static final int EXISTANT = 0;
	public static final int NONEXISTANT = 1;
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	private static MemberDao INSTANCE;
	public static MemberDao getInstance() {
		if(INSTANCE == null) {
			INSTANCE = new MemberDao();
		}
		return INSTANCE;
	}
	
	private MemberDao() {
		try {
			Class.forName(driver); // 2단계 - 드라이버 로드
			
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage() + "드라이버 오류");
		} 
	} // 매개변수로 id를 받아서 중복체크
	
	public int idConfir(String id) {
		int result = EXISTANT;
		String sql = "SELECT *" + 
				"    FROM MEMBER" + 
				"    WHERE ID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = EXISTANT;
			} else {
				result = NONEXISTANT;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return result;
	}
}





















