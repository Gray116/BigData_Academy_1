package com.lec.ex01_string;

public class Quiz02 {
	public static void main(String[] args) {
		/* 문자열 거꾸로 출력 */
		String str = "2002 WorldCup Korea";
		
		for(int i = str.length() - 1; i >= 0;  i--) {
			System.out.print(str.charAt(i));
		}
	}
}