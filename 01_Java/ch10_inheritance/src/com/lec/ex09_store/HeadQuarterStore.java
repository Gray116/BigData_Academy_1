/* ���� �������� ������ ���������� �ٸ��� ����غ��� */

package com.lec.ex09_store;

public class HeadQuarterStore {
	private String name;
	
	public HeadQuarterStore(String name) {
		this.name = name;
	}
	
	public void kimchi() {
		System.out.println("��ġ� : 5,000��");
	}
	
	public void budae() {
		System.out.println("�δ�� : 6,000��");
	}
	
	public void bibim() {
		System.out.println("����� : 6,000��");
	}
	
	public void sundae() {
		System.out.println("���뱹  : 5,000��");
	}
	
	public void kongki() {
		System.out.println("����� : 1,000��");
	}
	
	public String getName() {
		return name;
	}
}