package com.lec.ex02_date;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Ex04_simpledateformat {
	public static void main(String[] args) {
		Date now1 = new Date();
		Calendar now2 = Calendar.getInstance();
		GregorianCalendar now3 = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 a h시 m분 s초");
		// yyyy = 연도 4자리, yy = 연도 두자리, M = (5월), MM = (05월), d = (9일), dd = (09일)
		// E = 요일, a(오전/오후), H(24시간단위), h(12시간 단위), m(분), s(초)
		// w(이번연도의 몇번째 주인지) W(이번 월의 몇번째 주인지), D(올해의 몇번째 날인지)
		
		System.out.println(sdf.format(now1));
		System.out.println(sdf.format(now2.getTime()));
		System.out.println(sdf.format(now3.getTime()));
	}
}