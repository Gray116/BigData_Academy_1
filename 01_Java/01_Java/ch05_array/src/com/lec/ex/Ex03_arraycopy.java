package com.lec.ex;

public class Ex03_arraycopy {
	public static void main(String[] args) {
		int[] score = {100, 20, 30, 40, 50};
		int[] s = new int [score.length];
		
//		for(int idx = 0; idx<score.length; idx++) {
//			s[idx] = score[idx];
//		} // for-idx
		System.arraycopy(score, 0, s, 0, s.length);
		
		for(int idx = 0; idx<score.length; idx++) {
			System.out.printf("s[%d] = %d, score[%d] = %d\n", idx, s[idx], idx, score[idx]);
		} // for-idx
		
		s[0] = 90;
		
		System.out.println("s배열의 값 변경 후");
		for(int idx = 0; idx<score.length; idx++) {
			System.out.printf("s[%d] = %d, score[%d] = %d\n", idx, s[idx], idx, score[idx]);
		} // for-idx
		
	} // main
} // class