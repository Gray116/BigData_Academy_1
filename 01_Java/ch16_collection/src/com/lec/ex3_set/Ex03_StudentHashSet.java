package com.lec.ex3_set;

import java.util.HashSet;

public class Ex03_StudentHashSet {
	public static void main(String[] args) {
		HashSet<Student> stu = new HashSet<Student>();
		
		Student s = new Student(6, "손책");
		stu.add(s);
		stu.add(s); // 중복됨
		System.out.println("students : " + stu);
		
		stu.add(new Student(5, "마등"));
		stu.add(new Student(3, "조인"));
		stu.add(new Student(3, "조인")); // 새 객체의 주소가 달라서 출력됨
		
		System.out.println("students : " + stu);
	}
}