package com.lec.ex02;

public class TestMain {
	public static void main(String[] args) {
		Child c1 = new Child(); // 추상 클래스는 객체 생성 불가
		
		c1.method1();
		c1.method2();
		c1.method3();
		
		Super c2 = new Child();
		
		c2.method1();
		c2.method2();
		((Child)c2).method3();
	}
}
