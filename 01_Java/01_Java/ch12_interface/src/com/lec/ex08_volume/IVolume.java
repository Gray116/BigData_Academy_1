package com.lec.ex08_volume;

public interface IVolume {
	public int SPEAKER_MAX_VOLUME = 100;
	public int TV_MAX_VOLUME = 20;
	public int RADIO_MAX_VOLUME = 30;
	public int MIN_VOLUME = 0;
	
	public void volumeUp();
	public void volumeUp(int level);
	public void volumeDown();
	public void volumeDown(int level);
	
//	public default void mute() {
//		System.out.println("무음처리");
//	} 1.8버전부터 default method(일반 메소드와 같은) 기능이 나옴.
}