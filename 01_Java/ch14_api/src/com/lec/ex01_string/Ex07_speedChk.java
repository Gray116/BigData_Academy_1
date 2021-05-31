package com.lec.ex01_string;

public class Ex07_speedChk { // 문자열 출력의 속도 비교
	public static void main(String[] args) {
		@SuppressWarnings("unused")
		String str = "A";
		// 시작시간 측정
		long start = System.currentTimeMillis(); 
		
		// str 10만번 바꾸기
		for(int i = 0; i < 100000; i++) {
			str += "a"; // = str.concat("a")
		}
		
		//  종료시간 측정
		long end = System.currentTimeMillis();
		System.out.println("String 10만번 변경 시간은 " + (end - start));
		
		StringBuffer strBuff = new StringBuffer("A");
		start = System.currentTimeMillis();
		for(int i = 0; i < 100000; i++) {
			strBuff.append("a");
		}
		end = System.currentTimeMillis();
		System.out.println("StringBuff 10만번 변경 시간은 " + (end-start));
		
		StringBuilder strBuild = new StringBuilder("A");
		start = System.currentTimeMillis();
		for(int i = 0; i < 100000; i++) {
			strBuild.append("a");
		}
		end = System.currentTimeMillis();
		System.out.println("StringBuilder 10만번 변경 시간은 " + (end-start));
		
	}
}