package com.lec.ex;

public class Ex07 // ��Ʈ������ &(AND), |(OR), ^(XOR - ���� �ٸ� ���� �� ��)
{
	public static void main(String[] args)
	{
		int n1 = 10; // 00001010
		int n2 = 6; // 00000110
		int result; // -------
		
		result = n1 & n2;
		System.out.println("n1 & n2 = " + result);
		
		result = n1 | n2;
		System.out.printf("n1 | n2 = %x(%d)\n",  result, result);
		
		result = n1 ^ n2;
		System.out.printf("n1 ^ n2 = %x(%d)\n", result, result);
	}
}