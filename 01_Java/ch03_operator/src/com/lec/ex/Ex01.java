package com.lec.ex;

public class Ex01 
{
	public static void main(String[] args)
	{
		int n1 = 33, n2 = 10;
		int result;
		double resultDouble;
		
		result = n1 * n2;
		System.out.printf("%d %c %d = %d\n", n1, '*', n2, result);
		
		resultDouble = (double)n1 / n2;
		System.out.printf("%d %c %d = %.2f\n", n1, '/', n2, resultDouble);
		
		result = n1 % n2;
		System.out.printf("%d %c %d = %d\n", n1, '%', n2, result);
		
		if (n1 % n2 == 0)
		{
			System.out.println("n1은 짝수");
		}
		else
		{
			System.out.println("n1은 홀수");
		}
		
		if (n2 % 5 == 0)
		{
			System.out.println("n2는 5의 배수");
		}
		else
		{
			System.out.println("n2는 5의 배수가 아니다.");
		}
	}
}
