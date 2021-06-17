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
//	private JPanel jPanel; // �����̳ʸ� ������ ���� ����
	private Container 			contenPanel; // �����̳ʸ� ������ ���� ����
	private ImageIcon 			icon;
	private JButton 			jBtn;
	private JTextField 			jTxtField;
//	private String[] item = {"A", "B", "C"}; // �޺��ڽ��� �� ����Ʈ
	private Vector<String> 		items; // �޺��ڽ��� �� ����Ʈ
	private JComboBox<String> 	jCombo;
	private JCheckBox 			jCheck;
	private JLabel 				jlBlank;
	private JButton 			jBtnExit;
	
	public Ex02() {
		// 1. �����̳ʸ� �޾� ������Ʈ ��ü���� ���� �� �߰�
		// 2. ȭ�� ����(ũ��, ��ġ)
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		contenPanel = getContentPane();
		contenPanel.setLayout(new FlowLayout());
//		jPanel = (JPanel)getContentPane();
		icon = new ImageIcon("icon/write.gif");
		jBtn = new JButton("Button", icon);
		jTxtField = new JTextField();
//		jCombo = new JComboBox<String>(items); // �޺��ڽ� ����Ʈ�� item �迭�� ���
		
		items = new Vector<String>();
		items.add("A");
		items.add("B");
		items.add("C");
		
		jCombo = new JComboBox<String>(items); // �޺��ڽ� ����Ʈ��items ���ͷ� ���
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
		
		/* �̺�Ʈ �߰� */
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
				return; // jtxtfield�� ���� ����(space or ����ִ�)�� ���
			}
//			items.add(temp); // ���Ϳ� �߰��ص� �ڵ������� �޺��ڽ��� �߰���
			jCombo.addItem(temp);
			jlBlank.setText(jTxtField.getText().trim());
			jTxtField.setText("");
			
			String name = JOptionPane.showInputDialog("�̸���?");
			System.out.println(name + "�� �ݰ����ϴ�.");
		} else if(e.getSource() == jCombo) {
			jlBlank.setText(jCombo.getSelectedItem().toString());
//			jCombo.setSelectedIndex(0);
			jCombo.setSelectedItem("A");
		} else if(e.getSource() == jCheck) {
			if(jCheck.isSelected()) { // üũ ��
				jlBlank.setText(jCheck.getText());
			} else { // üũ�� Ǫ�� ���
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