package com.lec.ex01_string;

import java.util.Scanner;

public class Ex04 {
	public static void main(String[] args) {
		String[] tels = {"02-9999-9999",
										"010-8888-8888",
										"010-7777-8888"
										};
		Scanner sc = new Scanner(System.in);
		boolean searchOk = false; // ��ȭ��ȣ ���ڸ��� �˻��� ���� true
		
		/* ����ڰ� x�� �Է��� ������ (��ȭ��ȣ ���ڸ��� �˻��Ͽ� ��ȭ��ȣ ��ü ���) */
		do {	
			System.out.print("�˻��Ͻ÷��� ȸ���� ��ȭ��ȣ �޹�ȣ�� �Է����ּ���(��, ����� x) : ");
			String searchTel = sc.next();
			if(searchTel.equalsIgnoreCase("x")) { // ��ҹ��� �������
				break;
			}
			
			for(int idx = 0; idx<tels.length; idx++) {
				String postTel = tels[idx].substring(tels[idx].lastIndexOf("-") + 1);
				
				if(searchTel.equals(postTel)) {
					System.out.println(tels[idx]);
					searchOk = true; // �ѹ��̶� �˻��� �� ���
				}
			} // for
			if(!searchOk) {
				System.out.println("�Է��Ͻ� �� ��ȣ�� ���� ��ȣ�Դϴ�.");
			}
		}while(true); // do-while
		
		sc.close();
	} // main
} // class