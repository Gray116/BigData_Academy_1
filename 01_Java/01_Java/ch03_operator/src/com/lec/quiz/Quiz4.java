package com.lec.quiz;

import java.util.Scanner;

public class Quiz4
{
	public static void main(String[] args)
	{
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("수를 입력하세요 : ");
		int su = scanner.nextInt();
		
		if (su >= 65)
		{
			System.out.println("경로우대");
		}
		else
		{
			System.out.println("일반");
		}
		
		scanner.close();
	}
}