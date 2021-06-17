package com.lec.ex3_accessTest;

public class AccessTest {
	int defaultMember; // 디폴트 접근제한은 같은 패키지에서만
	protected int protectedMember; // 같은 패키지와 상속받은 클래스에서 사용가능
	public int publicMember; // 외부에서 아무나
	
	void defaultMethod() {
		System.out.println("default 메소드");
	}
	
	protected void protectedMethod() {
		System.out.println("protected 메소드");
	}
	
	public void publicMethod() {
		System.out.println("public 메소드");
	}

}
