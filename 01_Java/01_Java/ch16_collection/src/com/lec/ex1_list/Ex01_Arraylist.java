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
		arrayList.add("str0"); // 0�� �ε���
		arrayList.add("str1"); // 1�� �ε��� -> 2�� �ε����� ��.
		arrayList.add("str2"); // 2�� �ε���
		
		arrayList.add(1, "11111"); // 1�� �ε����� �ȴ�. ���� 1���� 2������ �и���.
		arrayList.set(1, "str1"); // 1���ε����� ���� ����
		
		for(String arr : arrayList) {
			System.out.print(arr + "\t");
		}
		System.out.println("\n - remove �� �� - ");
		arrayList.remove(1); // 1�� �ε��� ����, 2���ε����� ���� 1������ �̵�. 3���� �ε��� ���� 2������ �̵�
		arrayList.remove(arrayList.size() - 1); // �� ������ �ε��� ����
		
		for(int i1 = 0; i1<arrayList.size(); i1++) {
			System.out.printf("%d��° �ε��� ���� : %s\n", i1, arrayList.get(i1)); // get(index)�� ����Ͽ� �ε��� �ҷ� ��
		}
		System.out.println();
		System.out.println(arrayList);
		arrayList.clear(); // arrayList�� ��� ������ ����
		
		if(arrayList.size() == 0) {
			System.out.println("������ ����");
		}
		if(arrayList.isEmpty()) {
			System.out.println("�����");
		}
		System.out.println(arrayList);
		
		arrayList = null;
//		System.out.println(arrayList.size());
	} // main
} // class






















