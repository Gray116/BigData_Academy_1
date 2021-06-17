package com.lec.ex08_volume;

public class Speaker implements IVolume {
	private int volumeLevel = 0;
	
	public Speaker() {}
	public Speaker(int volumeLevel) {
		this.volumeLevel = volumeLevel;
	}
	
	@Override
	public void volumeUp() {
		volumeLevel++;
		
		if(volumeLevel >= SPEAKER_MAX_VOLUME) {
			volumeLevel = SPEAKER_MAX_VOLUME;
			System.out.println("볼륨이 최대치입니다. 청력이 위험합니다.");
		}
		else {
			System.out.println("스피커 볼륨을 1만큼 올려 현재 볼륨은 " + volumeLevel);
		}
	}

	@Override
	public void volumeUp(int level) { 
		/* 볼륨 레벨을 레벨만큼 증가 */
		volumeLevel += level;
		
		if(volumeLevel >= SPEAKER_MAX_VOLUME) {
			volumeLevel = SPEAKER_MAX_VOLUME;
			System.out.println("볼륨이 최대치입니다. 청력이 위험합니다.");
		}
		else {
			System.out.println("스피커 볼륨을 " + level + "만큼 높여 현재 볼륨은 " + volumeLevel);
		}
	}

	@Override
	public void volumeDown() {
		volumeLevel--;
		
		if(volumeLevel <= MIN_VOLUME) {
			volumeLevel = MIN_VOLUME;
			System.out.println("현재 무음입니다.");
		}
		else {
			System.out.println("스피커 볼륨을 1만큼 낮춰 현재 볼륨은 " + volumeLevel);
		}
	}

	@Override
	public void volumeDown(int level) {
		/* 볼륨 레벨을 레벨만큼 증가 */
		volumeLevel -= level;
		
		if(volumeLevel <= MIN_VOLUME) {
			volumeLevel = MIN_VOLUME;
			System.out.println("무음입니다.");
		}
		else {
			System.out.println("스피커 볼륨을 " + level + "만큼 낮춰 현재 볼륨은 " + volumeLevel);
		}
	}
}