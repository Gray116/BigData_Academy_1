package com.lec.loop;

public class Ex07_quiz_1 {
	public static void main(String[] args) {
		long tot = 1;
		for(int i=1; i<11; i++) {
			tot *= i;
		}
		System.out.println("1~10까지 누적 곱은 " + tot);
	}
}
