package com.lec.ex2_swing;

import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

public class Ex02 extends JFrame implements ActionListener {
//	private JPanel jPanel; // 컨테이너를 얻어오기 위한 변수
	private Container 			contenPanel; // 컨테이너를 얻어오기 위한 변수
	private ImageIcon 			icon;
	private JButton 			jBtn;
	private JTextField 			jTxtField;
//	private String[] item = {"A", "B", "C"}; // 콤보박스에 들어갈 리스트
	private Vector<String> 		items; // 콤보박스에 들어갈 리스트
	private JComboBox<String> 	jCombo;
	private JCheckBox 			jCheck;
	private JLabel 				jlBlank;
	private JButton 			jBtnExit;
	
	public Ex02() {
		// 1. 컨테이너를 받아 컴포넌트 객체들을 생성 후 추가
		// 2. 화면 조정(크기, 위치)
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		contenPanel = getContentPane();
		contenPanel.setLayout(new FlowLayout());
//		jPanel = (JPanel)getContentPane();
		icon = new ImageIcon("icon/write.gif");
		jBtn = new JButton("Button", icon);
		jTxtField = new JTextField();
//		jCombo = new JComboBox<String>(items); // 콤보박스 리스트를 item 배열로 사용
		
		items = new Vector<String>();
		items.add("A");
		items.add("B");
		items.add("C");
		
		jCombo = new JComboBox<String>(items); // 콤보박스 리스트를items 벡터로 사용
		jCheck = new JCheckBox("CheckBox");
		jlBlank = new JLabel("");
		jBtnExit = new JButton("Exit");
		
		contenPanel.add(new JLabel("Label"));
		contenPanel.add(jBtn);
		contenPanel.add(jTxtField);
		contenPanel.add(jCombo);
		contenPanel.add(jCombo);
		contenPanel.add(jCheck);
		contenPanel.add(jlBlank);
		contenPanel.add(jBtnExit);
		
		jBtn.setPreferredSize(new Dimension(200, 50));
		jTxtField.setPreferredSize(new Dimension(300, 50));
		jCombo.setPreferredSize(new Dimension(100, 50));
		jCheck.setPreferredSize(new Dimension(100, 50));
		jlBlank.setPreferredSize(new Dimension(200, 100));
		jBtnExit.setPreferredSize(new Dimension(100, 50));
		
		pack();
		setVisible(true);
		setLocation(200, 200);
		
		/* 이벤트 추가 */
		jBtn.addActionListener(this);
		jCombo.addActionListener(this);
		jCheck.addActionListener(this);
		jBtnExit.addActionListener(this);
	}
	public Ex02(String title) {
		this();
		setTitle(title);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == jBtn) {
			String temp = jTxtField.getText().trim().toUpperCase();
			if(temp.equals("")) {
				return; // jtxtfield에 공백 문자(space or 비어있는)인 경우
			}
//			items.add(temp); // 벡터에 추가해도 자동적으로 콤보박스에 추가됨
			jCombo.addItem(temp);
			jlBlank.setText(jTxtField.getText().trim());
			jTxtField.setText("");
			
			String name = JOptionPane.showInputDialog("이름은?");
			System.out.println(name + "님 반갑습니다.");
		} else if(e.getSource() == jCombo) {
			jlBlank.setText(jCombo.getSelectedItem().toString());
//			jCombo.setSelectedIndex(0);
			jCombo.setSelectedItem("A");
		} else if(e.getSource() == jCheck) {
			if(jCheck.isSelected()) { // 체크 됌
				jlBlank.setText(jCheck.getText());
			} else { // 체크를 푸는 경우
				jlBlank.setText("");
			}
		} else if(e.getSource() == jBtnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
	}
	
	public static void main(String[] args) {
		new Ex02();
	}
}