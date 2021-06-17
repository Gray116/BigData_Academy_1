package com.lec.ex01_string;

public class Ex06_stringbuffer {
	public static void main(String[] args) {
		StringBuilder str = new StringBuilder("abc");
		
		System.out.println("str의 해시코드 : " + str.hashCode());
		System.out.println("1. " + str);
		
		str.append("def"); // 문자열 추가
		System.out.println("2. " + str);
		
		str.insert(3, "AAA"); // n번째 인덱스에 문자를 추가(0번째부터 시작)
		System.out.println("3. " + str);
		
		str.delete(3, 6); // m번째부터 n번째 앞까지 문자열 삭제
		System.out.println("4. " + str);
		System.out.println("str의 해시코드 : " + str.hashCode());
		
		int builderSize = str.capacity();
		System.out.println("str의 가용크기 : " + builderSize);
		
		str.append("12345678901234567890");
		System.out.println("5. " + str);
		System.out.println("6. " + str.capacity());
		System.out.println("str의 해시코드 : " + str.hashCode());
	}
}