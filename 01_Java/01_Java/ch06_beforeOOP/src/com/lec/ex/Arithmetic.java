package com.lec.ex;

public class Arithmetic {
	public int sum(int from, int to) { // 매개변수 2개의 메소드
		int result = 0; // 누적해서 return 할 변수
		
		for(int i=from; i<=to; i++) {
			result += i;
		}
		return result;
	}
	public int sum(int to) { // 매개변수 1개의 메소드
		int result = 0;
		
		for(int i=1; i<to; i++) {
			result += i;
		}
		return result;
	}
	public String evenOdd(int value) { // 정수 value를 받는 evenOdd 메소드
		return value%2 == 0? "짝수" : "홀수";
	}
	public int abs(int value) { // 절대값을 구하는 메소드
		int result = value>0? value : -(value);
		return result;
	}
}
