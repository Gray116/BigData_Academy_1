package com.lec.car;

import java.util.Scanner;

public class CarMain {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		Car myPorsche = new Car(); // Car�� ��ü myPorsche ����
		myPorsche.setColor("����");
		
		System.out.println(myPorsche.getColor());
		
		myPorsche.drive();
		myPorsche.park();
		myPorsche.race();
		
		Car yourPorsche = new Car();
		yourPorsche.setColor("���");
		
		System.out.println("�� ������ ���� : "  + myPorsche.getColor());
		System.out.println("�� ������ ���� : " + yourPorsche.getColor());
		
		sc.close();
	}
}