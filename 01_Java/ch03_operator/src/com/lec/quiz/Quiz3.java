package com.lec.quiz;

import java.util.Scanner;

public class Quiz3
{
	public static void main(String[] args)
	{
		/*
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("수를 입력하세요 : ");
		int su = scanner.nextInt();
		System.out.print("수를 입력하세요 : ");
		int su2 = scanner.nextInt();
		
		
		if (su == su2)
		{
			System.out.println("두 수는 같습니다.");
		}
		else if (su > su2)
		{
			System.out.println("su가 su2보다 값이 큽니다.\n");
		}
		else
		{
			System.out.println("su2가 su보다 값이 큽니다.\n");
		}
		*/
	
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("수를 입력하세요 : ");
		int su = scanner.nextInt();
		System.out.print("수를 입력하세요 : ");
		int su2 = scanner.nextInt();
		
		char a = (su > su2) ? 'O' : 'X';
		
		System.out.println(a);

		scanner.close();
	}
}