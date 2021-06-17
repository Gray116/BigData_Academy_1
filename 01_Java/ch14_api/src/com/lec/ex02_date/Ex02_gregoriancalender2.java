package com.lec.ex02_date;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Scanner;

public class Ex02_gregoriancalender2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		GregorianCalendar cal= new GregorianCalendar(); // singleton이냐 아니냐의 차이
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH); // 이번달 중 몇번째 날짜인지
		int week = cal.get(Calendar.DAY_OF_WEEK); // 이번주 중 몇번째 날인지, 1(일) 2(월) ....
		int hour24 = cal.get(Calendar.HOUR_OF_DAY);
		int hour = cal.get(Calendar.HOUR);
		int ampm = cal.get(Calendar.AM_PM);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		
		System.out.printf("%d년 %d월 %d일", year, month, day);
		
		switch (week) {
		case 1:
			System.out.println("일요일");
			break;
			
		case 2:
			System.out.println("월요일");
			break;
			
		case 3:
			System.out.println("화요일");
			break;
			
		case 4:
			System.out.println("수요일");
			break;
			
		case 5:
			System.out.println("목요일");
			break;
			
		case 6:
			System.out.println("금요일");
			break;
			
		case 7:
			System.out.println("토요일");
			break;
		} // switch
		
		System.out.printf("%d시 %d분 %d초(24시간 단위) - ", hour24, minute, second);
		System.out.println(ampm == 0? "오전": "오후");
		System.out.printf("%d시 %d분 %d초(12시간 단위)\n", hour, minute, second);
		
		/* 연도만 뿌리려면 %tY(년) td(일) tH(24시간 단위) tl(12시간 단위) tp(오전/오후) tM(분) tS(초) */
		// d(정수) f(실수) s(문자열) c(문자) b(참거짓)...
		System.out.printf("%tY년 %tm월 %td일 %tH시 %tM분 %tS초(24시간) %tp %tl시 %tM분 %tS초\n", cal, cal, cal, cal, cal, cal, cal, cal, cal, cal);
		
		System.out.printf("%1$tY년 %1$tm월 %1$td일 %1$tH시 %1$tM분 %1$tS초(24시간) %1$tp %1$tl시 %1$tM분 %tS초\n", cal);
	} // main
} // class


















