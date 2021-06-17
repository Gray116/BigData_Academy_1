package com.lec.ex2_dataInputStreamDataOutputStream;

import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

// 외부에서 내 파일을 보지 않기를 원할 때 보조스트림을 사용한다.

public class Ex01_dataOutputStream {
	public static void main(String[] args) {
		OutputStream 	 fos = null;
		DataOutputStream dos = null;
		
		try {
			fos = new FileOutputStream("txFile/dataFile.dat");
			dos = new DataOutputStream(fos); // 보조스트림은 기본스트림을 이용해야 함.
			
			dos.writeUTF("홍길동");
			dos.writeInt(2);
			dos.writeDouble(95.9);
			
			dos.writeUTF("고길동");
			dos.writeInt(3);
			dos.writeDouble(99.9);
			
			System.out.println("파일 저장 완료.");
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(dos != null) dos.close();
				if(fos != null) fos.close();
			} catch (Exception e2) {}
		} // finally
	} // main
} // class