package com.lec.ex04_actor;

public class TestMain {
	public static void main(String[] args) {
		Actor park = new Actor("박보검");
		
		park.canCatchCriminal();
		park.outFire();
		park.canCatchCriminal();
		park.canSearch();
		System.out.println();
		
		IFirefighter park1 = new Actor("박보검");
		park1.outFire();
		park1.saveMan();
	}
}