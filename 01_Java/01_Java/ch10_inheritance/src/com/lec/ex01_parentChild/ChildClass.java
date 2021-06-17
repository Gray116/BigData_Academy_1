package com.lec.ex01_parentChild;

public class ChildClass extends ParentClass {
	String cStr = "자식 클래스 = Child 클래스";
	
	public ChildClass() {
		System.out.println("자식 클래스의 객체 부분 생성시 호출");
	}
}