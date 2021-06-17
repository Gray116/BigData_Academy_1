package com.lec.ex06_toy;

public class Plane implements IMissle, ILight {
	public Plane() {
		System.out.println("\n비행기입니다.");
		canMissle();
		canReflect();
		System.out.println();
	}
	
	@Override
	public void canReflect() {
		System.out.println("불빛 반사 가능합니다.");
	}

	@Override
	public void canMissle() {
		System.out.println("미사일을 쏠 수 있습니다.");
	}
	
	@Override
	public String toString() {
		return "불빛과 미사일이 나가는 비행기";
	}
}