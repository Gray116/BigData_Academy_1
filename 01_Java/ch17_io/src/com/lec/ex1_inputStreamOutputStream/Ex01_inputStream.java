package com.lec.ex1_inputStreamOutputStream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

// 파일 출력 순서
// 1. 파일을 연다. ( 스트림 객체 생성 및 예외 발생 ) - Line16~29
// 2. 데이터를 읽는다. ( 1byte 단위로 반복해서 읽음 ) - Line18~22
// 3. 파일을 닫는다. Lin29~32
// ※ 파일을 열 때는 try/catch문을 실행 해야한다.
// ※ 출력에 나오는 (13), (10)은 Enter키 및 줄바꿈에 대한 ASCI 코드.

public class Ex01_inputStream {
	public static void main(String[] args) {
		InputStream is = null;
		try {
			is = new FileInputStream("txFile/inTest.txt"); 
			while(true) {
				int i = is.read();
				if(i == -1) break; // 파일이 끝인지 확인
				System.out.print((char)i + "(" + i + ")");
			}
			System.out.println("DONE");
		} 	catch (FileNotFoundException e) {
			System.out.print("예외메시지 : 파일을 찾지 못함\n" + e.getMessage());
		}
			catch (IOException e) {
			System.out.print("예외메세지 : 파일을 읽지 못함\n" + e.getMessage());
		} finally {
			try {
				if(is != null) is.close();
			} catch (IOException e){}
		} // finally
	}// main
} // class












