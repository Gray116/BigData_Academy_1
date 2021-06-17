package com.lec.ex12_final;

public final class Dog extends Animal {
	@Override
	public void running() {
		speed += 10;
		System.out.println("강아지의 현재속도 : " + speed);
	}
	
	public void method() {
		System.out.println("method");
	}
}
