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
			System.out.println("������ �ִ�ġ�Դϴ�. û���� �����մϴ�.");
		}
		else {
			System.out.println("����Ŀ ������ 1��ŭ �÷� ���� ������ " + volumeLevel);
		}
	}

	@Override
	public void volumeUp(int level) { 
		/* ���� ������ ������ŭ ���� */
		volumeLevel += level;
		
		if(volumeLevel >= SPEAKER_MAX_VOLUME) {
			volumeLevel = SPEAKER_MAX_VOLUME;
			System.out.println("������ �ִ�ġ�Դϴ�. û���� �����մϴ�.");
		}
		else {
			System.out.println("����Ŀ ������ " + level + "��ŭ ���� ���� ������ " + volumeLevel);
		}
	}

	@Override
	public void volumeDown() {
		volumeLevel--;
		
		if(volumeLevel <= MIN_VOLUME) {
			volumeLevel = MIN_VOLUME;
			System.out.println("���� �����Դϴ�.");
		}
		else {
			System.out.println("����Ŀ ������ 1��ŭ ���� ���� ������ " + volumeLevel);
		}
	}

	@Override
	public void volumeDown(int level) {
		/* ���� ������ ������ŭ ���� */
		volumeLevel -= level;
		
		if(volumeLevel <= MIN_VOLUME) {
			volumeLevel = MIN_VOLUME;
			System.out.println("�����Դϴ�.");
		}
		else {
			System.out.println("����Ŀ ������ " + level + "��ŭ ���� ���� ������ " + volumeLevel);
		}
	}
}