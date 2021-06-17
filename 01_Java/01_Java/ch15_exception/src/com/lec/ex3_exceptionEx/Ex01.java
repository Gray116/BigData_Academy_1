package com.lec.ex3_exceptionEx;

public class Ex01 {
	public static void main(String[] args) {
		String strNo = "10";
		int no = 0;
		
		try {
			no = Integer.parseInt(strNo.trim()); // string 매개변수를 숫자로 바꿔줌
		} 
		catch (NumberFormatException e) {
			System.out.println("입력하지 않는 값은 0으로 초기화");
		}
		System.out.println(no + 1);
	}
}