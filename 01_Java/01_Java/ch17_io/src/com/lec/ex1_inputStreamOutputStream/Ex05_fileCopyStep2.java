package com.lec.ex1_inputStreamOutputStream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

// 1. null �ʱ�ȭ �� �Է½�Ʈ��, ��½�Ʈ���� ����.
// 2. �����͸� �б�.
// 3. �����ϸ� ������ �翡 ���� ��½ð��� ���̰� �߻�.

public class Ex05_fileCopyStep2 {
	public static void main(String[] args) {
		InputStream is = null;
		OutputStream os = null;
		try {
			File file = new File("txFile/pic1.png");
			is = new FileInputStream(file);
			os = new FileOutputStream("txFile/pic1_copied.png");
			int cnt = 0;
			byte[] by = new byte[(int)file.length()]; // file.length��ŭ �迭��ü ����
			
			while(true) {
				cnt++;
				int i = is.read(by); // 512byte��ŭ�� ����
				if(i == -1) break;
				
				os.write(by, 0, i); // <by>�� <0�� �ε���>���� <i byte>���.
			}
			
			System.out.println(cnt + "�� while���� ������.");
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os != null) os.close();
				if(is != null) is.close();
			} catch (Exception e) {}
		} // finally
	} // main
} // class










