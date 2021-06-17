package com.lec.ex2_map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class Ex01_HashMap {
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<String>();
		list.add("aaa");
		System.out.println(list.get(0));
		
		HashMap<Integer, String> hashmap = new HashMap<Integer, String>();
		hashmap.put(11, "str11");
		hashmap.put(22, "str22");
		hashmap.put(33, "str33");
		
		System.out.println(hashmap.get(22));
		System.out.println("remove 전 : " + hashmap);
		
		hashmap.remove(22);
		System.out.println("remove 후 : " + hashmap);
		
		hashmap.clear();
		System.out.println(hashmap.isEmpty()? "데이터 모두 삭제" : "데이터 있음");
		
		hashmap.put(0, "Hong gildong");
		hashmap.put(1, "Hong gil");
		hashmap.put(2, "gildo");
		hashmap.put(3, "dong");
		
		System.out.println("---------------------");
		Iterator<Integer> iterator = hashmap.keySet().iterator();
		
		while(iterator.hasNext()) { // iterator 할 수 있니~ 물어봤을 때 가능하면
			Integer key = iterator.next();
			System.out.println(key + "의 데이터는 " + hashmap.get(key));
		}
	}
}













