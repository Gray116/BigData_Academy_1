package com.lec.ex01_string;

import java.util.StringTokenizer;

public class Ex08_tokenizing {
	public static void main(String[] args) {
		String str = "황충-마초-장비-관우-조운";
		String str1 = "2021/05/24";
		StringTokenizer token1 = new StringTokenizer(str, "-"); // str을 -(대시) 구분자로 분할
		StringTokenizer token2 = new StringTokenizer(str1, "/"); // str1을 /(슬래시) 구분자로 분할
		
		System.out.println("token1의 갯수 : " + token1.countTokens());
		System.out.println("token2의 갯수 : " + token2.countTokens());
		
		while(token1.hasMoreTokens()) {
			System.out.println(token1.nextToken());
		}
		
		while(token2.hasMoreTokens()) {
			System.out.println(token2.nextToken());
		}
	}
}