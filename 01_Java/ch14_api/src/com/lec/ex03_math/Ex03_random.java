package com.lec.ex03_math;

import java.util.Random;

public class Ex03_random {
	public static void main(String[] args) {
		System.out.println((int)(Math.random() * 45) + 1);
		Random random = new Random();
		System.out.println("int ���� : " + random.nextInt()); // ���� ���� �߻�
		System.out.println("1����~45������ ���� : " + (random.nextInt(45) + 1));
		System.out.println("double ���� : " + random.nextDouble()); // Math.random()�� ����
		System.out.println("boolean ���� : " + random.nextBoolean());
	}
}