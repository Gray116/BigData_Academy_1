package com.lec.ex1_inputStreamOutputStream;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

// ���� ��� ����
// 1. ������ ����. ( ��Ʈ�� ��ü ���� �� ���� �߻� ) - Line16~29
// 2. �����͸� �д´�. ( 1byte ������ �ݺ��ؼ� ���� ) - Line18~22
// 3. ������ �ݴ´�. Lin29~32
// �� ������ �� ���� try/catch���� ���� �ؾ��Ѵ�.
// �� ��¿� ������ (13), (10)�� EnterŰ �� �ٹٲ޿� ���� ASCI �ڵ�.

public class Ex01_inputStream {
	public static void main(String[] args) {
		InputStream is = null;
		try {
			is = new FileInputStream("txFile/inTest.txt"); 
			while(true) {
				int i = is.read();
				if(i == -1) break; // ������ ������ Ȯ��
				System.out.print((char)i + "(" + i + ")");
			}
			System.out.println("DONE");
		} 	catch (FileNotFoundException e) {
			System.out.print("���ܸ޽��� : ������ ã�� ����\n" + e.getMessage());
		}
			catch (IOException e) {
			System.out.print("���ܸ޼��� : ������ ���� ����\n" + e.getMessage());
		} finally {
			try {
				if(is != null) is.close();
			} catch (IOException e){}
		} // finally
	}// main
} // class












