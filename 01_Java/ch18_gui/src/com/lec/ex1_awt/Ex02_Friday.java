package com.lec.ex1_awt;

import java.awt.Button;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

		/* �̺�Ʈ */
		// 1. ActionListener�� �����Ѵ�.
		// 2. Override
		// 3. ������Ʈ�� Listener �߰�
		// 4. Override �Լ��� ���� �ۼ�

public class Ex02_Friday extends Frame implements ActionListener{
	private Label lbl1; // �߰��� ������Ʈ�� ���� ����
	private Button btnExit;
	
	public Ex02_Friday(String title) {
		super(title);
//		setLayout(new BorderLayout());
//		setLayout(new GridLayout(2, 2));
		setLayout(new FlowLayout());
		
		lbl1 = new Label("��ſ� �ݿ���!");
		// ������Ʈ�� ������ ����
		lbl1.setPreferredSize(new Dimension(150, 200));
		btnExit = new Button("����");
		btnExit.setPreferredSize(new Dimension(200, 200));
		
		add(lbl1);
		add(btnExit);
		setVisible(true);
		setSize(new Dimension(500, 300));
		setLocation(200, 200);
		
		// btnExit Ŭ�� �̺�Ʈ�� �߻�
		// this.actionPerformed()�� ȣ��
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













