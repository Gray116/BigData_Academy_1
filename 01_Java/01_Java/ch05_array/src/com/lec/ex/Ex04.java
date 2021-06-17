package com.lec.ex;

public class Ex04 { /* 다차원 배열 */
	public static void main(String[] args) {
		int[] arr = {1, 2, 3};
		System.out.println(arr[0]);
		
		int[][] test = {{10, 20, 30},
									{40, 50, 60}};
		
		test[0][2] = 300;
		
		// 다차원 배열 test 출력
		for(int i=0; i<test.length; i++) {
			for(int j=0; j<test[i].length; j++) {
				System.out.printf("test[%d][%d] = %d\n", i, j, test[i][j]);
			} // for-j
		} // for-i
	} // main
} // class