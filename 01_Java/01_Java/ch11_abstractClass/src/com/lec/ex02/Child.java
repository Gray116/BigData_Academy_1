package com.lec.ex02;

public class Child extends Super {

	@Override
	public void method1() { // �߻� �޼ҵ�
		System.out.println("Child�� method1() - �߻�޼ҵ�� �� override!");
	}
	
	public void method3() { // �Ϲ� �޼ҵ�
		System.out.println("Child�� method3()");
	}

	public void method2() {
	}

}
