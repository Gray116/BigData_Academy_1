package com.lec.ex;

public class VarEx05
{
	public static void main(String[] args)
	{
		float f = (float)10.0001; // 명시적인 형 변환
		System.out.println("f = "+f);
		
		double d = 10.0001; // 명시적인 형 변환
		System.out.println("d = "+d);
		
		if (f == d)
		{
			System.out.println("같습니다.");
		}
	}
}
