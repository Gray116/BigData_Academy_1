package com.lec.ex1_tryCatch;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Ex01 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int i, j;
		
		do {
			try {
				System.out.print("ù��° �� : ");
				i = sc.nextInt();
				break;
			} 
			catch (InputMismatchException e) {
				System.out.println("�Է¿� ���ڰ� ������ �ٽ� ����");
				sc.nextLine(); // buffer�� ����� ����
			} 						 // try-catch
		} while(true); // do-while
		
		System.out.print("�ι�° �� : ");
		j = sc.nextInt();
		
		try {
			System.out.println("i = " + i + ", " + " j = " + j);
			System.out.println("i * j = " + (i * j));
			System.out.println("i / j = " + (i / j)); // ���ܰ� �߻��� ���� �ִ� �κ�
		} 
		catch (ArithmeticException e) {
			System.out.println(e.getMessage());
		}
		catch (InputMismatchException e) { // ���� �߻��� �����ؾ� �� �κ�
			System.out.println("�Է¿� ���ڰ� ������ 1�� �ʱ�ȭ");
		}

		System.out.println("i + j = " + (i + j));
		System.out.println("i - j = " + (i - j));
		System.out.println("��");
		
		sc.close();
	} // main
} // class