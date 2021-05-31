package com.lec.ex1_awt;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Dimension;
import java.awt.Frame;

public class Ex01 extends Frame {
	private Button btn1;
	private Button btn2;
	
	public Ex01() {
		btn1 = new Button("버튼");
		btn2 = new Button("버튼2");
		
		/* Frame의 레이아웃 타입 */
		// 1. BorderLayout(동,서,남,북, 중앙) 하나 꼭 지정
		// 2. FlowLayout (왼쪽부터 오른쪽으로, 위부터 아래로)
		// 3. GridLayout (몇 행 몇 열인지)
		add(btn1, BorderLayout.CENTER);
		add(btn2, BorderLayout.SOUTH);
		
		setVisible(true);
		setSize(new Dimension(300, 200)); 	// 300,200 크기로 창 생성
											// pack(); 최소한의 사이즈로
		setLocation(200, 100); 				// (200, 100) 정도 떨어져서 생성됨
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {}
		
		// 3초 후 자동 종료
		setVisible(false);
		dispose(); // 컴포넌트의 해제
		System.exit(0);
	}
	
	public Ex01(String title) {
		this(); // 내 객체의 생성자 함수 호출
		setTitle(title);
	}
}














