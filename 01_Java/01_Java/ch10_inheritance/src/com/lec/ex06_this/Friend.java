package com.lec.ex06_this;

public class Friend {
	private String name;
	private String tel;
	
	public Friend() {
		System.out.println("�Ű����� ���� ������ �Լ�");
	}
	
	public Friend(String name) {
		this();
		this.name = name;
		
		System.out.println("�Ű����� 1��¥��");
	}
	public Friend(String name, String tel) {
		// this. : ����ü�� 
		// this() : ����ü�� �������Լ�
		this(name);
		this.tel = tel;
		
		System.out.println("�Ű����� 2��¥��");
	}
}
