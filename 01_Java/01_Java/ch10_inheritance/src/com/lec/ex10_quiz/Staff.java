package com.lec.ex10_quiz;

public class Staff extends Person {
	private String department;
	
	public Staff() {
		System.out.println("�Ű�����(���޹޴� ��)�� ���� ������ �Լ�");
	}

	public Staff(String id, String name, String department) {
		super(id, name);
		this.department = department;
	}
	
	@Override
	public void info() {
		System.out.println("(ID)" + getId() + "\t(�̸�)" + getName() + "\t(�μ�)" + department);
	}
}