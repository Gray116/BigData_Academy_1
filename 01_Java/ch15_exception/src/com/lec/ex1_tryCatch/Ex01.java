package com.lec.ex1_tryCatch;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Ex01 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int i, j;
		
		do {
			try {
				System.out.print("첫번째 수 : ");
				i = sc.nextInt();
				break;
			} 
			catch (InputMismatchException e) {
				System.out.println("입력에 문자가 있을시 다시 진행");
				sc.nextLine(); // buffer를 지우는 목적
			} 						 // try-catch
		} while(true); // do-while
		
		System.out.print("두번째 수 : ");
		j = sc.nextInt();
		
		try {
			System.out.println("i = " + i + ", " + " j = " + j);
			System.out.println("i * j = " + (i * j));
			System.out.println("i / j = " + (i / j)); // 예외가 발생할 수도 있는 부분
		} 
		catch (ArithmeticException e) {
			System.out.println(e.getMessage());
		}
		catch (InputMismatchException e) { // 예외 발생시 수행해야 할 부분
			System.out.println("입력에 문자가 있을시 1로 초기화");
		}

		System.out.println("i + j = " + (i + j));
		System.out.println("i - j = " + (i - j));
		System.out.println("끝");
		
		sc.close();
	} // main
} // class