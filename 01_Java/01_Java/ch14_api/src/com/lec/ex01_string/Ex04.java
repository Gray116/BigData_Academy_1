package com.lec.ex01_string;

import java.util.Scanner;

public class Ex04 {
	public static void main(String[] args) {
		String[] tels = {"02-9999-9999",
										"010-8888-8888",
										"010-7777-8888"
										};
		Scanner sc = new Scanner(System.in);
		boolean searchOk = false; // 전화번호 뒷자리로 검색된 경우는 true
		
		/* 사용자가 x를 입력할 때까지 (전화번호 뒷자리로 검색하여 전화번호 전체 출력) */
		do {	
			System.out.print("검색하시려는 회원의 전화번호 뒷번호를 입력해주세요(단, 종료시 x) : ");
			String searchTel = sc.next();
			if(searchTel.equalsIgnoreCase("x")) { // 대소문자 상관없이
				break;
			}
			
			for(int idx = 0; idx<tels.length; idx++) {
				String postTel = tels[idx].substring(tels[idx].lastIndexOf("-") + 1);
				
				if(searchTel.equals(postTel)) {
					System.out.println(tels[idx]);
					searchOk = true; // 한번이라도 검색이 된 경우
				}
			} // for
			if(!searchOk) {
				System.out.println("입력하신 뒷 번호는 없는 번호입니다.");
			}
		}while(true); // do-while
		
		sc.close();
	} // main
} // class