package com.lec.ex10_lib;

public interface ILendable {
	public byte STATE_BORROWED = 1; // 대출 중일 때
	public byte STATE_NORMAL = 0;
	public void checkOut(String borrower, String checkOutData); // 도서 대출
	public void checkIn(); // 반납
}