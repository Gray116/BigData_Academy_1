package com.lec.ex1_inputStreamOutputStream;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

// Line13 - true는 파일에 append(덮어쓰지 않고 이어서 내용 추가)
// Line16 - String을 byte배열로 바꾸는 함수

public class Ex04_outputStream_2 {
	public static void main(String[] args) {
		OutputStream os = null;
		try {
			os = new FileOutputStream("txFile/outTest.txt", true);
			String str = "\n한글 \n가 나다라 마바 사아자차카";
			byte[] bs = str.getBytes();
			os.write(bs);
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os != null) os.close();
			} catch (Exception e) {}
		} // finally
	} // main
} // class