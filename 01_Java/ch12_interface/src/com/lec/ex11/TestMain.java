package com.lec.ex11;

import java.util.Scanner;

public class TestMain {
	public static void main(String[] args) {
		int fn, idx;
		String bookName, borrower, checkOutDate;
		String cdName, bookNo;
		
		BookLib[] books = { new BookLib("a01", "java", "신용권"),
												new BookLib("a02", "jsp", "아무개"),
												new BookLib("a03", "Oracle", "홍길동"),
												new BookLib("a04", "mySQL", "이마이"),
												new BookLib("a05", "Servlet", "서블리")
												};
		CdLib[] cds = { new CdLib("c01", "java_cd", "a01"),
										new CdLib("c02", "ITtrend", null),
										new CdLib("c03", "jsp", "a02")
										};
		Scanner sc = new Scanner(System.in);
				
		do {
			System.out.print("\n1 : 책 대출 | 2 : CD대출 | 3 : 책 반납 | 4 : CD 반납 | 5 : 대출 현황 | 0 : 종료 : ");
			fn = sc.nextInt();
			
			switch(fn) {
			
			case 0: // 종료
				System.out.println("이용해주셔서 감사합니다.");
				break;
				
			case 1: //책대출
				System.out.print("\n대출하고자 하는 책을 입력해주세요 : ");
				bookName = sc.next();
				
				for(idx = 0; idx<books.length; idx++) {
					if(books[idx].getBookTitle().equals(bookName)) {
						break;
					}
				}
				
				if(idx == books.length) {
					System.out.println("해당 도서는 없습니다.");
				}
				else if(books[idx].getState() == BookLib.STATE_BORROWED) {
					System.out.println(bookName + "은(는) 대출 중입니다.\n");
				}
				else {
					System.out.print("성함을 입력해주세요 : ");
					borrower = sc.next();
					
					System.out.print("대출 날짜를 입력해주세요 : ");
					checkOutDate = sc.next();
					
					books[idx].checkOut(borrower, checkOutDate);
					bookNo = books[idx].getBookNo();
					
					for(idx = 0; idx < cds.length; idx++) {
						if(bookNo.equals(cds[idx].getBookNo())) {
							break;
						}
					}// cds for문
					if(idx != cds.length) {
							System.out.print("\"" + bookName + "\" 도서에 동봉되어있는 CD도 함께 대출하시겠습니까?(예 : 1 / 아니오 : 2) ");
							int answer  = sc.nextInt();
							
							if(answer == 1) {
								cds[idx].checkOut(borrower, checkOutDate);
							}
							else if(answer == 2) {
								System.out.println("이용해주셔서 감사합니다.\n");
							}
							else {
								System.out.println("올바른 번호를 입력해주세요. 초기화면으로 돌아갑니다.\n");
								}
					} // cds.length if문
				}
				break;
				
			case 2: //CD대출
				System.out.print("대출하고자 하는 CD 제목을 입력해주세요 : ");
				cdName = sc.next();
				
				for(idx = 0; idx<cds.length; idx++) {
					if(cds[idx].getCdTitle().equals(cdName)) {
						break;
					}
				}
				
				if(idx == cds.length) {
					System.out.print("해당 CD는 없습니다.\n");
				}
				else if(cds[idx].getState() ==CdLib.STATE_BORROWED) {
					System.out.println(cdName + "은(는) 대출 중입니다.\n");
				}
				else {
					System.out.print("CD가 동봉되어 있는 책의 번호를 입력해주세요 : ");
					bookNo = sc.next();
					
					System.out.print("대출 날짜를 입력해주세요 : ");
					checkOutDate = sc.next();
					
					cds[idx].checkOut(bookNo, checkOutDate);
				}
				break;
			case 3: //책반납
				System.out.print("\n반납하실 책의 제목을 입력해주세요 : ");
				bookName = sc.next();
				
				for(idx = 0; idx<books.length; idx++) {
					if(bookName.equals(books[idx].getBookTitle())) {
						break;
					}
				}
				if(idx == books.length) {
					System.out.print("해당 도서는 본 도서관의 책이 아닙니다.\n");
				}
				else {
					books[idx].checkIn();
				}
				break;
				
			case 4: //CD반납
				System.out.print("\n반납하실 CD를 입력해주세요 : ");
				cdName = sc.next();
				
				for(idx = 0; idx<books.length; idx++) {
					if(cdName.equals(cds[idx].getCdTitle())) {
						break;
					}
				}
				if(idx == cds.length) {
					System.out.print("해당 도서는 본 도서관의 CD가 아닙니다.\n");
				}
				else {
					cds[idx].checkIn();
				}
				break;
			
			case 5: // 대출 현황
				System.out.println("\n도서 현황입니다.");
				for(BookLib book : books) {
					System.out.println(book);
				}
				
				System.out.println("\nCD 현황입니다.");
				for(CdLib cd : cds) {
					System.out.println(cd);
				}
				System.out.println();
				break;
			
			default:
				System.out.println("올바른 번호를 입력해주세요 : ");
			} // switch
		}while(fn != 0); // do-while
		
		sc.close();
	} // main
} // class