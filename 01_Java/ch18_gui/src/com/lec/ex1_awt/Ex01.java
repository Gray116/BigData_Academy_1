package com.lec.ex1_awt;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Dimension;
import java.awt.Frame;

public class Ex01 extends Frame {
	private Button btn1;
	private Button btn2;
	
	public Ex01() {
		btn1 = new Button("��ư");
		btn2 = new Button("��ư2");
		
		/* Frame�� ���̾ƿ� Ÿ�� */
		// 1. BorderLayout(��,��,��,��, �߾�) �ϳ� �� ����
		// 2. FlowLayout (���ʺ��� ����������, ������ �Ʒ���)
		// 3. GridLayout (�� �� �� ������)
		add(btn1, BorderLayout.CENTER);
		add(btn2, BorderLayout.SOUTH);
		
		setVisible(true);
		setSize(new Dimension(300, 200)); 	// 300,200 ũ��� â ����
											// pack(); �ּ����� �������
		setLocation(200, 100); 				// (200, 100) ���� �������� ������
		
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {}
		
		// 3�� �� �ڵ� ����
		setVisible(false);
		dispose(); // ������Ʈ�� ����
		System.exit(0);
	}
	
	public Ex01(String title) {
		this(); // �� ��ü�� ������ �Լ� ȣ��
		setTitle(title);
	}
}














