package com.lec.ex2_thorws;

public class Main {
	public static void main(String[] args) {
		try {
			new ThrowsEx();
		} 
		catch (Exception e) {
			System.out.println(e.getMessage());
//			e.printStackTrace();, 세세한 오류 출력
		}
	}
}