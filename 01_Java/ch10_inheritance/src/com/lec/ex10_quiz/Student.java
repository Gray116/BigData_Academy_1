package com.lec.ex10_quiz;

public class Student extends Person {
	private String ban;
	
	public Student() {
		System.out.println("�Ű�����(���޹޴� ��)�� ���� ������ �Լ�");
	}

	public Student(String id, String name, String ban) {
		super(id, name);
		this.ban = ban;
	}
	
	@Override
	public void info() {
		System.out.println("(ID)" + getId() + "\t(�̸�)" + getName() + "\t(��)" + ban);
	}
}