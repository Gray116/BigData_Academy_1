package com.lec.ex2_dataInputStreamDataOutputStream;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

public class Ex02_dataInputStream {
	public static void main(String[] args) {
		InputStream 	fis = null;
		DataInputStream dis = null;
		
		try {
			fis = new FileInputStream("txFile/dataFile.dat");
			dis = new DataInputStream(fis);
			
			while(true) {
				String name = dis.readUTF();
				int grade = dis.readInt();
				double score = dis.readDouble();
				
				System.out.printf("%s는 %d학년 %.1f점\n", name, grade, score);
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println("더 이상 데이터가 없다.\n");
		} finally {
			try {
				if(dis != null) dis.close();
				if(fis != null) fis.close();
			} catch (Exception e) {}
		}
		
	}
}