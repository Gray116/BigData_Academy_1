package com.lec.ex;

import java.util.Scanner;

public class Ex05 { /* 키 입력 받아 평균 구하기 */
	public static void main(String[] args) { /* 가장 큰 학생과 작은 학생 구하기*/
		
		String[] arrName = {"영희", "철수", "길동", "영수", "말자"};
		int[] arrHeight = new int[arrName.length]; // arrName의 크기만큼 할당
		
		Scanner sc = new Scanner(System.in);
		int tot = 0;
		
		for(int idx=0; idx<arrHeight.length; idx++) {
			System.out.print(arrName[idx] + "의 키 입력 : ");
			arrHeight[idx] = sc.nextInt();
			
			tot += arrHeight[idx];
		} // for-idx
		
		System.out.printf("키의 합 : %d\n", tot);
		System.out.printf("평균키 : %.1f\n", ((double)tot)/arrHeight.length);
		
		int maxIdx = 0, maxHeight = 0;
		int minIdx = 0, minHeight = 999;
		
		for(int i=0; i<arrHeight.length; i++) {
			if (arrHeight[i] > maxHeight) {
				maxHeight = arrHeight[i];
				maxIdx = i; // 나중에 키가 가장 큰 학생을 찾기 위한 인덱스
			}
			
			if (arrHeight[i] < minHeight) {
				minHeight = arrHeight[i];
				minIdx = i;
			} // if
		} // for
		System.out.printf("가장 키가 작은 학생은 %s, 키 : %d\n", arrName[minIdx], minHeight);
		System.out.printf("가장 키가 큰 학생은 %s, 키 : %d\n", arrName[maxIdx], maxHeight);
		
		sc.close();
	} // main
} // class