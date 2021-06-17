package com.lec.ex01_friend;

public class Friend {
	private String name;
	private String phoneNum;
	private String birthday;

	public Friend(String name, String phoneNum, String birthday) {
		this.name = name;
		this.phoneNum = phoneNum;
		this.birthday = birthday;
	}
	
	@Override
	public String toString() {
		return "\n��\t�� : " + name + "\n" + "�ڵ��� : " + phoneNum + "\n" + "��\t�� : " + birthday + "\n";
	}

	public String getName() {
		return name;
	}

	public String getPhoneNum() {
		return phoneNum;
	}
	
	public String getBirthday() {
		return birthday;
	}
}