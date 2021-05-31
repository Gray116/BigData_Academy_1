package com.lec.ex01_string;

import java.util.Scanner;

public class Ex03 {
	public static void main(String[] args) {
		String[] tels = {"02-9999-9999",
										"010-8888-8888",
										"010-7777-8888"
										};
		Scanner sc = new Scanner(System.in);
		
		System.out.print("검색하시려는 회원의 전화번호 뒷번호를 입력해주세요 : ");
		String searchTel = sc.next();
		boolean searchOk = false; // 전화번호 뒷자리로 검색된 경우는 true
		
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
		
		sc.close();
		} // main
	} // class