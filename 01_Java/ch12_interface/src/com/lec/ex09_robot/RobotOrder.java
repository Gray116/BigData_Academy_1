package com.lec.ex09_robot;

public class RobotOrder {
	public void action(Robot robot) {
		if(robot instanceof DanceRobot) { // ���� �κ� ������ ����Ű�� ���� ��ü Ÿ���� ���κ��̶��~
			DanceRobot tempRobot = (DanceRobot) robot;
			tempRobot.dance();
		}
		else if(robot instanceof DrawRobot) {
			/* ��ü�� ����ȯ�� �� ���� instanceof�� ����Ѵ� */
			((DrawRobot) robot).draw();
		}
		else if(robot instanceof SingRobot) {
			((SingRobot) robot).sing();
		}
	}
}