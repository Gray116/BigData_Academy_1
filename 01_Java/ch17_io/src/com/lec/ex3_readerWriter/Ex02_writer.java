package com.lec.ex3_readerWriter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

public class Ex02_writer {
	public static void main(String[] args) {
		Writer writer = null;
		try {
			writer = new FileWriter("txFile/inTest.txt"); // ① 파일을 읽는다.
			
			String str 	= "안녕하세요\n자바\n금요일"; // ② 파일에 데이터를 쓴다.
			String str1 = "\n와우";
			writer.write(str);
			writer.write(str1);
		} catch (IOException e) { // 폴더가 없을 수 있다.
			System.out.println(e.getMessage());
		} finally {
			try {
				if(writer != null) writer.close();
			} catch (Exception e2) {}
		}
	}
}