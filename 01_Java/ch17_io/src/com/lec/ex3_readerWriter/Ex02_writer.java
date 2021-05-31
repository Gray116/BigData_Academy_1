package com.lec.ex3_readerWriter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

public class Ex02_writer {
	public static void main(String[] args) {
		Writer writer = null;
		try {
			writer = new FileWriter("txFile/inTest.txt"); // �� ������ �д´�.
			
			String str 	= "�ȳ��ϼ���\n�ڹ�\n�ݿ���"; // �� ���Ͽ� �����͸� ����.
			String str1 = "\n�Ϳ�";
			writer.write(str);
			writer.write(str1);
		} catch (IOException e) { // ������ ���� �� �ִ�.
			System.out.println(e.getMessage());
		} finally {
			try {
				if(writer != null) writer.close();
			} catch (Exception e2) {}
		}
	}
}