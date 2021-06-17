package com.lec.ex6preparedStatement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class InsertDept {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		Scanner sc = new Scanner(System.in);
		
		String sql = "DELETE FROM DEPT WHERE DEPTNO = ?";
		
		System.out.print("삭제 할 부서 번호 입력 : ");
		int deptno = sc.nextInt();
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno); // 물음표 채우기
			
			int result = pstmt.executeUpdate();
			if(result > 0) {
				System.out.println(deptno + "번 부서 삭제 완료");
			} else {
				System.out.println("부서 없음");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {}
		}
		sc.close();
	}// main
} // class


















