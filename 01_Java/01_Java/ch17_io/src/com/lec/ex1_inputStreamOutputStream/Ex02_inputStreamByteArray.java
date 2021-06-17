package com.lec.ex1_inputStreamOutputStream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

// 1. ������ ����. - Line15~30
// 2. �����͸� �д´�. - Line15~25
// 3. ������ �ݴ´�. - Line30~34

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
			System.out.println("���� ã�� ���� : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("I/O ���� : " + e.getMessage());
		} finally {
			try {
				if(is != null) is.close();
			} catch (Exception e) {}
		}
	} // main
} // class


















