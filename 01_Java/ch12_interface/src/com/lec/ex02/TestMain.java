package com.lec.ex02;

public class TestMain {
	public static void main(String[] args) {
		A_model a = new A_model();
		B_model b = new B_model();
		C_model c = new C_model();
		// IAcor b = new B_model 도 가능;
		// IAcor 타입이기도 하다.
		IAcor[] phones = {a, b, c};
		
		for(IAcor phone : phones) {
			phone.dmbReceive();
			phone.lte();
			phone.tvremotecontrol();
		} // for
		
		
	} // main
} // class