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
			System.out.print("ȸ�������� �Է��Ͻðڽ��ϱ�?(Y/N) : ");
			fn = sc.nextLine();
			
			if(arr.isEmpty()) {
				System.out.println("������ ȸ���� �����ϴ�.");
				continue;
			}
			
			if(fn.equalsIgnoreCase("Y")) {
				Customer cs = new Customer();
				
				System.out.print("�̸��� �Է����ּ��� : ");
				cs.setName(sc.next());
				
				System.out.print("��ȭ��ȣ�� �Է����ּ��� : ");
				cs.setTel(sc.next());
				
				System.out.print("�ּҸ� �Է����ּ��� : ");
				sc.nextLine();
				cs.setAddress(sc.nextLine());
				
				arr.add(cs);
			} else if(!fn.equalsIgnoreCase("Y") && !fn.equalsIgnoreCase("N")){
				System.out.print("�߸��� �Է��Դϴ�.");
				break;
			}
			
		} while(!fn.equalsIgnoreCase("N"));
		
		for(idx = 0; idx<arr.size(); idx++) {
			System.out.println(arr.get(idx));
		}
		System.out.println("�̿����ּż� �����մϴ�.");
		
		sc.close();
	}
}