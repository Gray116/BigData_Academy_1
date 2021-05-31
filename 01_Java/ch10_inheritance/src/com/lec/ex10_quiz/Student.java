package com.lec.ex10_quiz;

public class Student extends Person {
	private String ban;
	
	public Student() {
		System.out.println("매개변수(전달받는 값)가 없는 생성자 함수");
	}

	public Student(String id, String name, String ban) {
		super(id, name);
		this.ban = ban;
	}
	
	@Override
	public void info() {
		System.out.println("(ID)" + getId() + "\t(이름)" + getName() + "\t(반)" + ban);
	}
}