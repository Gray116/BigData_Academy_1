package com.lec.ex;

public class Ex06 // 할당(대입)연산자 : =, +=, *=, /=, -=, %=
{
	public static void main(String[] args)
	{
		int n1 = 10;
		int n2, n3;
		
		n1 += 10; // n1 = n1 + 10
		System.out.println("n1 = " + n1);
		
		n1 = n2 = n3 = 10; // 오른쪽부터 실행된다 n3에 10먼저 넣고~
		System.out.println(n1 + "\t" + n2 + "\t" + n3);
	}
}