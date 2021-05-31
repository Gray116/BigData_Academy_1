package com.lec.ex04_object;

public class Person {
	private long juminNo;
	
	public Person(long juminNo) {
		this.juminNo = juminNo;
	}
	
	@Override
	public boolean equals(Object obj) {
		// p1.equals(p2)를 호출할 경우 p1대신 this, p2대신 obj
		// juminNo와 obj의 juminNo가 같은지 return
		if(obj != null && obj instanceof Person) {
			return juminNo == ((Person)obj).juminNo;
		}
		else {
			return false;
		}
	}
}