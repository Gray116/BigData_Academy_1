package com.lec.ex08_person;

public class Baby extends Person {
	public Baby() {
		System.out.println("매개변수(전달받는 값)가 없는 Baby 생성자");
	}
	
	public Baby(String name, String character) {
		super(name, character); // 부모단의 생성자를 호출, 항상 첫번째 줄에 나와야 함
		
		System.out.println("매개변수(전달받는 값)가 있는 Baby 생성자");
	}
	
	public void cry() {
		System.out.println("응애 응애");
	}
	
	/* intro override */
	@Override
	public void intro() {
		System.out.println(getName() + "은(는) 아기라서 엄마가 대신 소개할게요.");
		super.intro();
	}
}
