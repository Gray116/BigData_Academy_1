package com.lec.ex01_string;

import java.util.Scanner;

public class Quiz03 {
	/* ��ȭ��ȣ�� �Է� �޾� ������ ����ϴ� ���� ���� */
	public static void main(String[] args) {
		String tel;
		Scanner sc = new Scanner(System.in);
		
		System.out.print("��ȣ�� �Է����ּ��� : ");
		tel = sc.next();
		
		System.out.println("�Է¹��� ��ȣ�� " + tel + "�Դϴ�.");
		
		System.out.print("¦����° ���ڿ� : ");
		for(int i = 0; i<tel.length(); i++) {
			if(i % 2 != 0) {
				System.out.print(tel.charAt(i));
			}
		}
		System.out.println();
		
		System.out.print("���ڸ� �Ųٷ� : ");
		for(int i = tel.length()-1; i>=0; i--) {
			System.out.print( tel.charAt(i));
		}
		
		System.out.println("\n��ȭ��ȣ �� ���ڸ��� : " + tel.substring(0, 3));
		
		System.out.println("��ȭ��ȣ ���ڸ��� : " + tel.substring(8));
		
		sc.close();
	} // main
} // class