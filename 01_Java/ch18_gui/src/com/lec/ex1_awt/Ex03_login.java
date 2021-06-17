package com.lec.ex1_awt;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Dimension;
import java.awt.Frame;
import java.awt.GridLayout;
import java.awt.Label;
import java.awt.Panel;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/* Ex04�� �Բ�  ������ */

public class Ex03_login extends Frame implements ActionListener{
	private Label lbl1;
	private TextField txtId;
	private Label lbl2;
	private TextField txtPw;
	private Button btnLogin;
	private Panel panel;
	
	public Ex03_login(String title) {
		super(title);
		
		// �������� ���̾ƿ� ����
		// Line20 - 20ĭ ���� �� �� �ִ� ĭ ����
		// Line28 - �ԷµǴ� ���� *�� ǥ��
//		setLayout(new BorderLayout());
		panel = new Panel(new GridLayout(2, 2));
		lbl1 = new Label("���̵�    ");
		txtId = new TextField("ID", 20);
		
		lbl2 = new Label("��й�ȣ");
		txtPw = new TextField(20);
		txtPw.setEchoChar('*');
		
		btnLogin = new Button("�α���");
		
		panel.add(lbl1);
		panel.add(txtId);
		panel.add(lbl2);
		panel.add(txtPw);
		
		add(panel, BorderLayout.CENTER);
		add(btnLogin, BorderLayout.SOUTH);
		setSize(new Dimension(300, 150));
		
		setSize(new Dimension(300, 150));
		setLocation(100, 100);
		setVisible(true);
//		setResizable(false); ����ڰ� ������ ���� �Ұ�
		
		btnLogin.addActionListener(this); // �� �ؾ���
	}
	
	public static void main(String[] args) {
		new Ex03_login("�� �� ��");
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == btnLogin) {
			String id = txtId.getText().trim().toUpperCase();
			String pw = txtPw.getText().trim();
			
			System.out.printf("�Է��Ͻ� ID�� " + id, "��й�ȣ�� " + pw);
		}
	}
}















