/* ���� �������� ������ ���������� �ٸ��� ����غ��� */

package com.lec.ex01_store;

public abstract class HeadQuarterStore { // �߻� Ŭ���� : �߻�޼ҵ尡 1���̻� ���� ��, override�� �����ϰ� ��. 
	private String name;
	
	public HeadQuarterStore(String name) {
		this.name = name;
	}
	
	public abstract void kimchi(); // �߻� �޼ҵ�(�޼ҵ� ���Ǹ� �ϰ� �����δ� ����)
	
	public abstract void budae();
	
	public abstract void bibim();
	
	public abstract void sundae() ;
	
	public abstract void kongki();
	
	public String getName() {
		return name;
	}
}