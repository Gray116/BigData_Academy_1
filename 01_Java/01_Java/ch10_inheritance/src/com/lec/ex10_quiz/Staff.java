package com.lec.ex10_quiz;

public class Staff extends Person {
	private String department;
	
	public Staff() {
		System.out.println("매개변수(전달받는 값)가 없는 생성자 함수");
	}

	public Staff(String id, String name, String department) {
		super(id, name);
		this.department = department;
	}
	
	@Override
	public void info() {
		System.out.println("(ID)" + getId() + "\t(이름)" + getName() + "\t(부서)" + department);
	}
}