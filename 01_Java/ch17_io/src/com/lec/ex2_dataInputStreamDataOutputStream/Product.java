package com.lec.ex2_dataInputStreamDataOutputStream;

public class Product {
	private String product;
	private int price;
	private int stock;
	
	public Product( ) {}	
	public Product(String product, int price, int stock) {
		this.product = product;
		this.price = price;
		this.stock = stock;
	}

	@Override
	public String toString() {
		return product + "\t" + price + "\t" + stock;
	}
}