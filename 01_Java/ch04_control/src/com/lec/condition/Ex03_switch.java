package com.lec.condition;

import java.util.Scanner;

public class Ex03_switch {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.printf("���� �Է��ϼ��� : ");
		int su = sc.nextInt();
		
		switch (su%2) {
			case 0 :
				System.out.println("¦��");
				break;
			default :
				System.out.println("Ȧ��");
				break;
		}
		
		sc.close();
	}
}
