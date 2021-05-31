package com.lec.ex01_string;

import java.util.StringTokenizer;

public class Ex08_tokenizing {
	public static void main(String[] args) {
		String str = "Ȳ��-����-���-����-����";
		String str1 = "2021/05/24";
		StringTokenizer token1 = new StringTokenizer(str, "-"); // str�� -(���) �����ڷ� ����
		StringTokenizer token2 = new StringTokenizer(str1, "/"); // str1�� /(������) �����ڷ� ����
		
		System.out.println("token1�� ���� : " + token1.countTokens());
		System.out.println("token2�� ���� : " + token2.countTokens());
		
		while(token1.hasMoreTokens()) {
			System.out.println(token1.nextToken());
		}
		
		while(token2.hasMoreTokens()) {
			System.out.println(token2.nextToken());
		}
	}
}