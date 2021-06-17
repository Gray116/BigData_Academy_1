package com.lec.loop;

import java.util.Scanner;

public class Ex07_quiz_3 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("구구단 수를 입력해주세요 : ");
		int num = sc.nextInt();
		
		for(int i=1; i<10; i++) {
			System.out.printf("%d * %d = %d\n", num, i, num * i);
		}
		sc.close();
	}
}