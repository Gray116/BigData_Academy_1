package com.lec.condition;

import java.util.Scanner;

public class Ex02_if_2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("���� ������ �Է��ϼ��� : ");
		int kuk = sc.nextInt();
		
		System.out.print("���� ������ �Է��ϼ��� : ");
		int eng = sc.nextInt();
		
		System.out.print("���� ������ �Է��ϼ��� : ");
		int su = sc.nextInt();
		
		double aver = (kuk + eng + su) / 3;
		
		System.out.printf("\n��� ���� : %.1f\n\n", aver);
		
		if(kuk  >= aver) {
			System.out.printf("���� ���� %d�� - ��� �̻��Դϴ�.\n", kuk);
		}
		else {
			System.out.printf("���� ���� %d�� - ��� �����Դϴ�.\n", kuk);
		}
		
		if(eng  >= aver) {
			System.out.printf("���� ���� %d�� - ��� �̻��Դϴ�.\n", eng);
		}
		else {
			System.out.printf("���� ���� %d�� - ��� �����Դϴ�.\n", eng);
		}
		
		if(su  >= aver) {
			System.out.printf("���� ���� %d�� - ��� �̻��Դϴ�.\n", su);
		}
		else {
			System.out.printf("���� ���� %d�� - ��� �����Դϴ�.\n", su);
		}
		
		sc.close();
	}
}