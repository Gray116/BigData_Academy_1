package com.lec.ex2_dataInputStreamDataOutputStream;

import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Scanner;

public class Ex03_ProductWrite {
	public static void main(String[] args) {
		OutputStream 	 fos = null;
		DataOutputStream dos = null;
		Scanner sc = new Scanner(System.in);
		String fn;
		
		try {
			fos = new FileOutputStream("txFile/product.dat", true);
			dos = new DataOutputStream(fos);
	
			do {
				System.out.print("재고를 입력하시겠습니까?(Y/N) : ");
				fn = sc.next();
				
				if(fn.equalsIgnoreCase("N")) {
					System.out.print("종료합니다.");
					break;
				} else if(fn.equalsIgnoreCase("Y")) {
					System.out.print("상품명을 입력하세요 : ");
					dos.writeUTF(sc.next());
					
					System.out.print("가격을 입력하세요 : ");
					dos.writeInt(sc.nextInt());
					
					System.out.print("개수를 입력하세요 : ");
					dos.writeInt(sc.nextInt());
				} else {
					System.out.print("잘못 입력하셨습니다.");
				}	
			} while(true);
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(dos != null) dos.close();
				if(fos != null) fos.close();
			} catch (Exception e2) {}
		} // finally
	sc.close();
	} // main
} // class