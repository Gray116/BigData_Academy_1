package com.lec.ex3_exceptionEx; // NullPointerException

public class FriendMain {
	public static void main(String[] args) {
		Friend fri1 = new Friend();
		Friend fri2 = new Friend("�̱浿", "010-1234-5678");
		
		System.out.println(fri1);
		System.out.println(fri2);
	}
}