package com.lec.quiz;

import java.util.Scanner;

public class Quiz2
{
	public static void main(String[] args)
	{
		Scanner scanner = new Scanner(System.in); 
		
		System.out.print("수를 입력하세요 : ");
		int su = scanner.nextInt();
		
		if(su % 2 == 0)
		{
			System.out.println("입력하신 수는 짝수입니다.");
		}
		else
		{
			System.out.println("입력하신 수는 홀수입니다.");
		}
		
		scanner.close();
	}
}