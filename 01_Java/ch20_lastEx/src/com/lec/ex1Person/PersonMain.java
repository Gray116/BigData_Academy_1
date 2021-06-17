package com.lec.ex1Person;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class PersonMain {
	public static void main(String[] args) {
		/* 1. 변수 선언 */
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Scanner sc = new Scanner(System.in);
		String fn, sql;
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		
		/* 2. 드라이버 로드 */
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
		do {
			System.out.println("1: 정보 입력, 2: 직업별 출력, 3: 전체 출력, 그외: 종료");
			System.out.print("번호 입력 : ");
			fn = sc.next();
			
			switch(fn) {
			case "1":
				System.out.print("이름 입력 : ");
				String name = sc.next();
				
				System.out.print("직업 입력(배우 or 가수 or MC만 가능) : ");
				String jname = sc.next().toUpperCase();
				
				System.out.print("국어 점수 입력 : ");
				int kor = sc.nextInt();
				
				System.out.print("영어 점수 입력 : ");
				int eng = sc.nextInt();
				
				System.out.print("수학 점수 입력 : ");
				int mat = sc.nextInt();
				
				/* 3. DB 연결 및 쿼리 실행 */
				sql = "INSERT INTO PERSON" + 
						"    VALUES (PERSON_NO_SEQ.NEXTVAL, (SELECT JNO FROM JOB WHERE JNAME = ?)," + 
						"                ?, ?, ?, ?)";
				try {
					conn = DriverManager.getConnection(url, "scott", "tiger");
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, jname);
					pstmt.setString(2, name);
					pstmt.setInt(3, kor);
					pstmt.setInt(4, eng);
					pstmt.setInt(5, mat);
					
					int result = pstmt.executeUpdate();
					System.out.println(result == 1? name+"님 입력 성공": "입력 실패");
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				} finally {
					try {
						if (pstmt != null) pstmt.close();
						if (conn != null) conn.close();
					} catch (Exception e2) {
						System.out.println(e2.getMessage());
					}
				} // finally
				break;
			
			case "2":
				System.out.print("조회 할 직업 입력(단, 가수,배우,MC만 가능) : ");
				jname = sc.next();
				sql = "SELECT ROWNUM RANK, S.*" + 
						"    FROM (SELECT NAME || '('||NO||'번)' NAME, JNAME, KOR, ENG, MAT, (KOR + ENG + MAT) SUM" + 
						"                FROM PERSON P, JOB J" + 
						"                WHERE P.JNO = J.JNO AND JNAME = ?" + 
						"                ORDER BY SUM DESC) S";
				
				try {
					conn = DriverManager.getConnection(url, "scott", "tiger");
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, jname);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						System.out.println("등수\t이름\t\t직업\t국어\t영어\t수학\t총점");
						do {
							int rank = rs.getInt("rank");
							name = rs.getString("name");
							jname = rs.getString("jname");
							kor = rs.getInt("kor");
							eng = rs.getInt("eng");
							mat = rs.getInt("mat");
							int sum = rs.getInt("sum");
							
							System.out.println(rank + "\t" + name + "\t" + jname + "\t" + kor +
												"\t" + eng + "\t" + mat + "\t" + sum);
						} while(rs.next());
					} else {
						System.out.println("해당 직업을 가진 사람은 없습니다.");
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
				break;
			
			case "3":
				sql = "SELECT ROWNUM RANK, S.*" + 
						"    FROM (SELECT NAME || '('||NO||'번)' NAME, JNAME, KOR, ENG, MAT, (KOR + ENG + MAT) SUM" + 
						"                FROM PERSON P, JOB J" + 
						"                WHERE P.JNO = J.JNO" + 
						"                ORDER BY SUM DESC) S";

				try {
					conn = DriverManager.getConnection(url, "scott", "tiger");
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					
					if (rs.next()) {
						System.out.println("등수\t이름\t\t직업\t국어\t영어\t수학\t총점");
						do {
							int rank = rs.getInt("rank");
							name = rs.getString("name");
							jname = rs.getString("jname");
							kor = rs.getInt("kor");
							eng = rs.getInt("eng");
							mat = rs.getInt("mat");
							int sum = rs.getInt("sum");
							
							System.out.println(rank + "\t" + name + "\t" + jname + "\t" + kor +
												"\t" + eng + "\t" + mat + "\t" + sum);
						} while(rs.next());
					} else {
						System.out.println("입력된 정보가 없습니다.");
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
				} // finally
			} // switch
			
			
		} while(fn.equals("1") || fn.equals("2") || fn.equals("3")); // do-while
		sc.close();
		System.out.println("이용해주셔서 감사합니다.");		
	}// main
} // class



























