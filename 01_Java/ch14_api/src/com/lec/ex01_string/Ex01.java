package com.lec.ex01_string;

public class Ex01 {
	public static void main(String[] args) {
		String str1 = "java";
		String str2 = "java";
		String str3 = new String("Java");
		
		System.out.println(str1 == str2? "str1�� str2�� ���� �ּ�" : "str1�� str2�� �ٸ� �ּ�");
		System.out.println(str2 == str3? "str1�� str2�� ���� �ּ�" : "str1�� str2�� �ٸ� �ּ�");
		
		str1 = "java 1";
		
		System.out.println(str1 == str2? "str1�� str2�� ���� �ּ�" : "str1�� str2�� �ٸ� �ּ�");
		
//		if(str2.equals(str3)) {
//			System.out.println("���� String");
//		}
		System.out.println(str2.equals(str3)? "���� String" : "�ٸ� String");
	}
}