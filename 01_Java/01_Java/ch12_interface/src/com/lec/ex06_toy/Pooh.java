package com.lec.ex06_toy;

public class Pooh implements IMoveArmLeg {
	public Pooh() {
		System.out.println("곰돌이 푸입니다.");
		canMoveArmLeg();
		System.out.println();
	}
	
	@Override
	public void canMoveArmLeg() {
		System.out.print("팔다리를 움질일 수 있습니다.");
	}
	
	@Override
	public String toString() {
		return "팔다리를 움직이는 곰돌이 푸";
	}
}