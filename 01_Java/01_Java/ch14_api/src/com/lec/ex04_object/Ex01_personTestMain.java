package com.lec.ex04_object;

public class Ex01_personTestMain {
	public static void main(String[] args) {
		Person p1 = new Person(9201011044321L);
		Person p2 = new Person(9201011044321L);
		
		if(p1.equals(p2)) {
			System.out.println("���� ���.");
		}
		else {
			System.out.println("�ٸ� ���.");
		}
		
		if(p1 == p2) {
			System.out.println("p1�� p2�� ���� �ּ�.");
		}
		else {
			System.out.println("p1�� p2�� �ٸ� �ּ�.");
		}
	}
}