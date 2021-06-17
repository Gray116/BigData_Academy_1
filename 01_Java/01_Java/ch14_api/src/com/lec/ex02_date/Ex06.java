package com.lec.ex02_date;

import java.util.Calendar;

import com.lec.ex01_friend.Friend;

public class Ex06 {
	public static void main(String[] args) {
		Friend[] friends = {new Friend("홍길동", "010-9999-9999", "01-24"),
												new Friend("김길동", "010-8889-8889", "05-24"),
												new Friend("박길동", "010-7778-7778", "03-24")
												};
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		String strMonth = (month < 10)? "0" + month : "" + month;
		String strDay = (day < 10)? "0" + day : String.valueOf(day);
		String strToday = strMonth + "-" + strDay;
		
		boolean searchOk = false;
		
		for(int idx=0; idx<friends.length; idx++) {
			if(friends[idx].getBirthday().equals(strToday)) {
				System.out.println(friends[idx]);
				searchOk = true;
			}
		}
		if(!searchOk) {
			System.out.println("오늘 생일자는 없습니다.");
		}
	}
}