package com.lec.loop;

import java.util.Scanner;

public class Ex09_dowhile_4 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		int su, lotto;
		int min = 1, max = 45; // �ּҰ�, �ִ밪 ����
		
		lotto = (int)(Math.random() * 45) + 1;
		
		do {
			System.out.printf("%d ~ %d ������ ���ڸ� ���纸���� : ", min, max);
			su = sc.nextInt();
			
			if(su == lotto) {
				break;
			}
			else if(su < lotto) {
				min = su + 1;
			}
			else {
				max = su - 1;
			}
		} while(true);
		
		System.out.println("�����Դϴ�.\n");
		sc.close();
	}
}