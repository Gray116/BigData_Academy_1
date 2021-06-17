package com.lec.ex6_quiz;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;

public class MainTest {
	public static void main(String[] args) {
		Scanner sc 				= new Scanner(System.in);
		ArrayList<Customer> arr = new ArrayList<Customer>();
		String input;
		Writer writer 			= null;
		Reader r 				= null;
		BufferedReader br 		= null;
		SimpleDateFormat sdf 	= new SimpleDateFormat("MM-dd");
		Date dt 				= new Date();
		
		try {
			writer = new FileWriter("txFile/customer.txt", true);
			
			do {				
				System.out.print("정보를 입력하시겠습니까?(Y/N) : ");
				input = sc.nextLine();
				
				if(input.equalsIgnoreCase("N")) {
					System.out.println("프로그램을 종료합니다.");
					break;
				} else if(input.equalsIgnoreCase("Y")) {
					String name, tel, birth, address;
					
					System.out.print("이름을 입력해주세요 : ");
					name = sc.next();
						
					System.out.print("전화번호를 입력해주세요 : ");
					tel = sc.next();
						
					System.out.print("생일을 입력해주세요 : ");
					birth = sc.next();
					
					if(birth.equals(sdf.format(dt))) {
						System.out.println("★ 생일 축하 합니다! ★");
					}
					
					System.out.print("주소를 입력해주세요 : ");
					sc.nextLine();					
					address = sc.nextLine();
					
					arr.add(new Customer(name, tel, birth, address));
				} else {
					System.out.println("잘못된 입력.");
					break;
				}
			} while(true); // do-while
			System.out.println();
			if (arr.isEmpty()) {
				System.out.println("입력된 회원 정보가 없습니다.");
			} else {
				System.out.println("이름\t전화번호\t\t생일\t주소");
				for(Customer css : arr) {
					System.out.println(css);
					writer.write(css.toString() + "\n");
				}
			}
			System.out.println("\t\t\t\t이상" + arr.size() + "명 가입");
			
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(writer != null) writer.close();
			} catch (Exception e2) {}
		} // finally
		
		System.out.println();
		try {
			r = new FileReader("txFile/customer.txt");
			br = new BufferedReader(r);
			
			while(true) {
				int i = br.read();
				if(i == -1) break;
				System.out.print((char)i);
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}  finally {
			try {
				if(br != null) br.close();
				if(r != null) r.close();
			} catch (Exception e) {}
		}
	sc.close();
	} // main
} // class















