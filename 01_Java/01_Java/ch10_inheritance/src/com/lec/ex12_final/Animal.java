package com.lec.ex12_final;

public class Animal { // final을 변수에 붙이면 수정불가, 메소드에 붙이면 오버라이드 불가, 클래스에 붙이면 상속금지
	protected int speed;
	
	public void running() {
		speed += 5;
		System.out.println("뛰고 있어요. 현재 속도 : " + speed);
	}
	
	public final void stop() {
		speed = 0;
		System.out.println("멈춤");
	}
}
