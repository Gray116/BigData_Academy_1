package com.lec.ex5_lib;

import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;

public class BookLib implements ILendable {
	private String 	bookNo;
	private String 	bookTitle;
	private String 	writer;
	private String 	borrower;
	private Date 		checkOutDate; // å�� ���� ��¥
	private byte 		state; // ���� �� = 1, ���� ���� = 0
	
	public BookLib() {}
	public BookLib(String bookNo, String bookTitle, String writer) {
		this.bookNo = bookNo;
		this.bookTitle = bookTitle;
		this.writer = writer;
	}
	
	@Override
	public void checkOut(String borrower) throws Exception {
		if(state != STATE_UNBORROWED) {
			throw new Exception(bookTitle + "�� ���� �� �Դϴ�.");
		}
		/* ���� ó�� ���� */
		checkOutDate = new Date(new GregorianCalendar(2021, 3, 30).getTimeInMillis());
		this.borrower = borrower;
		state = STATE_BORROWED;
		
		System.out.println("\"" + bookTitle + "\" ������ ����Ǿ����ϴ�.");
		System.out.println("���� ��¥ : " + checkOutDate);
		System.out.println();
	}

	@Override
	public void checkIn() throws Exception {
		if(state != STATE_BORROWED) {
			throw new Exception(bookTitle + "�� ���� ���°� �ƴմϴ�.");
		}
		
		Date now = new Date();
		long diff = now.getTime() - checkOutDate.getTime();
		long day = diff / (24*60*60*1000);
		
		if(day > 14) {
			System.out.println("\n���� 100���� ��ü�ᰡ �߻���");
			System.out.println("�����ϼž� �� ��ü��� " + ((day - 14) * 100) + "��");
			Scanner sc = new Scanner(System.in);
			System.out.print("��ü�� ���� ���� (Y/N) : ");
			if(!sc.next().equalsIgnoreCase("y")) {
				System.out.println("��ü�Ḧ ���ž� �ݳ�ó���� �˴ϴ�.\n");
				return;
			}
		}
		/* �ݳ� ó�� ���� */
		this.borrower = null;
		checkOutDate = null;
		state = STATE_UNBORROWED;
		
		System.out.println("\"" + bookTitle + "\" ������ �ݳ��Ǿ����ϴ�.\n");
	}
	
	@Override
	public String toString() {
		String result = String.format("%s, %s(��) ", bookTitle, writer);
		result += (state == STATE_UNBORROWED? "���� ����" : "���� ��");
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













