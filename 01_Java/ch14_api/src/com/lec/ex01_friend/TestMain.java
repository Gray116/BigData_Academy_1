package com.lec.ex01_friend;

import java.util.Scanner;

public class TestMain {
	public static void main(String[] args) {
		Friend[] friends = {new Friend("홍길동", "010-9999-9999", "05-24"),
												new Friend("김길동", "010-8889-8889", "08-24"),
												new Friend("박길동", "010-7778-7778", "07-24")
												};
		Scanner sc = new Scanner(System.in);
		boolean searchOk = false;
		
		do {
			System.out.print("검색할 전화번호 뒷자리(단, 종료시 x 입력) : ");
			String searchTel = sc.next();
			
			if(searchTel.equalsIgnoreCase("x")) {
				System.out.println("종료.");
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
				System.out.println("\n해당 전화번호의 친구는 없습니다.");
			}
		} while(true); // do-while
		
		sc.close();
		} // main
	} // class