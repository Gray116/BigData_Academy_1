package com.lec.ex5_printerWriter;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

public class Ex01 {
	public static void main(String[] args) {
		OutputStream os = null;
		PrintWriter pw 	= null;
		
		try {
			os = new FileOutputStream("txfile/inTest.txt");
			pw = new PrintWriter(os); // 권한 설정 필요없이 쓰기 가능, 예외 처리 불필요
			
			System.out.println("안녕하세요\n반갑습니다"); // 화면에 출력
			pw.println("안녕하세요\n반갑습니다"); // 파일에 출력
			
			System.out.print("print는 자동 개행 안됨 \n");
			pw.print("print는 자동 개행안됨 개행추가 \n");
			
			System.out.printf("%10s %3d %3d %5.1f\n", "홍길동", 100, 99, 99.5);
			pw.printf("%10s %3d %3d %5.1f\n", "홍길동", 100, 99, 99.5);
			
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pw != null) pw.close();
				if(os != null) os.close();
			} catch (Exception e2) {}
		}
	}
}















