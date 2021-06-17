package com.lec.ex02;

public class Child extends Super {

	@Override
	public void method1() { // 추상 메소드
		System.out.println("Child의 method1() - 추상메소드라 꼭 override!");
	}
	
	public void method3() { // 일반 메소드
		System.out.println("Child의 method3()");
	}

	public void method2() {
	}

}
