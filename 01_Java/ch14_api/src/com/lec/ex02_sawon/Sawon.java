package com.lec.ex02_sawon;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

public class Sawon {
	private String saNo;
	private String name;
	private String departments;
	private Date joinDate; // 기본은 null
	
	public Sawon(String saNo, String name, String departments) {
		this.saNo = saNo;
		this.name = name;
		this.departments = departments;
		joinDate = new Date(); // 객체가 생성되는 시점이 입력됨
	}
	
	public Sawon(String saNo, String name, String departments, int y, int m, int d) {
		this.saNo = saNo;
		this.name = name;
		this.departments = departments;
		joinDate = new Date(new GregorianCalendar(y, m-1, d).getTimeInMillis()); // 특정한 시점이 데이터로 입력됨 TimeInMillis 때문에
	}
	
	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 M월 d일");
		String temp = sdf.format(joinDate);
		if(departments.length() >= 8) {
			return "[사번]" + saNo + "\t[이름]" + name + "\t[부서]" + departments + "\t[입사일]" + temp + "\n";
		}
		else {
			return "[사번]" + saNo + "\t[이름]" + name + "\t[부서]" + departments + "\t\t[입사일]" + temp + "\n";
		}
	}

	public String getSaNo() {
		return saNo;
	}

	public String getName() {
		return name;
	}

	public String getDepartments() {
		return departments;
	}
}