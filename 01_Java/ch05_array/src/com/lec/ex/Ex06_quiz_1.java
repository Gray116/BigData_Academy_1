package com.lec.ex;

public class Ex06_quiz_1 {
	public static void main(String[] args) {
		int[] arr = {10, 20, 30, 40, 50};
		int tot = 0;
		
		for(int i=0; i<arr.length; i++) {
			tot += arr[i];
		}
		
		System.out.printf("�迭 arr�� ���� ���� %d�Դϴ�.", tot);
	}
}