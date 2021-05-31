package com.lec.condition;

import java.util.Scanner;

public class Ex03_switch_1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.printf("점수를 입력하세요 : ");
		int score = sc.nextInt();
		
		int temp = (score == 100)? score-1: score; // 100점이면 1점을 깍고 99점, 아니면 입력받은 점수 그대로
		temp = (temp >= -9 && temp <= -1)? temp-10: temp;
		
		switch (temp / 10) {
			case 10 :
			case 9 :
				System.out.println("학점 A");
				break;
			case 8 :
				System.out.println("학점 B");
				break;
			case 7 :
				System.out.println("학점 C");
				break;
			case 6 :
				System.out.println("학점 D");
				break;
			case 5 :
			case 4 :
			case 3 :
			case 2 :
			case 1 :
			case 0 :
				System.out.println("낙제");
				break;
			default :
				System.out.println("유효하지 않은 점수입니다.");
				break;
		}
		
		sc.close();
	}
}
