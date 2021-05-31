package com.lec.ex2_human;

public class Man {
	private int age; // class안의 데이터는 private : 은닉시켜야 함
	
	public Man() {
		System.out.println("개발자가 생성자 함수를 만들지 않으면 컴파일러가 default 생성자를 생성");
	}
	
	public Man(int age) {
		System.out.println("매개변수(파라미터)가 있는 생성자 함수 호출");
		this.age = age; // 데이터 초기화
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}