package com.lec.ex3_Quiz;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.util.ArrayList;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class MyFrame extends JFrame implements ActionListener {
	private Container 			containPane;
	private JPanel 				jP1, jp2;
	private JTextField 			jtName, jtTel, jtAge;
	private JButton 			btnIn, btnOut;
	private ImageIcon 			icon1, icon2;
	private ArrayList<Friend> 	lists;
	Writer 						writer = null;
	
	public MyFrame() {
		this("");
	}
	public MyFrame(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		containPane = getContentPane();
		jP1 = new JPanel(new GridLayout(3, 2));
		jp2 = new JPanel(new FlowLayout());
		jtName = new JTextField();
		jtTel = new JTextField();
		jtAge = new JTextField();
		lists = new ArrayList<Friend>();
		
		icon1 = new ImageIcon("icon/join.png");
		icon2 = new ImageIcon("icon/output.png");
		btnIn = new JButton("입 력", icon1);
		btnIn.setPreferredSize(new Dimension(120, 50));
		btnOut = new JButton("출 력", icon2);
		btnOut.setPreferredSize(new Dimension(120, 50));
		
		lists = new ArrayList<Friend>();
		
		jP1.add(new Label("이     름", (int)RIGHT_ALIGNMENT));
		jP1.add(jtName);
		jP1.add(new Label("전     화", (int)RIGHT_ALIGNMENT));
		jP1.add(jtTel);
		jP1.add(new Label("나     이", (int)RIGHT_ALIGNMENT));
		jP1.add(jtAge);
		
		jp2.add(btnIn);
		jp2.add(btnOut);
		
		containPane.add(jP1, BorderLayout.NORTH);
		containPane.add(jp2, BorderLayout.CENTER);
		
		pack();
		setVisible(true);
		setBounds(10,10,300,170);
		setLocation(600, 300);
		
		btnIn.addActionListener(this);
		btnOut.addActionListener(this);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == btnIn) {
			String name = jtName.getText().trim();
			String tel = jtTel.getText().trim();
					
			if(name.equals("")||tel.equals("")) {
				System.out.println("이름과 전화번호는 필수 입력사항입니다.");
				return;
			} else if(tel.length() > 12) {
				System.out.println("전화번호의 입력이 잘못되었습니다.");
				return;
			}
					
			int age = 0;
			try {
				age = Integer.parseInt(jtAge.getText());
				if(age < 0 || age > 150) {
					System.out.println("유효하지 않는 나이.");
					age = 0;
					}
				} catch (NumberFormatException e2) {
					System.out.println("유효하지 않는 나이는 0살로 처리");
				} finally {
					try {
						if(writer != null) writer.close();
					} catch (Exception e2) {}
				}
				Friend list = new Friend(name, tel, age);
				lists.add(list);
					
				jtName.setText("");
				jtTel.setText("");
				jtAge.setText("");
			} else if(e.getSource() == btnOut) {
				try {
					writer = new FileWriter("txtFile/person.txt");
					
					if(lists.isEmpty()) {
						System.out.println("입력된 회원 정보가 없습니다.");
						} else {
							System.out.println("출력 성공!");
							for(Friend arr : lists) {
								writer.write(arr.toString() + "\n");
							}
						}
				} catch (IOException e1) {
					System.out.println(e1.getMessage());
				} finally {
					try {
						if(writer != null) writer.close();
					} catch (Exception e2) {}
				}
			} // elsf-if
	} // actionperformed
	
	public static void main(String[] args) {
		new MyFrame("Gui 예제");
	}
}