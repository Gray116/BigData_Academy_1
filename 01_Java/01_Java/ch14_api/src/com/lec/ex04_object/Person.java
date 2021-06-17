package com.lec.ex04_object;

public class Person {
	private long juminNo;
	
	public Person(long juminNo) {
		this.juminNo = juminNo;
	}
	
	@Override
	public boolean equals(Object obj) {
		// p1.equals(p2)�� ȣ���� ��� p1��� this, p2��� obj
		// juminNo�� obj�� juminNo�� ������ return
		if(obj != null && obj instanceof Person) {
			return juminNo == ((Person)obj).juminNo;
		}
		else {
			return false;
		}
	}
}