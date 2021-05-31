package com.lec.ex01_string;

public class Ex06_stringbuffer {
	public static void main(String[] args) {
		StringBuilder str = new StringBuilder("abc");
		
		System.out.println("str�� �ؽ��ڵ� : " + str.hashCode());
		System.out.println("1. " + str);
		
		str.append("def"); // ���ڿ� �߰�
		System.out.println("2. " + str);
		
		str.insert(3, "AAA"); // n��° �ε����� ���ڸ� �߰�(0��°���� ����)
		System.out.println("3. " + str);
		
		str.delete(3, 6); // m��°���� n��° �ձ��� ���ڿ� ����
		System.out.println("4. " + str);
		System.out.println("str�� �ؽ��ڵ� : " + str.hashCode());
		
		int builderSize = str.capacity();
		System.out.println("str�� ����ũ�� : " + builderSize);
		
		str.append("12345678901234567890");
		System.out.println("5. " + str);
		System.out.println("6. " + str.capacity());
		System.out.println("str�� �ؽ��ڵ� : " + str.hashCode());
	}
}