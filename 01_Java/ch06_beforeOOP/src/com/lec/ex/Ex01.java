package com.lec.ex;

public class Ex01 { // 1~10 정수의 합 구하고, 짝/홀수 여부 출력
	public static void main(String[] args) {
		int tot = 0;
		
		for(int i=1; i<11; i++) {
			tot += i;
		}
		
		if(tot%2 == 0) {
			System.out.printf("정수의 합은 %d, 짝수입니다.", tot);
		}
		else {
			System.out.printf("정수의 합은 %d, 홀수입니다.", tot);
		} // if-else
	} // main
} // class