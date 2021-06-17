package com.lec.ex;

import java.util.Scanner;

public class Ex06_quiz_4 { /* 거스름돈 n원을 500, 100, 50, 10짜리로 줄 때 몇 개씩? */
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int money = 0;
		int[] coinUnit = {500, 100, 50, 10};
		
		System.out.print("거스름 돈을 입력하세요 : ");
		money = sc.nextInt();
		
		for(int i=0; i<coinUnit.length; i++) {
			System.out.println(coinUnit[i] + "원 : " + money / coinUnit[i]+"개");
			money %= coinUnit[i];
		} // for
		
		sc.close();
	} // main
} // class