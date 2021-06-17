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

/* Ex04와 함께  진행함 */

public class Ex03_login extends Frame implements ActionListener{
	private Label lbl1;
	private TextField txtId;
	private Label lbl2;
	private TextField txtPw;
	private Button btnLogin;
	private Panel panel;
	
	public Ex03_login(String title) {
		super(title);
		
		// 프레임의 레이아웃 설정
		// Line20 - 20칸 정도 쓸 수 있는 칸 생김
		// Line28 - 입력되는 값을 *로 표기
//		setLayout(new BorderLayout());
		panel = new Panel(new GridLayout(2, 2));
		lbl1 = new Label("아이디    ");
		txtId = new TextField("ID", 20);
		
		lbl2 = new Label("비밀번호");
		txtPw = new TextField(20);
		txtPw.setEchoChar('*');
		
		btnLogin = new Button("로그인");
		
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
//		setResizable(false); 사용자가 사이즈 조정 불가
		
		btnLogin.addActionListener(this); // 꼭 해야함
	}
	
	public static void main(String[] args) {
		new Ex03_login("로 그 인");
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == btnLogin) {
			String id = txtId.getText().trim().toUpperCase();
			String pw = txtPw.getText().trim();
			
			System.out.printf("입력하신 ID는 " + id, "비밀번호는 " + pw);
		}
	}
}















