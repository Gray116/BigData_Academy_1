package com.lec.ex10_lib;

public class TestMain {
	public static void main(String[] args) {
		Book book1 = new Book("900��-104��", "Java", "ȫ�浿");
		Book book2 = new Book("890��-84��", "Hadoop", "�ϱ浿");
		
		book1.checkIn();
		book1.checkOut("��浿", "05-20");
		book1.checkOut("�̱浿", "05-20");
		
		System.out.println();
		System.out.println(book1);
		System.out.println(book2);
	}
}