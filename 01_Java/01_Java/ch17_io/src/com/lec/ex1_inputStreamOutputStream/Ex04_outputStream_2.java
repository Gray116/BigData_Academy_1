package com.lec.ex1_inputStreamOutputStream;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

// Line13 - true�� ���Ͽ� append(����� �ʰ� �̾ ���� �߰�)
// Line16 - String�� byte�迭�� �ٲٴ� �Լ�

public class Ex04_outputStream_2 {
	public static void main(String[] args) {
		OutputStream os = null;
		try {
			os = new FileOutputStream("txFile/outTest.txt", true);
			String str = "\n�ѱ� \n�� ���ٶ� ���� �������ī";
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