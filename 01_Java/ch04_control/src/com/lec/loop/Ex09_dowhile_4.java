package com.lec.loop;

import java.util.Scanner;

public class Ex09_dowhile_4 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		int su, lotto;
		int min = 1, max = 45; // 최소값, 최대값 설정
		
		lotto = (int)(Math.random() * 45) + 1;
		
		do {
			System.out.printf("%d ~ %d 사이의 숫자를 맞춰보세요 : ", min, max);
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
		
		System.out.println("정답입니다.\n");
		sc.close();
	}
}