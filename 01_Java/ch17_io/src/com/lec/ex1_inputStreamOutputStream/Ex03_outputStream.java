package com.lec.ex1_inputStreamOutputStream;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

// 1. ������ ����.
// 2. �����͸� ����. - Line16~23
// 3. ������ �ݴ´�.
// �� �����Ű�� ȭ�� ������� �ȳ������� ������ ������Ʈ�ϸ� ������ �����Ǿ�����.

public class Ex03_outputStream {
	public static void main(String[] args) {
		OutputStream os = null;
		try {
			os = new FileOutputStream("txFile/outTest.txt");
			byte[] bs = {'h', 'E', 'l', 'l', 'o'};
			
			for(int i=0; i<bs.length; i++) {
				os.write(bs[i]);
			}
			os.write(bs);
		} catch (FileNotFoundException e) {
			System.out.println("���� �޼��� : ������ ã�� ����" + e.getMessage());
		} catch (IOException e) {
			System.out.println("���� �޼��� : " + e.getMessage());
		} finally {
			try {
				if(os != null) os.close();
			} catch (Exception e) {}
		} // finally
	} // main
} // class