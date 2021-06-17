package com.lec.ex3_readerWriter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.Scanner;

// 1. ����� �����̸��� Ű����κ��� �Է¹޴´�. ��� : (txFile/a.txt)
// 2. ����ϰ����ϴ� ������ ���� ������ �ݺ������� �Է¹޴´�. (��, ������ ������ ������ x�� ������)

public class Ex03 {
	public static void main(String[] args) {
		Writer writer = null;
		Scanner sc = new Scanner(System.in);
		String outMsg;
		
		try {
			writer = new FileWriter("txFile/a.txt", true); // true - append
			
			while(true) {
				System.out.print("�Է��ϰ��� �ϴ� ������ �Է� : ");
				outMsg = sc.nextLine(); // ���۸� ����� �뵵
				
				if(outMsg.equalsIgnoreCase("X")) {
					System.out.print("�����մϴ�.");
					break;
				}
				
				writer.write(outMsg + "\r\n");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(writer != null) writer.close();
			} catch (Exception e2) {}
		} // finally
		sc.close();
	} // main
} // class