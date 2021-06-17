package com.lec.ex10_lib;

import java.util.Scanner;

public class LibMain {
	public static void main(String[] args) {
		Book[] books = {new Book("900��-104��", "Java", "ȫ�浿"),
										  new Book("901��-105��", "Oracle", "Ȳ�浿"),
										  new Book("902��-106��", "Hadoop", "��浿"),
										  new Book("903��-107��", "C", "�̱浿"),
										  new Book("904��-108��", "C++", "ȣ�浿")
										  };
		Scanner sc = new Scanner(System.in);
		int fn, idx = 0;  // ��ɹ�ȣ - 1:����, 2:�ݳ�, 3:������Ȳ, 0:����
		String bTitle, borrower, checkOutDate; // ������ ���ϴ� å �̸�, ������, ������
		
		do {
			System.out.print("���ϴ� ����� �����ּ���(1 : ����, 2 : �ݳ�, 3 : ������Ȳ, 0: ���� - ");
			fn = sc.nextInt();
			
			switch (fn) {
			case 1:
				// å �̸� �Է� - ��ȸ - ����Ȯ�� - ������, ��¥ �Է� - ����
				System.out.println("���ϴ� å �̸��� �Է����ּ��� : ");
				bTitle = sc.next();
				
				for(idx = 0; idx<books.length; idx++) {
					if(books[idx].getBookTitle().equals(bTitle)) {
						break;
					}
				}
				if(idx == books.length) {
					System.out.println("�ش� ������ �����ϴ�.");
				}
				else if(books[idx].getState() == Book.STATE_BORROWED) { // ������ ���� ���� üũ
					System.out.println(bTitle + "���� ��");
				}
				else {
					/* �����ΰ� ��¥ */
					System.out.println("��������? ");
					borrower = sc.next();
					
					System.out.println("���� ��¥��? ");
					checkOutDate = sc.next();
					
					/* ���� ���� */
					books[idx].checkOut(borrower, checkOutDate);
				}
				break;
			
			case 2: // å �̸� ��ȸ - ��ȸ - �ݳ�
				System.out.println("�ݳ��Ͻ� å ������ �Է����ּ��� : ");
				bTitle = sc.next();
				for(idx = 0; idx<books.length; idx++) {
					if(bTitle.equals(books[idx].getBookTitle())) {
						break;
					}
				}
				if(idx == books.length) {
					System.out.println("�ش� ������ �� �������� å�� �ƴմϴ�.");
				}
				else {
					books[idx].checkIn();
				}
				
				break;
			
			case 3:
				System.out.println("���� ��Ȳ�Դϴ�.");
				for(Book book : books) {
					System.out.println(book);
				}
				break;
			
			default:
				System.out.println("�ùٸ� ��ȣ�� �Է����ּ���.");
			}
		} while(fn != 0); // do-while
		System.out.println("�����մϴ�.");
		sc.close();
	} // main
} // class