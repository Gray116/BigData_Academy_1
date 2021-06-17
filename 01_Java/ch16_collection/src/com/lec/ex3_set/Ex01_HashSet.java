package com.lec.ex3_set;

import java.util.HashSet;
import java.util.Iterator;

public class Ex01_HashSet {
	public static void main(String[] args) {
		HashSet<String> hashset = new HashSet<String>();
		hashset.add("str0");
		hashset.add("str1");
		hashset.add("str2"); // 만약 같은 메모리에 쓰이면서 같은 데이터라면 중복안됨
		
		System.out.println(hashset); // 순서 없음
		System.out.println("hashset의 데이터 갯수 : " + hashset.size());
		
		Iterator<String> iterator = hashset.iterator();
		while(iterator.hasNext()) {
			System.out.print(iterator.next());
		}
	}
}