package com.lec.ex10_lib;

public class TestMain {
	public static void main(String[] args) {
		Book book1 = new Book("900ㄱ-104나", "Java", "홍길동");
		Book book2 = new Book("890ㄷ-84라", "Hadoop", "하길동");
		
		book1.checkIn();
		book1.checkOut("김길동", "05-20");
		book1.checkOut("이길동", "05-20");
		
		System.out.println();
		System.out.println(book1);
		System.out.println(book2);
	}
}