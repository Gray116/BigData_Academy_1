package com.lec.ex01_string;

public class Ex07_speedChk { // ���ڿ� ����� �ӵ� ��
	public static void main(String[] args) {
		@SuppressWarnings("unused")
		String str = "A";
		// ���۽ð� ����
		long start = System.currentTimeMillis(); 
		
		// str 10���� �ٲٱ�
		for(int i = 0; i < 100000; i++) {
			str += "a"; // = str.concat("a")
		}
		
		//  ����ð� ����
		long end = System.currentTimeMillis();
		System.out.println("String 10���� ���� �ð��� " + (end - start));
		
		StringBuffer strBuff = new StringBuffer("A");
		start = System.currentTimeMillis();
		for(int i = 0; i < 100000; i++) {
			strBuff.append("a");
		}
		end = System.currentTimeMillis();
		System.out.println("StringBuff 10���� ���� �ð��� " + (end-start));
		
		StringBuilder strBuild = new StringBuilder("A");
		start = System.currentTimeMillis();
		for(int i = 0; i < 100000; i++) {
			strBuild.append("a");
		}
		end = System.currentTimeMillis();
		System.out.println("StringBuilder 10���� ���� �ð��� " + (end-start));
		
	}
}