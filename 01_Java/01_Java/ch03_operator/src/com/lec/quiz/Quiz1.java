package com.lec.quiz;

import java.util.Scanner;

public class Quiz1 // 사용자로부터 입력받은 수가 3의배수인지 확인하고 출력
{
	public static void main(String[] args)
	{
		Scanner scanner = new Scanner(System.in); // 객체 데이터 타입
		
		System.out.print("수를 입력하세요 : ");
		int su = scanner.nextInt(); // 키보드로부터 입력 받은 정수를 반환받는 함수
	
		System.out.println("입력하신 수는 " +  su + "입니다.");
		
		if (su % 3 ==0)
		{
			System.out.println("입력하신 수는 3의 배수입니다.");
		}
		else
		{
			System.out.println("입력하신 수는 3의 배수가 아닙니다.");
		}
		
		scanner.close();
	}
}
