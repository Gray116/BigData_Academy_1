package com.lec.ex5_lib;

import java.util.Date;
import java.util.GregorianCalendar;

public class DateTestMain {
	public static void main(String[] args) {
//		Date nowDay = new Date(121, 4, 1); // ���ϴ� ���� (1900 + n)��
		Date thatDay = new Date(new GregorianCalendar(2021, 4, 1).getTimeInMillis());
		Date now = new Date();
		
		long diff = now.getTime() - thatDay.getTime();
		long day = diff / (1000*60*60*24);
		
		System.out.println("�� �� ������ ��¥���� " + day + "��");
		
		if(day > 14) {
			long money = (day - 14) * 100;
			System.out.println(money + "���� ��ü�� �߻�");
		}
	}
}