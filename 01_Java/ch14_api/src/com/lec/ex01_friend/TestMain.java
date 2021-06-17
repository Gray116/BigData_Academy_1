package com.lec.ex01_friend;

import java.util.Scanner;

public class TestMain {
	public static void main(String[] args) {
		Friend[] friends = {new Friend("ȫ�浿", "010-9999-9999", "05-24"),
												new Friend("��浿", "010-8889-8889", "08-24"),
												new Friend("�ڱ浿", "010-7778-7778", "07-24")
												};
		Scanner sc = new Scanner(System.in);
		boolean searchOk = false;
		
		do {
			System.out.print("�˻��� ��ȭ��ȣ ���ڸ�(��, ����� x �Է�) : ");
			String searchTel = sc.next();
			
			if(searchTel.equalsIgnoreCase("x")) {
				System.out.println("����.");
				break;
			}
			
			for(int idx = 0; idx<friends.length; idx++) {
				String postTel = friends[idx].getPhoneNum().substring(friends[idx].getPhoneNum().lastIndexOf("-") + 1);
				
				if(searchTel.equals(postTel)) {
					System.out.println(friends[idx].toString());
					searchOk = true;
				}
			} // for
			
			if(!searchOk) {
				System.out.println("\n�ش� ��ȭ��ȣ�� ģ���� �����ϴ�.");
			}
		} while(true); // do-while
		
		sc.close();
		} // main
	} // class