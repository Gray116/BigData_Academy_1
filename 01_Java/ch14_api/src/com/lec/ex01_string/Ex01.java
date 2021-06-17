package com.lec.ex01_string;

public class Ex01 {
	public static void main(String[] args) {
		String str1 = "java";
		String str2 = "java";
		String str3 = new String("Java");
		
		System.out.println(str1 == str2? "str1과 str2는 같은 주소" : "str1과 str2는 다른 주소");
		System.out.println(str2 == str3? "str1과 str2는 같은 주소" : "str1과 str2는 다른 주소");
		
		str1 = "java 1";
		
		System.out.println(str1 == str2? "str1과 str2는 같은 주소" : "str1과 str2는 다른 주소");
		
//		if(str2.equals(str3)) {
//			System.out.println("같은 String");
//		}
		System.out.println(str2.equals(str3)? "같은 String" : "다른 String");
	}
}