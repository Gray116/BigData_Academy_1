package com.lec.ex05_scanner;

import java.util.Scanner;

public class Ex02 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("�ּҸ� �Է��ϼ��� : ");
//		sc.nextLine(); // buffer�� ����� ����
		String address = sc.nextLine();
		System.out.println("�Է��Ͻ� �ּҴ� " + address);
		
		System.out.println("�̸��� �Է��ϼ��� : ");
		String name = sc.next();
		System.out.println("�Է¹��� �̸��� " + name);
		
		sc.close();
	}
}