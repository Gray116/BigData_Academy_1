package com.lec.ex10_lib;

public class Book implements ILendable {
	private String bookNo; // 책의 분류번호
	private String bookTitle; // 책의 제목
	private String writer; // 책의 저자	
	private String borrower; // 대출인
	private String checkOutDate; // 책의 대출 날짜
	private byte state; // 대출 상태(1 = 대출중, 0 = 대출 가능)
	
	public Book(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}

	@Override
	public void checkOut(String borrower, String checkOutDate) {
		if(state != STATE_NORMAL) {
			System.out.println("대출 중인 도서입니다.");
			return;
		}
		/* 대출 처리 로직 */
		this.borrower = borrower;
		this.checkOutDate = checkOutDate;
		state = STATE_BORROWED;
		
		System.out.println("\"" + bookTitle + "\" 도서가 대출되었습니다.");
	}
	
	/* book.checkIn() */
	@Override
	public void checkIn() {
		if(state != STATE_BORROWED) {
			System.out.println("대출중인 도서가 아닙니다.");
			return;
		}
		/* 반납 처리 로직 */
		borrower = null;
		checkOutDate = null;
		state = STATE_NORMAL;
		
		System.out.println("\"" + bookTitle + "\" 도서가 반납되었습니다.");
	}
	
	@Override
	public String toString() {
		String result = String.format("%s, %s저 ", bookTitle, writer);
		result += (state == STATE_NORMAL? "대출 가능" : "대출 중");
		return result;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public byte getState() {
		return 0;
	}
}