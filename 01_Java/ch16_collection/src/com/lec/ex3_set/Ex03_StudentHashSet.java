package com.lec.ex3_set;

import java.util.HashSet;

public class Ex03_StudentHashSet {
	public static void main(String[] args) {
		HashSet<Student> stu = new HashSet<Student>();
		
		Student s = new Student(6, "��å");
		stu.add(s);
		stu.add(s); // �ߺ���
		System.out.println("students : " + stu);
		
		stu.add(new Student(5, "����"));
		stu.add(new Student(3, "����"));
		stu.add(new Student(3, "����")); // �� ��ü�� �ּҰ� �޶� ��µ�
		
		System.out.println("students : " + stu);
	}
}