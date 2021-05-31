package com.lec.ex11;

import java.util.Scanner;

public class TestMain {
	public static void main(String[] args) {
		int fn, idx;
		String bookName, borrower, checkOutDate;
		String cdName, bookNo;
		
		BookLib[] books = { new BookLib("a01", "java", "�ſ��"),
												new BookLib("a02", "jsp", "�ƹ���"),
												new BookLib("a03", "Oracle", "ȫ�浿"),
												new BookLib("a04", "mySQL", "�̸���"),
												new BookLib("a05", "Servlet", "����")
												};
		CdLib[] cds = { new CdLib("c01", "java_cd", "a01"),
										new CdLib("c02", "ITtrend", null),
										new CdLib("c03", "jsp", "a02")
										};
		Scanner sc = new Scanner(System.in);
				
		do {
			System.out.print("\n1 : å ���� | 2 : CD���� | 3 : å �ݳ� | 4 : CD �ݳ� | 5 : ���� ��Ȳ | 0 : ���� : ");
			fn = sc.nextInt();
			
			switch(fn) {
			
			case 0: // ����
				System.out.println("�̿����ּż� �����մϴ�.");
				break;
				
			case 1: //å����
				System.out.print("\n�����ϰ��� �ϴ� å�� �Է����ּ��� : ");
				bookName = sc.next();
				
				for(idx = 0; idx<books.length; idx++) {
					if(books[idx].getBookTitle().equals(bookName)) {
						break;
					}
				}
				
				if(idx == books.length) {
					System.out.println("�ش� ������ �����ϴ�.");
				}
				else if(books[idx].getState() == BookLib.STATE_BORROWED) {
					System.out.println(bookName + "��(��) ���� ���Դϴ�.\n");
				}
				else {
					System.out.print("������ �Է����ּ��� : ");
					borrower = sc.next();
					
					System.out.print("���� ��¥�� �Է����ּ��� : ");
					checkOutDate = sc.next();
					
					books[idx].checkOut(borrower, checkOutDate);
					bookNo = books[idx].getBookNo();
					
					for(idx = 0; idx < cds.length; idx++) {
						if(bookNo.equals(cds[idx].getBookNo())) {
							break;
						}
					}// cds for��
					if(idx != cds.length) {
							System.out.print("\"" + bookName + "\" ������ �����Ǿ��ִ� CD�� �Բ� �����Ͻðڽ��ϱ�?(�� : 1 / �ƴϿ� : 2) ");
							int answer  = sc.nextInt();
							
							if(answer == 1) {
								cds[idx].checkOut(borrower, checkOutDate);
							}
							else if(answer == 2) {
								System.out.println("�̿����ּż� �����մϴ�.\n");
							}
							else {
								System.out.println("�ùٸ� ��ȣ�� �Է����ּ���. �ʱ�ȭ������ ���ư��ϴ�.\n");
								}
					} // cds.length if��
				}
				break;
				
			case 2: //CD����
				System.out.print("�����ϰ��� �ϴ� CD ������ �Է����ּ��� : ");
				cdName = sc.next();
				
				for(idx = 0; idx<cds.length; idx++) {
					if(cds[idx].getCdTitle().equals(cdName)) {
						break;
					}
				}
				
				if(idx == cds.length) {
					System.out.print("�ش� CD�� �����ϴ�.\n");
				}
				else if(cds[idx].getState() ==CdLib.STATE_BORROWED) {
					System.out.println(cdName + "��(��) ���� ���Դϴ�.\n");
				}
				else {
					System.out.print("CD�� �����Ǿ� �ִ� å�� ��ȣ�� �Է����ּ��� : ");
					bookNo = sc.next();
					
					System.out.print("���� ��¥�� �Է����ּ��� : ");
					checkOutDate = sc.next();
					
					cds[idx].checkOut(bookNo, checkOutDate);
				}
				break;
			case 3: //å�ݳ�
				System.out.print("\n�ݳ��Ͻ� å�� ������ �Է����ּ��� : ");
				bookName = sc.next();
				
				for(idx = 0; idx<books.length; idx++) {
					if(bookName.equals(books[idx].getBookTitle())) {
						break;
					}
				}
				if(idx == books.length) {
					System.out.print("�ش� ������ �� �������� å�� �ƴմϴ�.\n");
				}
				else {
					books[idx].checkIn();
				}
				break;
				
			case 4: //CD�ݳ�
				System.out.print("\n�ݳ��Ͻ� CD�� �Է����ּ��� : ");
				cdName = sc.next();
				
				for(idx = 0; idx<books.length; idx++) {
					if(cdName.equals(cds[idx].getCdTitle())) {
						break;
					}
				}
				if(idx == cds.length) {
					System.out.print("�ش� ������ �� �������� CD�� �ƴմϴ�.\n");
				}
				else {
					cds[idx].checkIn();
				}
				break;
			
			case 5: // ���� ��Ȳ
				System.out.println("\n���� ��Ȳ�Դϴ�.");
				for(BookLib book : books) {
					System.out.println(book);
				}
				
				System.out.println("\nCD ��Ȳ�Դϴ�.");
				for(CdLib cd : cds) {
					System.out.println(cd);
				}
				System.out.println();
				break;
			
			default:
				System.out.println("�ùٸ� ��ȣ�� �Է����ּ��� : ");
			} // switch
		}while(fn != 0); // do-while
		
		sc.close();
	} // main
} // class