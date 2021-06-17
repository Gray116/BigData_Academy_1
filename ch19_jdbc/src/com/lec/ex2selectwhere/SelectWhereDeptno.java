package com.lec.ex2selectwhere;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class SelectWhereDeptno {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = null; // DB���� ����
		Statement  stmt = null;
		ResultSet  rs   = null;
		
		Scanner sc = new Scanner(System.in);
		System.out.print("�μ���ȣ �Է� : ");
		int deptno = sc.nextInt();
		
		String sql = "SELECT * FROM DEPT WHERE DEPTNO = " + deptno;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			/* �ش�μ���ȣ�� �ִ��� ������ */
			if (rs.next()) {
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				
				System.out.println(deptno + "�� �μ������� ������ �����ϴ�.");
				System.out.println("�μ� �̸� : " + dname);
				System.out.println("�μ� ��ġ : " + loc);
			} else {
				System.out.println("�ش�μ� ����");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
	} // main
} // class


























