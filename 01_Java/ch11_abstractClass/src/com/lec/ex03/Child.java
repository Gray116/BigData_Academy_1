package com.lec.ex03;

public abstract class Child extends Super { // 내가 추상 클래스가 되든, override를 하던 해야 함
	public void method2() {
		System.out.println("Child의 method2()");
	}
	
	public void method3() {
		System.out.println("Child의 method3()");
	}
}