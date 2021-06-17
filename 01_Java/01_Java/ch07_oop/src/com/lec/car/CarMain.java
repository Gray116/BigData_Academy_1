package com.lec.car;

import java.util.Scanner;

public class CarMain {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		Car myPorsche = new Car(); // CarÇü °´Ã¼ myPorsche »ý¼º
		myPorsche.setColor("»¡°­");
		
		System.out.println(myPorsche.getColor());
		
		myPorsche.drive();
		myPorsche.park();
		myPorsche.race();
		
		Car yourPorsche = new Car();
		yourPorsche.setColor("Áã»ö");
		
		System.out.println("³» Æ÷¸£½¦ »ö»ó : "  + myPorsche.getColor());
		System.out.println("³Ê Æ÷¸£½¦ »ö»ó : " + yourPorsche.getColor());
		
		sc.close();
	}
}