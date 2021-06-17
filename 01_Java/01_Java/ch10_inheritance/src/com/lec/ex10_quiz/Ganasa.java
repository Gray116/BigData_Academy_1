package com.lec.ex10_quiz;

public class Ganasa extends Person{
	private String subject;
	
	public Ganasa() {
		System.out.println("매개변수(전달받는 값)가 없는 생성자 함수");
	}

	public Ganasa(String id, String name, String subject) {
		super(id, name);
		this.subject = subject;
	}
	
	@Override
	public void info() {
		System.out.println("(ID)" + getId() + "\t(이름)" + getName() + "\t(과목)" + subject);
	}
}
