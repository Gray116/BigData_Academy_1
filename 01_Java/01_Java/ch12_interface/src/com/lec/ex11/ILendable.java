package com.lec.ex11;

public interface ILendable { // 작업설계도
	public byte STATE_BORROWED = 1; // 대출 중일 때
	public byte STATE_UNBORROWED = 0;
	public void checkOut(String borrower, String checkOutData); // 도서 대출
	public void checkIn(); // 반납
	public String toString();
}