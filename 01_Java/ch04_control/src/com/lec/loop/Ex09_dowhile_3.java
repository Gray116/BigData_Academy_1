package com.lec.loop;

import java.util.Scanner;

public class Ex09_dowhile_3 {
	public static void main(String[] args) {
		/* System.out.println((int)(Math.random() * 45)); 0~44������ ���� �߻� */
		Scanner sc = new Scanner(System.in);
		
		int su, lotto;
		
		lotto = (int)(Math.random() * 45) + 1;
		
		do {
			System.out.print("1���� 45������ ���ڸ� ���纸���� : ");
			su = sc.nextInt();
			
			if(su == lotto) {
				break;
			}
			else if(su < lotto) {
				System.out.print("�Է��Ͻ� ������ ū ������.\n");
			}
			else {
				System.out.print("�Է��Ͻ� ������ ���� ������.\n");
			}
		} while(true);
		
		System.out.println("�����Դϴ�.\n");
		sc.close();
	}
}