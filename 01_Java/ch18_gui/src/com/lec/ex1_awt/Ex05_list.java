package com.lec.ex1_awt;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Dimension;
import java.awt.Frame;
import java.awt.Label;
import java.awt.List;
import java.awt.Panel;
import java.awt.TextField;
		//0. action관련 api 추가
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Ex05_list extends Frame implements ActionListener{
	private Panel panel;
	private List list;
	private TextField txtF;
	private Button btnOk, btnExit;
	
	public Ex05_list() {
		// < 화면 구현 순서>
		
		// 1. layout 설정		
		// setLayout(new BorderLayout()); 기본
		// panel의 기본 레이아웃은 FlowLayout
		panel = new Panel();
		txtF = new TextField(20);
		btnOk = new Button("OK");
		btnExit = new Button("EXIT");
		list = new List();
		
		// 2. component 설정
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