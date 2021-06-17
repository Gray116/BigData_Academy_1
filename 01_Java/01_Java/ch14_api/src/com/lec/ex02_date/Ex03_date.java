package com.lec.ex02_date;

import java.util.Date;

public class Ex03_date {
	public static void main(String[] args) {
		Date date = new Date();
		System.out.println(date);
		
		int year = date.getYear() + 1900; // 삭제선이 있는 함수는 앞으로 없앤다는 표시
		System.out.println(year);
		
		int month = date.getMonth();
		int day = date.getDate();
		System.out.println(year + "년" + month + "월" + day + "일");
		
		System.out.printf("%1$tY년 %1$tm월 %1$td일 %1$tH시 %1$tM분 %1$tS초(24시간) %1$tp %1$tl시 %1$tM분 %tS초\n", date);
	}
}