package com.lec.ex01_string;

import java.util.StringTokenizer;

public class Ex09_string_array {
	public static void main(String[] args) {
		String str = "황충 마초 장비 관우 조운";		
		StringTokenizer token = new StringTokenizer(str);
		String[] arr = new String[token.countTokens()];
		int idx = 0;
		
		while(token.hasMoreTokens()) {
			arr[idx++] = token.nextToken();
		}
		
		System.out.println("- 배열 확인 - ");
		for(String a : arr) {
			System.out.println(a);
		}
	}
}