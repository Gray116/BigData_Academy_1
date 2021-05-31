package com.lec.ex;

public class Ex06_quiz_2 {
	public static void main(String[] args) {
		int[][] arr = {{5, 5, 5, 5, 5}, {10, 10, 10, 10, 10}, {20, 20, 20, 20, 20}, {30, 30, 30, 30, 30}};
		int tot = 0;
		
		for(int i=0; i<arr.length; i++) {
			for(int j=0; j<arr[i].length; j++) {
				tot += arr[i][j];
			} // for-j
		} // for-i
		System.out.printf("2차원 배열의 총 합은 %d입니다.", tot);
	} // main
} // class