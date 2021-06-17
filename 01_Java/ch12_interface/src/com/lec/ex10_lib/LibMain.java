package com.lec.ex10_lib;

import java.util.Scanner;

public class LibMain {
	public static void main(String[] args) {
		Book[] books = {new Book("900ㄱ-104나", "Java", "홍길동"),
										  new Book("901ㄱ-105나", "Oracle", "황길동"),
										  new Book("902ㄱ-106나", "Hadoop", "김길동"),
										  new Book("903ㄱ-107나", "C", "이길동"),
										  new Book("904ㄱ-108나", "C++", "호길동")
										  };
		Scanner sc = new Scanner(System.in);
		int fn, idx = 0;  // 기능번호 - 1:대출, 2:반납, 3:도서현황, 0:종료
		String bTitle, borrower, checkOutDate; // 대출을 원하는 책 이름, 대출인, 대출일
		
		do {
			System.out.print("원하는 기능을 눌러주세요(1 : 대출, 2 : 반납, 3 : 도서현황, 0: 종료 - ");
			fn = sc.nextInt();
			
			switch (fn) {
			case 1:
				// 책 이름 입력 - 조회 - 상태확인 - 대출인, 날짜 입력 - 대출
				System.out.println("원하는 책 이름을 입력해주세요 : ");
				bTitle = sc.next();
				
				for(idx = 0; idx<books.length; idx++) {
					if(books[idx].getBookTitle().equals(bTitle)) {
						break;
					}
				}
				if(idx == books.length) {
					System.out.println("해당 도서가 없습니다.");
				}
				else if(books[idx].getState() == Book.STATE_BORROWED) { // 도서의 대출 상태 체크
					System.out.println(bTitle + "대출 중");
				}
				else {
					/* 대출인과 날짜 */
					System.out.println("대출인은? ");
					borrower = sc.next();
					
					System.out.println("대출 날짜는? ");
					checkOutDate = sc.next();
					
					/* 대출 로직 */
					books[idx].checkOut(borrower, checkOutDate);
				}
				break;
			
			case 2: // 책 이름 조회 - 조회 - 반납
				System.out.println("반납하실 책 제목을 입력해주세요 : ");
				bTitle = sc.next();
				for(idx = 0; idx<books.length; idx++) {
					if(bTitle.equals(books[idx].getBookTitle())) {
						break;
					}
				}
				if(idx == books.length) {
					System.out.println("해당 도서는 본 도서관의 책이 아닙니다.");
				}
				else {
					books[idx].checkIn();
				}
				
				break;
			
			case 3:
				System.out.println("도서 현황입니다.");
				for(Book book : books) {
					System.out.println(book);
				}
				break;
			
			default:
				System.out.println("올바른 번호를 입력해주세요.");
			}
		} while(fn != 0); // do-while
		System.out.println("감사합니다.");
		sc.close();
	} // main
} // class