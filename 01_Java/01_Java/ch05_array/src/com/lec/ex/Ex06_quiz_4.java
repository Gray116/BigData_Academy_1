package com.lec.ex;

import java.util.Scanner;

public class Ex06_quiz_4 { /* �Ž����� n���� 500, 100, 50, 10¥���� �� �� �� ����? */
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int money = 0;
		int[] coinUnit = {500, 100, 50, 10};
		
		System.out.print("�Ž��� ���� �Է��ϼ��� : ");
		money = sc.nextInt();
		
		for(int i=0; i<coinUnit.length; i++) {
			System.out.println(coinUnit[i] + "�� : " + money / coinUnit[i]+"��");
			money %= coinUnit[i];
		} // for
		
		sc.close();
	} // main
} // class