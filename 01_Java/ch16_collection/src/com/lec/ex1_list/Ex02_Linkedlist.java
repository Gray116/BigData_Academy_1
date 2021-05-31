package com.lec.ex1_list;

import java.util.LinkedList;

public class Ex02_Linkedlist {
	public static void main(String[] args) {
//		ArrayList<String> arrLis = new ArrayList<String>();
		LinkedList<String> linLis = new LinkedList<String>();
		
		linLis.add("str0"); // 0번 인덱스
		linLis.add("str1"); // 1번 인덱스 -> 2번인덱스
		linLis.add("str2"); // 2번 인덱스 -> 3번인덱스
		linLis.add(1, "수정된 str1"); // 새로운 1번 인덱스
		
		for(int i = 0; i<linLis.size(); i++) {
			System.out.println(linLis.get(i));
		}
		System.out.println("--------------");
		
		for(String l : linLis) {
			System.out.println(l);
		}
		System.out.println("--------------");
		
		linLis.remove("수정된 str1");
		System.out.println(" - remove 후 - ");
		
		for(int i = 0; i<linLis.size(); i++) {
			System.out.println(linLis.get(i));
		}
		
		linLis.clear();
		System.out.println(linLis.isEmpty()? "비워짐" : "데이터 있음");
	}
}










