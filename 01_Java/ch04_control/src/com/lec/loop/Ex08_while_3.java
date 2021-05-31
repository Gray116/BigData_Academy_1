package com.lec.loop;

public class Ex08_while_3 /* 1부터 100까지 3의 배수 출력 */{
	public static void main(String[] args) {
		int tot = 0;
		int i = 0;
		
		while(++i < 20) {
			if(i%3 != 0) {
				continue;
			} // if
			tot += i;
		} // while
		
		System.out.printf("1부터 100까지 3의 배수의 합은 %d입니다.\n", tot);
	} // main
} // class