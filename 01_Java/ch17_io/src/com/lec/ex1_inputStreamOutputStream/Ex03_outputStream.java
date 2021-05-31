package com.lec.ex1_inputStreamOutputStream;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

// 1. 파일을 연다.
// 2. 데이터를 쓴다. - Line16~23
// 3. 파일을 닫는다.
// ※ 실행시키면 화면 결과에는 안나오지만 폴더를 업데이트하면 파일이 생성되어있음.

public class Ex03_outputStream {
	public static void main(String[] args) {
		OutputStream os = null;
		try {
			os = new FileOutputStream("txFile/outTest.txt");
			byte[] bs = {'h', 'E', 'l', 'l', 'o'};
			
			for(int i=0; i<bs.length; i++) {
				os.write(bs[i]);
			}
			os.write(bs);
		} catch (FileNotFoundException e) {
			System.out.println("예외 메세지 : 파일을 찾지 못함" + e.getMessage());
		} catch (IOException e) {
			System.out.println("예외 메세지 : " + e.getMessage());
		} finally {
			try {
				if(os != null) os.close();
			} catch (Exception e) {}
		} // finally
	} // main
} // class