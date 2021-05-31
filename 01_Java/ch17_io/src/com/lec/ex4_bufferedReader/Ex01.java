package com.lec.ex4_bufferedReader;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

public class Ex01 {
	public static void main(String[] args) {
		Reader reader 		= null;
		BufferedReader br 	= null;
		
		try {
			reader 	= new FileReader("txFile/inTest.txt");
			br 		= new BufferedReader(reader);
			
			while(true) {
				String line = br.readLine(); /* 한줄 씩 읽어나감 */
				if(line == null) break;
				System.out.println(line); // 화면에 출력
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(br != null) br.close(); /* 닫을땐 나중에 불러온것부터 먼저 */
				if(reader != null) reader.close();
			} catch (Exception e2) {}
		} //finally
	} // class
} // main