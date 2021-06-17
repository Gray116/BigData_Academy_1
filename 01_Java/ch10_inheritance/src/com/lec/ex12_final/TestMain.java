package com.lec.ex12_final;

public class TestMain {
	public static void main(String[] args) {
		Animal animal = new Animal();
		
		animal.running();
		animal.running();
		animal.stop();
		
		Dog dog = new Dog();
		System.out.println();
		
		dog.running();
		dog.running();
		dog.stop();
		
		// Animal dog = new Dog(); ½ÇÇà ¾ÈµÊ.
	}
}
