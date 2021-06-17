package com.lec.ex06_car;

public class TestMain {
	public static void main(String[] args) {
		Car c1 = new HighGradeCar("빨강","광폭타이어", 2500);
		Car c2 = new LowGradeCar("주황","일반타이어", 1000);
		
		c1.getSpec();
		c2.getSpec();
	}
}
