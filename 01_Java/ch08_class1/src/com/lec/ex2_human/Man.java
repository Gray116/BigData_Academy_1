package com.lec.ex2_human;

public class Man {
	private int age; // class���� �����ʹ� private : ���н��Ѿ� ��
	
	public Man() {
		System.out.println("�����ڰ� ������ �Լ��� ������ ������ �����Ϸ��� default �����ڸ� ����");
	}
	
	public Man(int age) {
		System.out.println("�Ű�����(�Ķ����)�� �ִ� ������ �Լ� ȣ��");
		this.age = age; // ������ �ʱ�ȭ
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}