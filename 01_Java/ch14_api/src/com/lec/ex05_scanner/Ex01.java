package com.lec.ex05_scanner;

import java.util.Scanner;

public class Ex01 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("���̸� �Է��ϼ��� : ");
		int age = sc.nextInt();
		System.out.println("�Է��Ͻ� ���̴� : " + age);
		
		System.out.print("�̸��� �Է��ϼ��� : ");
		String name = sc.next(); // buffer�� ó�������� \n�� �����ϰ� whiteSpace�� ������������
		System.out.println("�Է��Ͻ� �̸��� " + name);
		
		System.out.print("�ּҸ� �Է��ϼ��� : ");
		sc.nextLine(); // buffer�� \n�� ������ �ձ��� ���ϰ� buffer�� �����ִ� ������ ����
		String address = sc.nextLine();
		System.out.println("�Է��Ͻ� �ּҴ� " + address);
		
		sc.close();
	}
}