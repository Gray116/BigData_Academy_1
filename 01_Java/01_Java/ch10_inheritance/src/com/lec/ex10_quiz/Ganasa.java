package com.lec.ex10_quiz;

public class Ganasa extends Person{
	private String subject;
	
	public Ganasa() {
		System.out.println("�Ű�����(���޹޴� ��)�� ���� ������ �Լ�");
	}

	public Ganasa(String id, String name, String subject) {
		super(id, name);
		this.subject = subject;
	}
	
	@Override
	public void info() {
		System.out.println("(ID)" + getId() + "\t(�̸�)" + getName() + "\t(����)" + subject);
	}
}
