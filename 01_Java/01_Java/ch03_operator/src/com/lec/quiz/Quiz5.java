package com.lec.quiz;

import java.util.Scanner;

public class Quiz5 
{
	public static void main(String[] args)
	{
		int kuk, su, eng = 0;
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("국어 점수를 입력하세요 : ");
		kuk = scanner.nextInt();
		
		System.out.print("수학 점수를 입력하세요 : ");
		su = scanner.nextInt();
		
		System.out.print("영어 점수를 입력하세요 : ");
		eng = scanner.nextInt();
		
		int hab = kuk + su + eng;
		float aver = (kuk + su + eng) / 3;
		
		System.out.printf("총점은 %d점, 평균은 %.2f점입니다.", hab, aver);
		
		scanner.close();
	}
}