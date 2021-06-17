package com.lec.ex5_lib;

import java.util.InputMismatchException;
import java.util.Scanner;

public class TestMain {
	public static void main(String[] args) {
		BookLib[] books = {new BookLib("A01", "JAVA", "홍자바"),
											  new BookLib("B01", "HADOOP", "홍하둡"),
											  new BookLib("C01", "C", "홍씨")
											  };
		Scanner sc = new Scanner(System.in);
		int idx, fn;
		String bookName, borrower;
		
		do {
			System.out.print("1 : 책 대출 | 2 : 책 반납 | 3 : 대출 현황 | 0 : 종료 : ");
			try {
				fn = sc.nextInt();
			}
			catch (InputMismatchException e) {
				System.out.print("잘못입력하셨습니다.");
				System.out.print("이용해주셔서 감사합니다.");
				break;
			}
			
			switch(fn) {
			
			case 0:
				System.out.print("이용해주셔서 감사합니다.");
				break;
			
			case 1:
				System.out.print("\n대출하고자 하는 책을 입력해주세요 : ");
				sc.nextLine();
				bookName = sc.nextLine();
				
				for(idx = 0; idx<books.length; idx++) {
					if(books[idx].getBookTitle().equals(bookName)) {
						break;
					}
				}
				
				try {
					if(idx == books.length) {
						System.out.println("해당 도서는 없습니다.");
					}
					else if(books[idx].getState() == BookLib.STATE_BORROWED) {
						System.out.print(bookName + "은(는) 대출 중입니다.\n");
					}
					else {
						System.out.print("성함을 입력해주세요 : ");
						borrower = sc.nextLine();
						try {
							books[idx].checkOut(borrower);
						} catch (Exception e) {
							System.out.println(e.getMessage());
							System.out.print("오류가 발생하여 종료합니다.");
							break;
						}
					}
				}
				catch (Exception e) {
					System.out.println(e.getMessage());
					System.out.print("오류가 발생하여 종료합니다.");
					break;
				}
				break;
			
			case 2:
				System.out.print("\n반납하실 책의 제목을 입력해주세요 : ");
				sc.nextLine();
				bookName = sc.nextLine();
				
				for(idx = 0; idx<books.length; idx++) {
					if(bookName.equals(books[idx].getBookTitle())) {
						break;
					}
				}
				
				if(idx == books.length) {
					System.out.print("해당 도서는 본 도서관의 책이 아닙니다.\n");
				}
				else {
					try {
						books[idx].checkIn();
					} 
					catch (Exception e) {
						System.out.println(e.getMessage());
						System.out.print("오류가 발생하여 종료합니다.\n");
					}
				}
				
				break;
				
			case 3:
				System.out.println("\n - 도서 현황 -");
				
				for(BookLib book : books) {
					System.out.println(book);
				}
				System.out.println();
				break;
			} // switch
		} while(fn != 0); // do-while
		
		sc.close();
	} // main
} // class














