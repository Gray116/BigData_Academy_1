package com.lec.ex3_exceptionEx;

public class Friend {
	private String name;
	private String telNo;
	
	public Friend() {}
	public Friend(String name, String telNo) {
		this.name = name;
		this.telNo = telNo;
	}
	
	@Override /* ȫ�浿 : ***_ ****_9999 */
	public String toString() {
		String post = telNo.substring(telNo.lastIndexOf("-") + 1);
		return name + "- *** - **** - " + post;
	}
}