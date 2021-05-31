package com.lec.ex02_super;

public class Child extends SuperIJ {
	private int total;
	
	public Child() {
		/* 왠만하면 만들어 놔야 함 */
		System.out.println("매개변수 없는 Child 생성자 함수");
	}
	
	public Child(int i, int j) {
		/* main 함수에서 Child child = new Child(1,2)를 만들 예정 */
		setI(i); 
		setJ(j);
		
		System.out.println("매개변수 있는 Child 생성자 함수");
	}
	
	public void sum() {
		total = getI() + getJ(); //total = i + j;
		
		System.out.println("본 객체의 total값은 " + total);
	}
}