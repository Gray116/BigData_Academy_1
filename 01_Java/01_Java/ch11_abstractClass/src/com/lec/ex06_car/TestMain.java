package com.lec.ex06_car;

public class TestMain {
	public static void main(String[] args) {
		Car c1 = new HighGradeCar("����","����Ÿ�̾�", 2500);
		Car c2 = new LowGradeCar("��Ȳ","�Ϲ�Ÿ�̾�", 1000);
		
		c1.getSpec();
		c2.getSpec();
	}
}
