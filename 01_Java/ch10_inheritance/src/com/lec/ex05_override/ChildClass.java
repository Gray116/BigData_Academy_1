package com.lec.ex05_override;

public class ChildClass extends ParentClass {
	public ChildClass() {
		/* 생성자 함수의 오버로딩 (함수 중복정의) */
		System.out.println("Child 매개변수 없는 생성자 함수");
	}
	
	public ChildClass(int i) {
		System.out.println("Child 매개변수 있는 생성자");
	}
	
	/* 오버라이딩(함수(메소드)의 재정의), 어노테이션 */
	@Override
	public void method1() {
		System.out.println("Child의 method1()");
	}
	
	public void method3() { /* 새롭게 추가한 함수(메소드) */
		System.out.println("Child의 method3()");
	}
}