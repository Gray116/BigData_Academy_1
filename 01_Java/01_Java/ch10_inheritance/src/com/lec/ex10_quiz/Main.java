package com.lec.ex10_quiz;

public class Main {
	public static void main(String[] args) {
		Person[] stu = {new Student("A01", "���л�", "JaVa��"),
										new Student("A02", "ȫ�浿", "C++��"),
										new Staff("S01", "������", "������"),
										new Staff("S02", "������", "���������"),
										new Ganasa("G01", "������", "���α׷���")
										};
		
		for(Person p : stu) {			
			p.info();
		}
	}
}