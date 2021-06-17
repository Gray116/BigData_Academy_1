package com.lec.ex09_robot;

public class RobotOrder {
	public void action(Robot robot) {
		if(robot instanceof DanceRobot) { // 만약 로봇 변수가 가르키는 곳의 객체 타입이 댄스로봇이라면~
			DanceRobot tempRobot = (DanceRobot) robot;
			tempRobot.dance();
		}
		else if(robot instanceof DrawRobot) {
			/* 객체의 형변환을 할 때는 instanceof를 사용한다 */
			((DrawRobot) robot).draw();
		}
		else if(robot instanceof SingRobot) {
			((SingRobot) robot).sing();
		}
	}
}