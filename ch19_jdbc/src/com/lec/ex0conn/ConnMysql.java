package com.lec.ex0conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnMysql {
	public static void main(String[] args) {
		String driver = "com.mysql.cj.jdbc.Driver"; // mysql 8.0 드라이버
		String url = "jdbc:mysql://localhost:3306/GrayDB?serverTimezone=UTC";
		Connection conn = null; // DB연결 변수
		
		try {
			Class.forName(driver);
			System.out.println("드라이버 로드 성공");
			
			conn = DriverManager.getConnection(url, "root", "mysql");
			System.out.println("MySQL 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage() + "드라이버 오류");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "SQL 오류");
		} finally {
			try {
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
}