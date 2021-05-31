package com.lec.ex1_list;

import java.util.ArrayList;

public class Ex01_Arraylist {
	public static void main(String[] args) {
		String[] array = new String[3];
		array[0] = "str0";
		array[1] = "str1";
		array[2] = "str2";
		
		for(int i = 0; i<array.length; i++) {
			System.out.printf("array[%d] = %s\t", i, array[i]);
			System.out.println();
		}
		
		for(String arr : array) {
			System.out.println(arr);
		}
		System.out.println("============================");
		ArrayList<String> arrayList = new ArrayList<String>();
		arrayList.add("str0"); // 0번 인덱스
		arrayList.add("str1"); // 1번 인덱스 -> 2번 인덱스가 됨.
		arrayList.add("str2"); // 2번 인덱스
		
		arrayList.add(1, "11111"); // 1번 인덱스가 된다. 기존 1번은 2번으로 밀린다.
		arrayList.set(1, "str1"); // 1번인덱스의 값을 수정
		
		for(String arr : arrayList) {
			System.out.print(arr + "\t");
		}
		System.out.println("\n - remove 한 후 - ");
		arrayList.remove(1); // 1번 인덱스 삭제, 2번인덱스의 값이 1번으로 이동. 3번의 인덱스 값이 2번으로 이동
		arrayList.remove(arrayList.size() - 1); // 맨 마지막 인덱스 삭제
		
		for(int i1 = 0; i1<arrayList.size(); i1++) {
			System.out.printf("%d번째 인덱스 값는 : %s\n", i1, arrayList.get(i1)); // get(index)를 사용하여 인덱스 불러 옴
		}
		System.out.println();
		System.out.println(arrayList);
		arrayList.clear(); // arrayList의 모든 데이터 삭제
		
		if(arrayList.size() == 0) {
			System.out.println("데이터 없음");
		}
		if(arrayList.isEmpty()) {
			System.out.println("비워짐");
		}
		System.out.println(arrayList);
		
		arrayList = null;
//		System.out.println(arrayList.size());
	} // main
} // class






















