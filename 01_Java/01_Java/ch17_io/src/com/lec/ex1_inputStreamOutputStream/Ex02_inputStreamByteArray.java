package com.lec.ex1_inputStreamOutputStream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

// 1. 파일을 연다. - Line15~30
// 2. 데이터를 읽는다. - Line15~25
// 3. 파일을 닫는다. - Line30~34

public class Ex02_inputStreamByteArray {
	public static void main(String[] args) {
		InputStream is = null;
		try {
			is = new FileInputStream("txFile/inTest.txt");
			byte[] bs = new byte[10];
			while(true) {
				int readByteCount = is.read(bs);
				if(readByteCount == -1) break;
				
				for(byte b : bs) {
					System.out.print((char)b);
				}
			}
		} catch (FileNotFoundException e) {
			System.out.println("파일 찾지 못함 : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("I/O 예외 : " + e.getMessage());
		} finally {
			try {
				if(is != null) is.close();
			} catch (Exception e) {}
		}
	} // main
} // class


















