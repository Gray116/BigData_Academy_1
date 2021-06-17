package com.lec.condition;

import java.util.Scanner;

public class Ex03_switch_1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.printf("������ �Է��ϼ��� : ");
		int score = sc.nextInt();
		
		int temp = (score == 100)? score-1: score; // 100���̸� 1���� ��� 99��, �ƴϸ� �Է¹��� ���� �״��
		temp = (temp >= -9 && temp <= -1)? temp-10: temp;
		
		switch (temp / 10) {
			case 10 :
			case 9 :
				System.out.println("���� A");
				break;
			case 8 :
				System.out.println("���� B");
				break;
			case 7 :
				System.out.println("���� C");
				break;
			case 6 :
				System.out.println("���� D");
				break;
			case 5 :
			case 4 :
			case 3 :
			case 2 :
			case 1 :
			case 0 :
				System.out.println("����");
				break;
			default :
				System.out.println("��ȿ���� ���� �����Դϴ�.");
				break;
		}
		
		sc.close();
	}
}
