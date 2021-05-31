package com.lec.ex02_sawon;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

public class Sawon {
	private String saNo;
	private String name;
	private String departments;
	private Date joinDate; // �⺻�� null
	
	public Sawon(String saNo, String name, String departments) {
		this.saNo = saNo;
		this.name = name;
		this.departments = departments;
		joinDate = new Date(); // ��ü�� �����Ǵ� ������ �Էµ�
	}
	
	public Sawon(String saNo, String name, String departments, int y, int m, int d) {
		this.saNo = saNo;
		this.name = name;
		this.departments = departments;
		joinDate = new Date(new GregorianCalendar(y, m-1, d).getTimeInMillis()); // Ư���� ������ �����ͷ� �Էµ� TimeInMillis ������
	}
	
	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy�� M�� d��");
		String temp = sdf.format(joinDate);
		if(departments.length() >= 8) {
			return "[���]" + saNo + "\t[�̸�]" + name + "\t[�μ�]" + departments + "\t[�Ի���]" + temp + "\n";
		}
		else {
			return "[���]" + saNo + "\t[�̸�]" + name + "\t[�μ�]" + departments + "\t\t[�Ի���]" + temp + "\n";
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