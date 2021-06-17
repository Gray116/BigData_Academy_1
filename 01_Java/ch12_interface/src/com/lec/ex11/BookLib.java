package com.lec.ex11;

public class BookLib extends BookInfo implements ILendable {
	private byte state;
	private String borrower;
	private String checkOutDate;

	public BookLib(String bookNo, String bookTitle, String writer) {
		super(bookNo, bookTitle, writer);
	}

	@Override
	public void checkOut(String borrower, String checkOutData) {
		if(state != STATE_UNBORROWED) {
			System.out.println("현재 대출 중인 도서입니다.");
			return;
		}
		/* 대출 처리 로직 */
		this.borrower = borrower;
		this.checkOutDate = checkOutData;
		state = STATE_BORROWED;
		
		System.out.println("\"" + getBookTitle() + "\" 도서가 대출되었습니다.\n");
	}

	@Override
	public void checkIn() {
		if(state != STATE_BORROWED) {
			System.out.println("현재 대출 중인 도서가 아닙니다.");
			return;
		}
		/* 반납 처리 로직 */
		borrower = null;
		checkOutDate = null;
		state = STATE_UNBORROWED;
		
		System.out.println("\"" + getBookTitle() + "\" 도서가 반납되었습니다.\n");
	}
	
	@Override
	public String toString() {
		String result = String.format("%s, %s(저) ", getBookTitle(), getWriter());
		result += (state == STATE_UNBORROWED? "대출 가능" : "대출 중");
		return result;
	}
	
	public byte getState() {
		return state;
	}
}