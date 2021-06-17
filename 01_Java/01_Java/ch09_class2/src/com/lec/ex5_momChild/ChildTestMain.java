package com.lec.ex5_momChild;

public class ChildTestMain {
	public static void main(String[] args) {
		Child child1 = new Child("첫째 똘만이");
		Child child2 = new Child("둘째 똘마니");
		Child child3 = new Child("셋째 똘말");
		
		child1.takeMoney(1000);
		child2.takeMoney(1000);
		child3.takeMoney(1000);
		
		System.out.println("첫째 엄마 지갑 : " + MomPouch.money);
		System.out.println("첫째 엄마 지갑 : " + MomPouch.money);
		System.out.println("첫째 엄마 지갑 : " + MomPouch.money);
	}
}
