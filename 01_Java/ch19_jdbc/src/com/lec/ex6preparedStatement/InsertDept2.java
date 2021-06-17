/* 부서번호를 받아 emp테이블에 존재하는 부서번호인지 확인 후 dept에서 삭제 */

package com.lec.ex6preparedStatement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertDept2 {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);
		
		String delsql = "DELETE FROM DEPT WHERE DEPTNO = ?";
		String selsql = "SELECT * FROM EMP WHERE DEPTNO = ?";
		
		System.out.print("삭제 할 부서 번호 입력 : ");
		int deptno = sc.nextInt();
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(selsql);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("해당 부서에 사원 있음, 삭제 불가");
			} else {
				System.out.println("해당 부서에 사원 없음");
				rs.close();
				pstmt.close();
				pstmt = conn.prepareStatement(delsql);
				pstmt.setInt(1, deptno);
				int result = pstmt.executeUpdate();
				
				System.out.println(result == 1? "삭제 성공" : "해당 부서번호가 존재하지 않습니다");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e2) {}
		}
		sc.close();
	}// main
} // class


















