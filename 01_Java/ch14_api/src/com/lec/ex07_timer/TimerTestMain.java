package com.lec.ex07_timer;

import java.util.Timer;
import java.util.TimerTask;

public class TimerTestMain {
	public static void main(String[] args) throws InterruptedException {
		System.out.println("����");
		
		Timer timer = new Timer(true); // �� ���α׷��� �������� ���� ����
		TimerTask ex1 = new TimerTaskEx1();
		TimerTask ex2 = new TimerTaskEx2();
		
		timer.schedule(ex1, 2000); // 1000�� 1��, ex1 �۾��� 2���Ŀ� �ѹ� ����
		timer.schedule(ex2, 500, 1000);
		Thread.sleep(10000); // 10�ʴ��
		
		System.out.println("��");
	} // main
} // class