package com.lec.ex3_readerWriter;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Ex01_reader {
	public static void main(String[] args) {
		FileReader reader = null;
		try {
			reader = new FileReader("txFile/inTest.txt"); // �� ������ ����.
			
			while(true) {
				int i = reader.read();
				if(i == -1) break; // ������ ���� -1
				System.out.print((char)i);
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(reader != null) reader.close(); // �� ������ �ݴ´�.
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
	}
}