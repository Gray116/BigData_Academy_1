package com.lec.loop;

public class Ex10_quiz_2 /* 주사위를 던져서 두수의 합이 6이되는 경우를 출력 */{
	public static void main(String[] args) {
		
		for(int i = 1; i < 7; i++) {
			for(int j = 1; j<7; j++) {
				if(i+j == 6) {
					System.out.printf("두수의 합이 6이되는 경우의 수는 %d + %d\n", i, j);
				}
			} // j-for
		} // i-for
	} // main
} // class