package com.lec.ex08_person;

public class Person {
	private String name;
	private String character;
	
	public Person() {
		System.out.println("매개변수(전달받는 값)가 없는 Person 생성자 함수");
	}
	
	public Person(String name, String character) {
		this.name = name;
		this.character = character;
		
		System.out.println("매개변수(전달받는 값)가 있는 Person 생성자 함수");
	}
	
	public void intro() {
		System.out.println(name + "는(은) " + character);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCharacter() {
		return character;
	}

	public void setCharacter(String character) {
		this.character = character;
	}
}