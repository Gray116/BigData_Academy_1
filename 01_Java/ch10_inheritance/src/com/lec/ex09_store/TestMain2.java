package com.lec.ex09_store;

public class TestMain2 {
	public static void main(String[] args) {
		HeadQuarterStore[] st = {new HeadQuarterStore(" - ���� - "),
															   new StoreNum1("\n - ���ð� 1ȣ�� - "),
															   new StoreNum2("\n - ���а� 2ȣ�� - "),
															   new StoreNum3("\n - ���ǰ� 3ȣ�� - ")
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