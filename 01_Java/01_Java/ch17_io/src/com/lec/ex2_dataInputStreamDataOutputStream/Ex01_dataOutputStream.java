package com.lec.ex2_dataInputStreamDataOutputStream;

import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

// �ܺο��� �� ������ ���� �ʱ⸦ ���� �� ������Ʈ���� ����Ѵ�.

public class Ex01_dataOutputStream {
	public static void main(String[] args) {
		OutputStream 	 fos = null;
		DataOutputStream dos = null;
		
		try {
			fos = new FileOutputStream("txFile/dataFile.dat");
			dos = new DataOutputStream(fos); // ������Ʈ���� �⺻��Ʈ���� �̿��ؾ� ��.
			
			dos.writeUTF("ȫ�浿");
			dos.writeInt(2);
			dos.writeDouble(95.9);
			
			dos.writeUTF("��浿");
			dos.writeInt(3);
			dos.writeDouble(99.9);
			
			System.out.println("���� ���� �Ϸ�.");
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