package com.lec.ex02_super;

public class TestMain {
	public static void main(String[] args) {
		Child child = new Child(1,2);
		
		System.out.println("i�� : " + child.getI());
		System.out.println("j�� : " + child.getJ());
		
		child.setI(200);
		child.setJ(300);
		
		child.sum();
	}
}