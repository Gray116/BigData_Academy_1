package com.lec.ex;

import java.util.Scanner;

public class Ex05_quiz_1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int num = 0;
		
		do {
			System.out.print("구구단 몇단을 출력할까요?(2~9단만 가능) : ");
			num = sc.nextInt();
		} while(num<2 || num>9);
		
		gugudan(num);
		sc.close();
	} // main
	private static void gugudan(int num) {
		long result = 0;
		int i = 0;
	
		for(i = 1; i<10; i++) {
			result = num * i;
			System.out.printf("%d * %d = %d\n", num, i, result);	
		}
	}
} // class