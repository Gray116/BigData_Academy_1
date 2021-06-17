package com.lec.ex2_dataInputStreamDataOutputStream;

import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Scanner;

public class Ex03_ProductWrite {
	public static void main(String[] args) {
		OutputStream 	 fos = null;
		DataOutputStream dos = null;
		Scanner sc = new Scanner(System.in);
		String fn;
		
		try {
			fos = new FileOutputStream("txFile/product.dat", true);
			dos = new DataOutputStream(fos);
	
			do {
				System.out.print("��� �Է��Ͻðڽ��ϱ�?(Y/N) : ");
				fn = sc.next();
				
				if(fn.equalsIgnoreCase("N")) {
					System.out.print("�����մϴ�.");
					break;
				} else if(fn.equalsIgnoreCase("Y")) {
					System.out.print("��ǰ���� �Է��ϼ��� : ");
					dos.writeUTF(sc.next());
					
					System.out.print("������ �Է��ϼ��� : ");
					dos.writeInt(sc.nextInt());
					
					System.out.print("������ �Է��ϼ��� : ");
					dos.writeInt(sc.nextInt());
				} else {
					System.out.print("�߸� �Է��ϼ̽��ϴ�.");
				}	
			} while(true);
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
	sc.close();
	} // main
} // class