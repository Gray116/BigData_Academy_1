package com.lec.ex05_scanner;

import java.util.Scanner;

public class Ex02 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("주소를 입력하세요 : ");
//		sc.nextLine(); // buffer를 지우기 위해
		String address = sc.nextLine();
		System.out.println("입력하신 주소는 " + address);
		
		System.out.println("이름을 입력하세요 : ");
		String name = sc.next();
		System.out.println("입력받은 이름은 " + name);
		
		sc.close();
	}
}