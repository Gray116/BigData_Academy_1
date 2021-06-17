package com.lec.ex2_dataInputStreamDataOutputStream;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

public class Ex04_ProductList {
	public static void main(String[] args) {
		ArrayList<Product> arr = new ArrayList<Product>();
		InputStream 	fis = null;
		DataInputStream dis = null;
		
		try {
			fis = new FileInputStream("txFile/product.dat");
			dis = new DataInputStream(fis);
			
			while(true) {
				String name = dis.readUTF(); // 상품명 읽어옴
				int price = dis.readInt(); // 가격 읽어옴
				int stock = dis.readInt(); // 개수 읽어옴
				
				arr.add(new Product(name, price, stock));
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println("재고 데이터는 다음과 같습니다.");
		} finally {
			try {
				if(dis != null) dis.close();
				if(fis != null) fis.close();
			} catch (Exception e2) {}
		} // finally
		if (arr.isEmpty()) {
			System.out.println("재고가 없습니다.");
		} else {
			System.out.println("물건명\t가격\t개수");
			for(Product ar : arr) {
				System.out.println(ar);
			}
			System.out.print("이상 " + arr.size() + "개의 재고 상품 입력됨.");
		}
	} // main
} // class