package com.lec.ex2_swing;

import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class Ex01_Friday extends JFrame implements ActionListener {
	private JLabel jlbl;
	private JPanel jpanel;
	private JButton jbtn;
	
	public Ex01_Friday(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE); // x버튼 누르면 종료됨
		
		jpanel = (JPanel) getContentPane();
		jpanel.setLayout(new FlowLayout());
		
		jlbl = new JLabel("즐거운 금요일");
		jlbl.setPreferredSize(new Dimension(150, 200));
		
		jbtn = new JButton("종료");
		jbtn.setPreferredSize(new Dimension(200, 200));
		
		jpanel.add(jlbl);
		jpanel.add(jbtn);

		setVisible(true);
		pack();
		jbtn.addActionListener(this);
		
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == jbtn) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
		
	}
}













