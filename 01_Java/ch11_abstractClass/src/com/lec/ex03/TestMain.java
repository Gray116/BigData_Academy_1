package com.lec.ex03;
// Super : 1추상, 2일반
// Child : 1추상, 2일반, 3일반
// G.C : 1일반, 2일반, 3일반
public class TestMain {
	public static void main(String[] args) {
		GrandChild g = new GrandChild();
		
		g.method1();
		g.mehtod2();
		g.method3();
		System.out.println("=======================");
		
		Child c = new GrandChild();
		
		c.method1();
		c.mehtod2();
		c.method3();
		System.out.println("=======================");
		
		Super s = new GrandChild();
		
		s.method1();
		s.mehtod2();
	}
}
