package com.lec.ex06_toy;

public class Mazingar implements IMissle, IMoveArmLeg {
	public Mazingar() {
		System.out.println("\n마징가 장난감입니다.");
		canMissle();
		canMoveArmLeg();
	}

	@Override
	public void canMissle() {
		System.out.println("미사일을 쏠 수 있습니다.");
	}
	
	@Override
	public void canMoveArmLeg() {
		System.out.println("팔다리를 움직일 수 있습니다.");
	}
	
	@Override
	public String toString() {
		return "미사일을 쏘고 팔다리를 움직이는 마징가";
	}
}