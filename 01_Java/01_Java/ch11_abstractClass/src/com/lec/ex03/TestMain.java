package com.lec.ex03;
// Super : 1�߻�, 2�Ϲ�
// Child : 1�߻�, 2�Ϲ�, 3�Ϲ�
// G.C : 1�Ϲ�, 2�Ϲ�, 3�Ϲ�
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
