package com.lec.ex02_date;

import java.util.Date;

public class Ex03_date {
	public static void main(String[] args) {
		Date date = new Date();
		System.out.println(date);
		
		int year = date.getYear() + 1900; // �������� �ִ� �Լ��� ������ ���شٴ� ǥ��
		System.out.println(year);
		
		int month = date.getMonth();
		int day = date.getDate();
		System.out.println(year + "��" + month + "��" + day + "��");
		
		System.out.printf("%1$tY�� %1$tm�� %1$td�� %1$tH�� %1$tM�� %1$tS��(24�ð�) %1$tp %1$tl�� %1$tM�� %tS��\n", date);
	}
}