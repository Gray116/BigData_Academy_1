package com.lec.loop;

import java.util.Scanner;

public class Ex09_dowhile_1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int num;
		
		do {
			System.out.print("¦���� �Է��ϼ��� : ");
			num = sc.nextInt();
			
		} while(num%2 != 0); // do while
		
		System.out.println("�Է¹��� ¦���� " + num + "�Դϴ�.");
		
		sc.close();
	} // main
} // class