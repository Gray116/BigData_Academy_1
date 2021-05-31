package com.lec.ex05;

public class TestMain {
	public static void main(String[] args) {
		TestChildClass obj = new TestChildClass();
		System.out.printf("i1 = %d, i2 = %d, i3 = %d, i11 = %d\n", TestClass.i1, TestClass.i2, TestClass.i3, TestChildClass.i11);
		
		System.out.println();
		obj.m1();
		obj.m2();
		obj.m3();
		obj.m11();
		System.out.println();
		
		TestClass obj2 = obj;
		if(obj.equals(obj2)) {
			System.out.println("두 객체 변수 obj와 obj2는 같다.");
		} // if
		
		obj2.m1();
		obj2.m2();
		obj2.m3();
		
	} // main
} // class