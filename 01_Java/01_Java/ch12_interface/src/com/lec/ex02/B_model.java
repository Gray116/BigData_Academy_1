package com.lec.ex02;

public class B_model implements IAcor {
	private String model = "B ��";
	
	@Override
	public void dmbReceive() {
		System.out.println(model + "�� DMB �ۼ��� ����.");
	}

	@Override
	public void lte() {
		System.out.println(model + "�� LTE�Դϴ�.");
	}

	@Override
	public void tvremotecontrol() {
		System.out.println(model + "�� TV �������� ž�� �Ǿ��ֽ��ϴ�.");
		System.out.println();
	}
}