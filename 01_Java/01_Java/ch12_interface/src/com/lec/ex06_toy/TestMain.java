package com.lec.ex06_toy;

public class TestMain {
	public static void main(String[] args) {
//		Pooh pooh = new Pooh();
//		IMoveArmLeg pooh2 = new Pooh();
		IToy[] toy = {new Pooh(), new Mazingar(), new Plane()};
		
		for(IToy i : toy) {
			System.out.println(i.toString());
			System.out.println(i.getClass().getName());
		} // for
	} // main
} // class