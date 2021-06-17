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
			System.out.print("ȸ�������� �Է��Ͻðڽ��ϱ�?(Y/N) : ");
			fn = sc.nextLine();
			
			if(hash.isEmpty()) {
				System.out.println("������ ȸ���� �����ϴ�.");
			}
			
			if(fn.equalsIgnoreCase("Y")) {				
				System.out.print("�̸��� �Է����ּ��� : ");
				 name = sc.next();
				
				System.out.print("��ȭ��ȣ�� �Է����ּ��� : ");
				tel = sc.next();
				
				System.out.print("�ּҸ� �Է����ּ��� : ");
				sc.nextLine();
				address = sc.nextLine();
				
				hash.put(name, new Customer(name, tel, address));
			} else if(!fn.equalsIgnoreCase("Y") && !fn.equalsIgnoreCase("N")){
				System.out.print("�߸��� �Է��Դϴ�.");
			}
			
		} while(!fn.equalsIgnoreCase("N"));
	
		Iterator<String> iterator = hash.keySet().iterator();
		
		while(iterator.hasNext()) {
			String key = iterator.next();
			System.out.println(hash.get(key));
		}
		System.out.println("�̿����ּż� �����մϴ�.");
		sc.close();
	}
}