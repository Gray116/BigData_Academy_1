package com.lec.ex;

public class Ex02 {
	public static void main(String[] args) { // main
		int tot = sum(1, 10);
		System.out.println(evenOdd(tot));

		tot = sum(10, 100);
		System.out.println(evenOdd(tot));
		
	}

	private static String evenOdd(int tot) { // method evenOdd
		String result = tot%2 == 0? "¦��" : "Ȧ��";
		return result;
	}

	private static int sum(int from, int to) { // method sum
		int result = 0;
		
		for(int i=from; i<to; i++)
		{
			result += i;
		}
		return result;
	}
} // class