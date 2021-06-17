package com.lec.ex1;
import com.lec.ex.Arithmetic;

public class Ex {
	public static void main(String[] args) {
		Arithmetic ar = new Arithmetic();
		int tot = ar.sum(10, 100);
		System.out.println(ar.evenOdd(tot));
		
		// tot1 = ar.sum(10); default 접근제한자일 경우 같은 패키지에서만 사용 가능
	}
}
