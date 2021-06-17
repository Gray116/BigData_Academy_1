package com.lec.ex07_timer;

import java.util.Timer;
import java.util.TimerTask;

public class TimerTestMain {
	public static void main(String[] args) throws InterruptedException {
		System.out.println("시작");
		
		Timer timer = new Timer(true); // 이 프로그램이 실행중일 때만 가동
		TimerTask ex1 = new TimerTaskEx1();
		TimerTask ex2 = new TimerTaskEx2();
		
		timer.schedule(ex1, 2000); // 1000에 1초, ex1 작업을 2초후에 한번 실행
		timer.schedule(ex2, 500, 1000);
		Thread.sleep(10000); // 10초대기
		
		System.out.println("끝");
	} // main
} // class