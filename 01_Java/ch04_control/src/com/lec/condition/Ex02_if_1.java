package com.lec.condition;

import java.util.Scanner;

public class Ex02_if_1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		System.out.print("���� �Է��ϼ��� : ");
		int num = sc.nextInt();
		
		if (num < 0) {
			System.out.printf("%d\n", -(num));
		}
		else {
			System.out.printf("%d\n", num);
		}
		
		sc.close();
	}
}