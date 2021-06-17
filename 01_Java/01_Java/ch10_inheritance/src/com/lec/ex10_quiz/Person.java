package com.lec.ex10_quiz;

public class Person {
	private String id;
	private String name;
	
	public Person() {
		System.out.println("매개변수(전달받는 값)가 없는 생성자 함수");
	}

	public Person(String id, String name) {
		this.id = id;
		this.name = name;
	}
	
	public void info() {
		System.out.println("(ID)" + id + "\t(이름)" + name);
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
