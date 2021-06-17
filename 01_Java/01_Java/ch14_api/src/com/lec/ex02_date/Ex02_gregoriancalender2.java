package com.lec.ex02_date;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Scanner;

public class Ex02_gregoriancalender2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		GregorianCalendar cal= new GregorianCalendar(); // singleton�̳� �ƴϳ��� ����
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH); // �̹��� �� ���° ��¥����
		int week = cal.get(Calendar.DAY_OF_WEEK); // �̹��� �� ���° ������, 1(��) 2(��) ....
		int hour24 = cal.get(Calendar.HOUR_OF_DAY);
		int hour = cal.get(Calendar.HOUR);
		int ampm = cal.get(Calendar.AM_PM);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		
		System.out.printf("%d�� %d�� %d��", year, month, day);
		
		switch (week) {
		case 1:
			System.out.println("�Ͽ���");
			break;
			
		case 2:
			System.out.println("������");
			break;
			
		case 3:
			System.out.println("ȭ����");
			break;
			
		case 4:
			System.out.println("������");
			break;
			
		case 5:
			System.out.println("�����");
			break;
			
		case 6:
			System.out.println("�ݿ���");
			break;
			
		case 7:
			System.out.println("�����");
			break;
		} // switch
		
		System.out.printf("%d�� %d�� %d��(24�ð� ����) - ", hour24, minute, second);
		System.out.println(ampm == 0? "����": "����");
		System.out.printf("%d�� %d�� %d��(12�ð� ����)\n", hour, minute, second);
		
		/* ������ �Ѹ����� %tY(��) td(��) tH(24�ð� ����) tl(12�ð� ����) tp(����/����) tM(��) tS(��) */
		// d(����) f(�Ǽ�) s(���ڿ�) c(����) b(������)...
		System.out.printf("%tY�� %tm�� %td�� %tH�� %tM�� %tS��(24�ð�) %tp %tl�� %tM�� %tS��\n", cal, cal, cal, cal, cal, cal, cal, cal, cal, cal);
		
		System.out.printf("%1$tY�� %1$tm�� %1$td�� %1$tH�� %1$tM�� %1$tS��(24�ð�) %1$tp %1$tl�� %1$tM�� %tS��\n", cal);
	} // main
} // class


















