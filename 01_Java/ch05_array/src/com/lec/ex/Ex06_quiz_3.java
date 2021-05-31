package com.lec.ex;

public class Ex06_quiz_3 {
	public static void main(String[] args) {
		int[] arr = {76, 45, 34, 89, 100, 50, 90, 92};
		int tot = 0;
		int maxnum = 0;
		int minnum = 101;
		
		for(int i=0; i<arr.length; i++) {
			tot += arr[i];
		} // for tot 합계
		
		for(int i=0; i<arr.length; i++) {
			if (arr[i] > maxnum) {
				maxnum = arr[i];
			}
			
			if (arr[i] < minnum) {
				minnum = arr[i];
				}
		} // for
				
		System.out.printf("합\t계 : %d, 평\t균 : %d\n", tot, tot/arr.length);
		System.out.printf("최대값은 : %d, 최소값은 : %d", maxnum, minnum);
	} // main
} // class