package com.lec.ex3_readerWriter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.Scanner;

// 1. 출력할 파일이름을 키보드로부터 입력받는다. 경로 : (txFile/a.txt)
// 2. 출력하고자하는 내용을 라인 단위로 반복적으로 입력받는다. (단, 저장을 끝내고 싶으면 x를 누르기)

public class Ex03 {
	public static void main(String[] args) {
		Writer writer = null;
		Scanner sc = new Scanner(System.in);
		String outMsg;
		
		try {
			writer = new FileWriter("txFile/a.txt", true); // true - append
			
			while(true) {
				System.out.print("입력하고자 하는 내용을 입력 : ");
				outMsg = sc.nextLine(); // 버퍼를 지우는 용도
				
				if(outMsg.equalsIgnoreCase("X")) {
					System.out.print("종료합니다.");
					break;
				}
				
				writer.write(outMsg + "\r\n");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(writer != null) writer.close();
			} catch (Exception e2) {}
		} // finally
		sc.close();
	} // main
} // class