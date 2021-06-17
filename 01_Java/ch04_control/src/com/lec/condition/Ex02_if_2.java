package com.lec.condition;

import java.util.Scanner;

public class Ex02_if_2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("국어 점수를 입력하세요 : ");
		int kuk = sc.nextInt();
		
		System.out.print("영어 점수를 입력하세요 : ");
		int eng = sc.nextInt();
		
		System.out.print("수학 점수를 입력하세요 : ");
		int su = sc.nextInt();
		
		double aver = (kuk + eng + su) / 3;
		
		System.out.printf("\n평균 점수 : %.1f\n\n", aver);
		
		if(kuk  >= aver) {
			System.out.printf("국어 점수 %d점 - 평균 이상입니다.\n", kuk);
		}
		else {
			System.out.printf("국어 점수 %d점 - 평균 이하입니다.\n", kuk);
		}
		
		if(eng  >= aver) {
			System.out.printf("영어 점수 %d점 - 평균 이상입니다.\n", eng);
		}
		else {
			System.out.printf("영어 점수 %d점 - 평균 이하입니다.\n", eng);
		}
		
		if(su  >= aver) {
			System.out.printf("수학 점수 %d점 - 평균 이상입니다.\n", su);
		}
		else {
			System.out.printf("수학 점수 %d점 - 평균 이하입니다.\n", su);
		}
		
		sc.close();
	}
}