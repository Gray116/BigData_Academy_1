package com.lec.ex1_awt;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Dimension;
import java.awt.Frame;
import java.awt.Label;
import java.awt.List;
import java.awt.Panel;
import java.awt.TextField;
		//0. action���� api �߰�
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Ex05_list extends Frame implements ActionListener{
	private Panel panel;
	private List list;
	private TextField txtF;
	private Button btnOk, btnExit;
	
	public Ex05_list() {
		// < ȭ�� ���� ����>
		
		// 1. layout ����		
		// setLayout(new BorderLayout()); �⺻
		// panel�� �⺻ ���̾ƿ��� FlowLayout
		panel = new Panel();
		txtF = new TextField(20);
		btnOk = new Button("OK");
		btnExit = new Button("EXIT");
		list = new List();
		
		// 2. component ����
		panel.add(new Label("write"));
		panel.add(txtF);
		panel.add(btnOk);
		panel.add(btnExit);
		
		// 3. setVisible, setSize...
		add(panel, BorderLayout.NORTH);
		add(list, BorderLayout.CENTER);
		setVisible(true);
		setSize(new Dimension(400, 200));
		setLocation(600, 300);
		
		btnOk.addActionListener(this);
		btnExit.addActionListener(this);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == btnOk) {
			list.add(txtF.getText());
			txtF.setText("");
		} else if(e.getSource() == btnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
	}
	
	public static void main(String[] args) {
		new Ex05_list();
	}
}