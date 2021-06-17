package com.lec.ex4_Quiz;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;

public class TestMain2 {
	public static void main(String[] args) {
		HashMap<String, Customer> hash = new HashMap<String, Customer>(); 
		Scanner sc = new Scanner(System.in);
		String fn, name, tel, address;
		
		do {
			System.out.print("회원정보를 입력하시겠습니까?(Y/N) : ");
			fn = sc.nextLine();
			
			if(hash.isEmpty()) {
				System.out.println("가입한 회원이 없습니다.");
			}
			
			if(fn.equalsIgnoreCase("Y")) {				
				System.out.print("이름을 입력해주세요 : ");
				 name = sc.next();
				
				System.out.print("전화번호를 입력해주세요 : ");
				tel = sc.next();
				
				System.out.print("주소를 입력해주세요 : ");
				sc.nextLine();
				address = sc.nextLine();
				
				hash.put(name, new Customer(name, tel, address));
			} else if(!fn.equalsIgnoreCase("Y") && !fn.equalsIgnoreCase("N")){
				System.out.print("잘못된 입력입니다.");
			}
			
		} while(!fn.equalsIgnoreCase("N"));
	
		Iterator<String> iterator = hash.keySet().iterator();
		
		while(iterator.hasNext()) {
			String key = iterator.next();
			System.out.println(hash.get(key));
		}
		System.out.println("이용해주셔서 감사합니다.");
		sc.close();
	}
}