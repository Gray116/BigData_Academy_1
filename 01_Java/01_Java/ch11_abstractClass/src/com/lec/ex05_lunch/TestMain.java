package com.lec.ex05_lunch;

import com.lec.cons.PriceTable;

public class TestMain {
	public static void main(String[] args) {
		LunchMenu child1 = new Child1(PriceTable.RICE, PriceTable.BULGOGI,
																	   PriceTable.SOUP, PriceTable.BANANA,
																	   PriceTable.MILK, PriceTable.AMOND);
		
		LunchMenu child2 = new Child2(PriceTable.RICE, PriceTable.BULGOGI,
				   PriceTable.SOUP, PriceTable.BANANA,
				   PriceTable.MILK, PriceTable.AMOND);
		
		System.out.println(child1.getTypeString() + child1.calculate());
		System.out.println(child2.getTypeString() + child2.calculate());
	}
}
