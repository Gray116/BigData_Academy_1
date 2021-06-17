package com.lec.ex08_volume;

public class TestMain {
	public static void main(String[] args) {
		Radio radio 				= new Radio();
		TV tv 							= new TV(5);
		Speaker speaker = new Speaker(20);
		
		radio.volumeDown();
		tv.volumeUp(20);
		speaker.volumeDown();
		System.out.println();
		
		IVolume[] devices = {radio, tv, speaker};
		for(IVolume d : devices) {
			d.volumeUp(20);
		}
		System.out.println();
		
		for(int idx = 0; idx<devices.length; idx++) {
			devices[idx].volumeDown(5);
		}
	}
}