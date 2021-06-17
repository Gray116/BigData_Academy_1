package com.lec.ex5_lib;

import java.util.Date;
import java.util.GregorianCalendar;

public class DateTestMain {
	public static void main(String[] args) {
//		Date nowDay = new Date(121, 4, 1); // 원하는 연도 (1900 + n)년
		Date thatDay = new Date(new GregorianCalendar(2021, 4, 1).getTimeInMillis());
		Date now = new Date();
		
		long diff = now.getTime() - thatDay.getTime();
		long day = diff / (1000*60*60*24);
		
		System.out.println("두 날 사이의 날짜수는 " + day + "일");
		
		if(day > 14) {
			long money = (day - 14) * 100;
			System.out.println(money + "원의 연체료 발생");
		}
	}
}