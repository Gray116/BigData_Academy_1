package com.lec.ex0conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnMysql {
	public static void main(String[] args) {
		String driver = "com.mysql.cj.jdbc.Driver"; // mysql 8.0 ����̹�
		String url = "jdbc:mysql://localhost:3306/GrayDB?serverTimezone=UTC";
		Connection conn = null; // DB���� ����
		
		try {
			Class.forName(driver);
			System.out.println("����̹� �ε� ����");
			
			conn = DriverManager.getConnection(url, "root", "mysql");
			System.out.println("MySQL ���� ����");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage() + "����̹� ����");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "SQL ����");
		} finally {
			try {
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
}