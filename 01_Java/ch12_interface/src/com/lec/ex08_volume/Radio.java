package com.lec.ex08_volume;

public class Radio implements IVolume {
	private int volumeLevel = 0;
	
	public Radio() {}
	public Radio(int volumeLevel) {
		this.volumeLevel = volumeLevel;
	}
	
	@Override
	public void volumeUp() {
		volumeLevel++;
		
		if(volumeLevel >= RADIO_MAX_VOLUME) {
			volumeLevel = RADIO_MAX_VOLUME;
			System.out.println("������ �ִ�ġ�Դϴ�. û���� �����մϴ�.");
		}
		else {
			System.out.println("���� ������ 1��ŭ �÷� ���� ������ " + volumeLevel);
		}
	}

	@Override
	public void volumeUp(int level) { 
		/* ���� ������ ������ŭ ���� */
		volumeLevel += level;
		
		if(volumeLevel >= RADIO_MAX_VOLUME) {
			volumeLevel = RADIO_MAX_VOLUME;
			System.out.println("������ �ִ�ġ�Դϴ�. û���� �����մϴ�.");
		}
		else {
			System.out.println("���� ������ " + level + "��ŭ ���� ���� ������ " + volumeLevel);
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
			System.out.println("���� ������ 1��ŭ ���� ���� ������ " + volumeLevel);
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
			System.out.println("���� ������ " + level + "��ŭ ���� ���� ������ " + volumeLevel);
		}
	}
}