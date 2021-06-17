package com.lec.ex2_map;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Friend {
	private String name;
	private String tel;
	private Date birth;
	
	public Friend(String name, String tel, Date birth) { // 模备 积老 救促
		this.name = name;
		this.tel = tel;
		this.birth = birth;
	}

	public Friend(String name, String tel) { // 模备 积老 葛弗促
		this.name = name;
		this.tel = tel;
	}

	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("M岿 d老");
		if(birth != null) {
			return name + "狼 楷遏贸 : " + tel + "   积老 : " + sdf.format(birth);
		}
		else {
			return name + "狼 楷遏贸 : " + tel;
		}
	}
}











