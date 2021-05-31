package com.lec.loop;

public class Ex10_quiz_1 {
	public static void main(String[] args) {
		int i = 0;
		int tot = 0;
		
		do {
			if((i%2 != 0) && (i%3 != 0)) {
				tot += i;
			} // if
			i++;
		} while(i < 21); // while
		
		System.out.printf("1부터 20까지의 정수 중에서 2와 3의 배수가 아닌 수의 합은 %d입니다.", tot);
	} // main
} // class