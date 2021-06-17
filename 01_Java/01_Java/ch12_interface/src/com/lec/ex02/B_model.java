package com.lec.ex02;

public class B_model implements IAcor {
	private String model = "B 모델";
	
	@Override
	public void dmbReceive() {
		System.out.println(model + "은 DMB 송수신 가능.");
	}

	@Override
	public void lte() {
		System.out.println(model + "은 LTE입니다.");
	}

	@Override
	public void tvremotecontrol() {
		System.out.println(model + "은 TV 리모콘이 탑재 되어있습니다.");
		System.out.println();
	}
}