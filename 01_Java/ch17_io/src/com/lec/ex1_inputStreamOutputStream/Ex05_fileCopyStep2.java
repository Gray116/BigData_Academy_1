package com.lec.ex1_inputStreamOutputStream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

// 1. null 초기화 후 입력스트림, 출력스트림을 생성.
// 2. 데이터를 읽기.
// 3. 실행하면 데이터 양에 따라 출력시간의 차이가 발생.

public class Ex05_fileCopyStep2 {
	public static void main(String[] args) {
		InputStream is = null;
		OutputStream os = null;
		try {
			File file = new File("txFile/pic1.png");
			is = new FileInputStream(file);
			os = new FileOutputStream("txFile/pic1_copied.png");
			int cnt = 0;
			byte[] by = new byte[(int)file.length()]; // file.length만큼 배열객체 생성
			
			while(true) {
				cnt++;
				int i = is.read(by); // 512byte만큼씩 읽음
				if(i == -1) break;
				
				os.write(by, 0, i); // <by>를 <0번 인덱스>부터 <i byte>써라.
			}
			
			System.out.println(cnt + "번 while문을 복사함.");
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os != null) os.close();
				if(is != null) is.close();
			} catch (Exception e) {}
		} // finally
	} // main
} // class










