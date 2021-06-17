package com.lec.ex01_string;

public class Ex05 {
	public static void main(String[] args) {
		String str = "Hello~";
		String str1 = "Hello~";
		
		System.out.println("str의 해시코드 : " + str.hashCode());
		System.out.println("str1의 해시코드 : " + str1.hashCode());
		System.out.println(str == str1? "str과 str1은 같은 주소" : "str과 str1은 다른주소");
		
		str = "Hello"; // 변수의 내용이 변경되면 다시 String객체가 자동으로 생성됨
		System.out.println("str의 해시코드 : " + str.hashCode());
		System.out.println(str == str1? "str과 str1은 같은 주소" : "str과 str1은 다른주소");
	}
}