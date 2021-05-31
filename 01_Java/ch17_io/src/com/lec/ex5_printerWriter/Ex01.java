package com.lec.ex5_printerWriter;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

public class Ex01 {
	public static void main(String[] args) {
		OutputStream os = null;
		PrintWriter pw 	= null;
		
		try {
			os = new FileOutputStream("txfile/inTest.txt");
			pw = new PrintWriter(os); // ���� ���� �ʿ���� ���� ����, ���� ó�� ���ʿ�
			
			System.out.println("�ȳ��ϼ���\n�ݰ����ϴ�"); // ȭ�鿡 ���
			pw.println("�ȳ��ϼ���\n�ݰ����ϴ�"); // ���Ͽ� ���
			
			System.out.print("print�� �ڵ� ���� �ȵ� \n");
			pw.print("print�� �ڵ� ����ȵ� �����߰� \n");
			
			System.out.printf("%10s %3d %3d %5.1f\n", "ȫ�浿", 100, 99, 99.5);
			pw.printf("%10s %3d %3d %5.1f\n", "ȫ�浿", 100, 99, 99.5);
			
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pw != null) pw.close();
				if(os != null) os.close();
			} catch (Exception e2) {}
		}
	}
}















