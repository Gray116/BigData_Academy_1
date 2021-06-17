package com.lec.ex06_car;

public class LowGradeCar extends Car {
	public LowGradeCar(String color, String tire, int displacement) {
		super(color, tire, displacement);
	}

	private int tax = 100000; // 기본 세금
	
	@Override
	public void getSpec() {
		System.out.println("색상 : " + getColor());
		System.out.println("타이어 : " + getTire());
		System.out.println("배기량 : " + getDisplacement());
		
		if(getDisplacement() <= 1000) {
			tax += (getDisplacement() - 1000) * 900;
			System.out.println("세금 : " + tax);
			System.out.println("======================");
		}
		else {
			System.out.println();
		}
	}
}