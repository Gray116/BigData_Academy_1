package com.lec.ex2_map;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Friend {
	private String name;
	private String tel;
	private Date birth;
	
	public Friend(String name, String tel, Date birth) { // ģ�� ���� �ȴ�
		this.name = name;
		this.tel = tel;
		this.birth = birth;
	}

	public Friend(String name, String tel) { // ģ�� ���� �𸥴�
		this.name = name;
		this.tel = tel;
	}

	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("M�� d��");
		if(birth != null) {
			return name + "�� ����ó : " + tel + "   ���� : " + sdf.format(birth);
		}
		else {
			return name + "�� ����ó : " + tel;
		}
	}
}











