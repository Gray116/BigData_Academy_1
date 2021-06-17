package com.lec.ex03;

public abstract class Super { // 추상 클래스
	public Super() {} // 디폴트 생성자
	public abstract void method1(); // 추상 메소드(구현부는 없고 선언문만), 상속받는 클래스에서 반드시 override
	public void mehtod2() { // 일반 메소드
		System.out.println("Super의 method2()");
	}
}