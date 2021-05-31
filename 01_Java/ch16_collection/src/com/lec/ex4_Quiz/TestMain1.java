package com.lec.ex4_Quiz;

import java.util.ArrayList;
import java.util.Scanner;

public class TestMain1 {
	public static void main(String[] args) {
		ArrayList<Customer> arr = new ArrayList<Customer>();
		Scanner sc = new Scanner(System.in);
		int idx;
		String fn;
		
		do {
			System.out.print("회원정보를 입력하시겠습니까?(Y/N) : ");
			fn = sc.nextLine();
			
			if(arr.isEmpty()) {
				System.out.println("가입한 회원이 없습니다.");
				continue;
			}
			
			if(fn.equalsIgnoreCase("Y")) {
				Customer cs = new Customer();
				
				System.out.print("이름을 입력해주세요 : ");
				cs.setName(sc.next());
				
				System.out.print("전화번호를 입력해주세요 : ");
				cs.setTel(sc.next());
				
				System.out.print("주소를 입력해주세요 : ");
				sc.nextLine();
				cs.setAddress(sc.nextLine());
				
				arr.add(cs);
			} else if(!fn.equalsIgnoreCase("Y") && !fn.equalsIgnoreCase("N")){
				System.out.print("잘못된 입력입니다.");
				break;
			}
			
		} while(!fn.equalsIgnoreCase("N"));
		
		for(idx = 0; idx<arr.size(); idx++) {
			System.out.println(arr.get(idx));
		}
		System.out.println("이용해주셔서 감사합니다.");
		
		sc.close();
	}
}