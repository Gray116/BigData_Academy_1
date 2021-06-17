package com.lec.ex01_string;

import java.util.Scanner;

public class Quiz01 {
	public static void main(String[] args) {
		/* 주민번호를 입력받아 여자인지 남자인지 출력 */
		Scanner sc = new Scanner(System.in);
		String i;
		
		System.out.print("주민번호를 입력해주세요 : ");
		i = sc.next();
		
		if(i.charAt(7) == '1' || i.charAt(7) == '3') {
			System.out.println("남자입니다.");
		}
		else if(i.charAt(7) == '2' || i.charAt(7) == '4') {
			System.out.println("여자입니다.");
		}
		else {
			System.out.println("잘못 입력하셨습니다.");
		}
		
		sc.close();
	}
}