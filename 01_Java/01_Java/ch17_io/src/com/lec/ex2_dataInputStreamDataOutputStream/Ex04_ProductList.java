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
				String name = dis.readUTF(); // ��ǰ�� �о��
				int price = dis.readInt(); // ���� �о��
				int stock = dis.readInt(); // ���� �о��
				
				arr.add(new Product(name, price, stock));
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println("��� �����ʹ� ������ �����ϴ�.");
		} finally {
			try {
				if(dis != null) dis.close();
				if(fis != null) fis.close();
			} catch (Exception e2) {}
		} // finally
		if (arr.isEmpty()) {
			System.out.println("��� �����ϴ�.");
		} else {
			System.out.println("���Ǹ�\t����\t����");
			for(Product ar : arr) {
				System.out.println(ar);
			}
			System.out.print("�̻� " + arr.size() + "���� ��� ��ǰ �Էµ�.");
		}
	} // main
} // class