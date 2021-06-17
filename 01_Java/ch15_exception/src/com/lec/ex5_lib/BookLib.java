package com.lec.ex5_lib;

import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;

public class BookLib implements ILendable {
	private String 	bookNo;
	private String 	bookTitle;
	private String 	writer;
	private String 	borrower;
	private Date 		checkOutDate; // 책의 대출 날짜
	private byte 		state; // 대출 중 = 1, 대출 가능 = 0
	
	public BookLib() {}
	public BookLib(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}
	
	@Override
	public void checkOut(String borrower) throws Exception {
		if(state != STATE_UNBORROWED) {
			throw new Exception(bookTitle + "은 대출 중 입니다.");
		}
		/* 대출 처리 로직 */
		checkOutDate = new Date(new GregorianCalendar(2021, 3, 30).getTimeInMillis());
		this.borrower = borrower;
		state = STATE_BORROWED;
		
		System.out.println("\"" + bookTitle + "\" 도서가 대출되었습니다.");
		System.out.println("대출 날짜 : " + checkOutDate);
		System.out.println();
	}

	@Override
	public void checkIn() throws Exception {
		if(state != STATE_BORROWED) {
			throw new Exception(bookTitle + "은 대출 상태가 아닙니다.");
		}
		
		Date now = new Date();
		long diff = now.getTime() - checkOutDate.getTime();
		long day = diff / (24*60*60*1000);
		
		if(day > 14) {
			System.out.println("\n일일 100원의 연체료가 발생됨");
			System.out.println("지불하셔야 할 연체료는 " + ((day - 14) * 100) + "원");
			Scanner sc = new Scanner(System.in);
			System.out.print("연체료 지불 여부 (Y/N) : ");
			if(!sc.next().equalsIgnoreCase("y")) {
				System.out.println("연체료를 내셔야 반납처리가 됩니다.\n");
				return;
			}
		}
		/* 반납 처리 로직 */
		this.borrower = null;
		checkOutDate = null;
		state = STATE_UNBORROWED;
		
		System.out.println("\"" + bookTitle + "\" 도서가 반납되었습니다.\n");
	}
	
	@Override
	public String toString() {
		String result = String.format("%s, %s(저) ", bookTitle, writer);
		result += (state == STATE_UNBORROWED? "대출 가능" : "대출 중");
		return result;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public byte getState() {
		return 0;
	}
	public Date getCheckOutDate() {
		return checkOutDate;
	}
	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
}













