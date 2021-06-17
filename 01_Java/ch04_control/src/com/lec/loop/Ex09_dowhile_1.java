package com.lec.loop;

import java.util.Scanner;

public class Ex09_dowhile_1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int num;
		
		do {
			System.out.print("짝수를 입력하세요 : ");
			num = sc.nextInt();
			
		} while(num%2 != 0); // do while
		
		System.out.println("입력받은 짝수는 " + num + "입니다.");
		
		sc.close();
	} // main
} // class