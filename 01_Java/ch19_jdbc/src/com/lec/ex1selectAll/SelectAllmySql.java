package com.lec.ex1selectAll;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SelectAllmySql {
	public static void main(String[] args) {
		String driver = "com.mysql.cj.jdbc.Driver"; // mysql 8.0 드라이버
		String url = "jdbc:mysql://localhost:3306/GrayDB?serverTimezone=UTC";
		Connection conn = null;
		Statement stmt = null; 
		ResultSet rs = null;
		
		String sql = "SELECT * FROM PERSONAL";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "root", "mysql");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);			
			
			System.out.println("사번\t 이름\t 직책\t 상사사번\t 입사일\t 급여\t 상여\t 부서번호");
			while (rs.next()) {
				int pno = rs.getInt("pno");
				String 	pname 		= rs.getString("pname");
				String 	job 		= rs.getString("job");
				int 	mgrno 		= rs.getInt("mgrno");
				Date 	startdate 	= rs.getDate("startdate");
				int 	pay 		= rs.getInt("pay");
				int 	bonus 		= rs.getInt("bonus");
				int 	deptno 		= rs.getInt("deptno");
				
				System.out.printf("%d\t %s\t %s %d\t %TF\t %d\t %d\t %d\n",
									pno, pname, job, mgrno, startdate, pay, bonus, deptno);	
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {}
		} // finally
	} // main
} // class
























