package com.lec.ex01_string;

import java.util.Scanner;

public class Quiz01 {
	public static void main(String[] args) {
		/* �ֹι�ȣ�� �Է¹޾� �������� �������� ��� */
		Scanner sc = new Scanner(System.in);
		String i;
		
		System.out.print("�ֹι�ȣ�� �Է����ּ��� : ");
		i = sc.next();
		
		if(i.charAt(7) == '1' || i.charAt(7) == '3') {
			System.out.println("�����Դϴ�.");
		}
		else if(i.charAt(7) == '2' || i.charAt(7) == '4') {
			System.out.println("�����Դϴ�.");
		}
		else {
			System.out.println("�߸� �Է��ϼ̽��ϴ�.");
		}
		
		sc.close();
	}
}