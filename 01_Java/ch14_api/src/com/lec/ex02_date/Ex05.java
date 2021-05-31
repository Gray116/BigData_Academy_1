package com.lec.ex02_date;

import java.text.SimpleDateFormat;
import java.util.Date;
import com.lec.ex01_friend.Friend;

public class Ex05 {
	public static void main(String[] args) {
		Friend[] friends = {new Friend("홍길동", "010-9999-9999", "03-24"),
												new Friend("김길동", "010-8889-8889", "05-24"),
												new Friend("박길동", "010-7778-7778", "05-24")
												};
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		boolean searchOk = false;
		
		for(int idx=0;  idx<friends.length;  idx++) {
			if(sdf.format(now).equals(friends[idx].getBirthday())) {
				System.out.println("오늘 생일자는 " + friends[idx].getName() + "입니다.");
				searchOk = true;
			} // if
		} // for
		if(!searchOk) {
			System.out.println("오늘 생일자는 없습니다.");
		}
	} // main
} // class