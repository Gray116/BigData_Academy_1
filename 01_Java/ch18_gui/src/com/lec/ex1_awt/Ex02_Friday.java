package com.lec.ex1_awt;

import java.awt.Button;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

		/* 이벤트 */
		// 1. ActionListener를 구현한다.
		// 2. Override
		// 3. 컴포넌트에 Listener 추가
		// 4. Override 함수에 로직 작성

public class Ex02_Friday extends Frame implements ActionListener{
	private Label lbl1; // 추가할 컴포넌트를 변수 선언
	private Button btnExit;
	
	public Ex02_Friday(String title) {
		super(title);
//		setLayout(new BorderLayout());
//		setLayout(new GridLayout(2, 2));
		setLayout(new FlowLayout());
		
		lbl1 = new Label("즐거운 금요일!");
		// 컴포넌트의 사이즈 조정
		lbl1.setPreferredSize(new Dimension(150, 200));
		btnExit = new Button("종료");
		btnExit.setPreferredSize(new Dimension(200, 200));
		
		add(lbl1);
		add(btnExit);
		setVisible(true);
		setSize(new Dimension(500, 300));
		setLocation(200, 200);
		
		// btnExit 클릭 이벤트를 발생
		// this.actionPerformed()가 호출
		btnExit.addActionListener(this);
	}
	
	public Ex02_Friday() {
		this("");
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == btnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
	}
}













