package com.lec.ex5_momChild;

public class ChildTestMain {
	public static void main(String[] args) {
		Child child1 = new Child("ù° �ʸ���");
		Child child2 = new Child("��° �ʸ���");
		Child child3 = new Child("��° �ʸ�");
		
		child1.takeMoney(1000);
		child2.takeMoney(1000);
		child3.takeMoney(1000);
		
		System.out.println("ù° ���� ���� : " + MomPouch.money);
		System.out.println("ù° ���� ���� : " + MomPouch.money);
		System.out.println("ù° ���� ���� : " + MomPouch.money);
	}
}
