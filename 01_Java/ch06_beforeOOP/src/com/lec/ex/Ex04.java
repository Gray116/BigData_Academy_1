package com.lec.ex;

public class Ex04 {
	public static void main(String[] args) {
		printLine('＃'); // 원하는 문자 20개 출력
		System.out.println("Hello, World!");
		
		printLine(); // 가는 라인 한 줄 출력
		System.out.println("Hello, Java!");
		
		printLine('™', 30);
	} // main
	public static void printLine(char ch, int cnt) {
		for(int i=0; i<cnt; i++) {
			System.out.print(ch);
		}
		System.out.println();
	}
	private static void printLine(char ch) {
		for(int i=0; i<20; i++) {
			System.out.print(ch);
		}
		System.out.println();
	}
	private static void printLine() { // 가는 라인 20개짜리 line 출력
		for(int i=0; i<20; i++) {
			System.out.print('-');
		}
		System.out.println();
	} // method (return 값이 없는 메소드)
} // class