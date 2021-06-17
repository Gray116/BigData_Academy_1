package com.lec.ex5_lib;

public interface  ILendable {
	public byte STATE_BORROWED = 1; // 대출 중
	public byte STATE_UNBORROWED = 0; // 대출 중이 아닐 때
	public void checkOut(String borrower) throws Exception; // 도서 대출
	public void checkIn() throws Exception; // 반납
}