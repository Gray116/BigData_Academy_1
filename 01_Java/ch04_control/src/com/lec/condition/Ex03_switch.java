package com.lec.condition;

import java.util.Scanner;

public class Ex03_switch {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.printf("수를 입력하세요 : ");
		int su = sc.nextInt();
		
		switch (su%2) {
			case 0 :
				System.out.println("짝수");
				break;
			default :
				System.out.println("홀수");
				break;
		}
		
		sc.close();
	}
}
