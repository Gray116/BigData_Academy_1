package com.lec.ex01_string;

import java.util.Scanner;

public class Ex03 {
	public static void main(String[] args) {
		String[] tels = {"02-9999-9999",
										"010-8888-8888",
										"010-7777-8888"
										};
		Scanner sc = new Scanner(System.in);
		
		System.out.print("�˻��Ͻ÷��� ȸ���� ��ȭ��ȣ �޹�ȣ�� �Է����ּ��� : ");
		String searchTel = sc.next();
		boolean searchOk = false; // ��ȭ��ȣ ���ڸ��� �˻��� ���� true
		
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
		
		sc.close();
		} // main
	} // class