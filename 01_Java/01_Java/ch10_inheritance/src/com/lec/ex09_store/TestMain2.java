package com.lec.ex09_store;

public class TestMain2 {
	public static void main(String[] args) {
		HeadQuarterStore[] st = {new HeadQuarterStore(" - 본사 - "),
															   new StoreNum1("\n - 주택가 1호점 - "),
															   new StoreNum2("\n - 대학가 2호점 - "),
															   new StoreNum3("\n - 증권가 3호점 - ")
															   };
		for(HeadQuarterStore s : st) {
			System.out.println(s.getName());
			
			s.kimchi();
			s.budae();
			s.bibim();
			s.sundae();
			s.kongki();
		}
	}
}