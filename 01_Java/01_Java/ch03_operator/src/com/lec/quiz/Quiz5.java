package com.lec.quiz;

import java.util.Scanner;

public class Quiz5 
{
	public static void main(String[] args)
	{
		int kuk, su, eng = 0;
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("���� ������ �Է��ϼ��� : ");
		kuk = scanner.nextInt();
		
		System.out.print("���� ������ �Է��ϼ��� : ");
		su = scanner.nextInt();
		
		System.out.print("���� ������ �Է��ϼ��� : ");
		eng = scanner.nextInt();
		
		int hab = kuk + su + eng;
		float aver = (kuk + su + eng) / 3;
		
		System.out.printf("������ %d��, ����� %.2f���Դϴ�.", hab, aver);
		
		scanner.close();
	}
}