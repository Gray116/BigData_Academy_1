package com.lec.ex5_lib;

import java.util.InputMismatchException;
import java.util.Scanner;

public class TestMain {
	public static void main(String[] args) {
		BookLib[] books = {new BookLib("A01", "JAVA", "ȫ�ڹ�"),
											  new BookLib("B01", "HADOOP", "ȫ�ϵ�"),
											  new BookLib("C01", "C", "ȫ��")
											  };
		Scanner sc = new Scanner(System.in);
		int idx, fn;
		String bookName, borrower;
		
		do {
			System.out.print("1 : å ���� | 2 : å �ݳ� | 3 : ���� ��Ȳ | 0 : ���� : ");
			try {
				fn = sc.nextInt();
			}
			catch (InputMismatchException e) {
				System.out.print("�߸��Է��ϼ̽��ϴ�.");
				System.out.print("�̿����ּż� �����մϴ�.");
				break;
			}
			
			switch(fn) {
			
			case 0:
				System.out.print("�̿����ּż� �����մϴ�.");
				break;
			
			case 1:
				System.out.print("\n�����ϰ��� �ϴ� å�� �Է����ּ��� : ");
				sc.nextLine();
				bookName = sc.nextLine();
				
				for(idx = 0; idx<books.length; idx++) {
					if(books[idx].getBookTitle().equals(bookName)) {
						break;
					}
				}
				
				try {
					if(idx == books.length) {
						System.out.println("�ش� ������ �����ϴ�.");
					}
					else if(books[idx].getState() == BookLib.STATE_BORROWED) {
						System.out.print(bookName + "��(��) ���� ���Դϴ�.\n");
					}
					else {
						System.out.print("������ �Է����ּ��� : ");
						borrower = sc.nextLine();
						try {
							books[idx].checkOut(borrower);
						} catch (Exception e) {
							System.out.println(e.getMessage());
							System.out.print("������ �߻��Ͽ� �����մϴ�.");
							break;
						}
					}
				}
				catch (Exception e) {
					System.out.println(e.getMessage());
					System.out.print("������ �߻��Ͽ� �����մϴ�.");
					break;
				}
				break;
			
			case 2:
				System.out.print("\n�ݳ��Ͻ� å�� ������ �Է����ּ��� : ");
				sc.nextLine();
				bookName = sc.nextLine();
				
				for(idx = 0; idx<books.length; idx++) {
					if(bookName.equals(books[idx].getBookTitle())) {
						break;
					}
				}
				
				if(idx == books.length) {
					System.out.print("�ش� ������ �� �������� å�� �ƴմϴ�.\n");
				}
				else {
					try {
						books[idx].checkIn();
					} 
					catch (Exception e) {
						System.out.println(e.getMessage());
						System.out.print("������ �߻��Ͽ� �����մϴ�.\n");
					}
				}
				
				break;
				
			case 3:
				System.out.println("\n - ���� ��Ȳ -");
				
				for(BookLib book : books) {
					System.out.println(book);
				}
				System.out.println();
				break;
			} // switch
		} while(fn != 0); // do-while
		
		sc.close();
	} // main
} // class














