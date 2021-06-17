package com.lec.ex;

import java.util.Scanner;

public class Ex05 { // n! = n * (n-1) * ... * 1
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int num;
		
		do {
			System.out.print("몇 !을 계산할까요? : ");
			num = sc.nextInt();
			
			if(num > 0) {
				break;
			}
			else {
				System.out.print("양수를 입력해주세요.");
			}
		} while(true); // dowhile
		long result = factorial(num);
		System.out.println(num + "! = " + result);
		
		sc.close();
	} // main
	private static long factorial(int num) { // 재귀 호출 n! = n - (n-1)!		
		if(num <= 1) {
			return 1;
		}
		else {
			return num * factorial(num - 1); 
		}
	}
//	private static long factorial(int num) {
//		long result = 1;
//		
//		for(int i = num; i>0; i--) {
//			result *= i;
//		}
//		return result;
//	}
} // class














