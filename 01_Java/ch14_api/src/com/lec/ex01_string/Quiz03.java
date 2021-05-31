package com.lec.ex01_string;

import java.util.Scanner;

public class Quiz03 {
	/* 전화번호를 입력 받아 다음을 출력하는 로직 구현 */
	public static void main(String[] args) {
		String tel;
		Scanner sc = new Scanner(System.in);
		
		System.out.print("번호를 입력해주세요 : ");
		tel = sc.next();
		
		System.out.println("입력받은 번호는 " + tel + "입니다.");
		
		System.out.print("짝수번째 문자열 : ");
		for(int i = 0; i<tel.length(); i++) {
			if(i % 2 != 0) {
				System.out.print(tel.charAt(i));
			}
		}
		System.out.println();
		
		System.out.print("문자를 거꾸로 : ");
		for(int i = tel.length()-1; i>=0; i--) {
			System.out.print( tel.charAt(i));
		}
		
		System.out.println("\n전화번호 맨 앞자리는 : " + tel.substring(0, 3));
		
		System.out.println("전화번호 뒷자리는 : " + tel.substring(8));
		
		sc.close();
	} // main
} // class