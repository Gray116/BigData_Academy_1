package com.lec.ex1_list;

import java.util.LinkedList;

public class Ex02_Linkedlist {
	public static void main(String[] args) {
//		ArrayList<String> arrLis = new ArrayList<String>();
		LinkedList<String> linLis = new LinkedList<String>();
		
		linLis.add("str0"); // 0�� �ε���
		linLis.add("str1"); // 1�� �ε��� -> 2���ε���
		linLis.add("str2"); // 2�� �ε��� -> 3���ε���
		linLis.add(1, "������ str1"); // ���ο� 1�� �ε���
		
		for(int i = 0; i<linLis.size(); i++) {
			System.out.println(linLis.get(i));
		}
		System.out.println("--------------");
		
		for(String l : linLis) {
			System.out.println(l);
		}
		System.out.println("--------------");
		
		linLis.remove("������ str1");
		System.out.println(" - remove �� - ");
		
		for(int i = 0; i<linLis.size(); i++) {
			System.out.println(linLis.get(i));
		}
		
		linLis.clear();
		System.out.println(linLis.isEmpty()? "�����" : "������ ����");
	}
}










