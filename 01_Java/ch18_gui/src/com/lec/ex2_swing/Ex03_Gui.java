package com.lec.ex2_swing;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class Ex03_Gui extends JFrame implements ActionListener {
	/* 화면 구성 */
	private Container containPane;
	private JPanel jP;
	private JTextField jtName, jtTel, jtAge;
	private ImageIcon icon;
	private JButton btnOut;
	private JTextArea jtArea;
	private JScrollPane jsPane;
	/* 입력된 데이터가 저장되는 Array */
	private ArrayList<Friend> friends;
	
	public Ex03_Gui(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		/* 컨테이너를 생성해서 컴포넌트 객체들을 생성 및 추가 */
		containPane = getContentPane();
		jP = new JPanel(new GridLayout(3, 2)); // 3행 2열의 레이아웃 생성
		jtName = new JTextField();
		jtTel = new JTextField();
		jtAge = new JTextField();
		
		icon = new ImageIcon("icon/output.png");
		btnOut = new JButton("화면출력", icon);
		jtArea = new JTextArea(5, 30);
		jsPane = new JScrollPane(jtArea);
		friends = new ArrayList<Friend>();
		
		jP.add(new Label("이 름", (int)CENTER_ALIGNMENT));
		jP.add(jtName);
		jP.add(new Label("전 화", (int)CENTER_ALIGNMENT));
		jP.add(jtTel);
		jP.add(new Label("나 이", (int)CENTER_ALIGNMENT));
		jP.add(jtAge);
		
		containPane.add(jP, BorderLayout.NORTH);
		containPane.add(btnOut, BorderLayout.CENTER);
		containPane.add(jsPane, BorderLayout.SOUTH);
		
		jtArea.setText("이름\t전화\t\t나이\n");
		setVisible(true);
		setBounds(100, 100, 400, 300);
		
		/* 이벤트 추가 */
		btnOut.addActionListener(this);
	}
	public Ex03_Gui() {
		this("");
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == btnOut) { 
			// jtName, jtTel, jtAge값을 friends의 객체로 추가
			String name = jtName.getText().trim();
			String tel = jtTel.getText().trim();
			if(name.equals("") || tel.equals("")) {
				System.out.println("이름과 전화번호는 필수 입력사항입니다.");
				return;
			}
			int age = 0;
			try {
				age = Integer.parseInt(jtAge.getText());
				if(age<0 || age>=150) {
					System.out.println("유효하지 않는 나이는 0살로 처리");
					age = 0;
				}
			} catch (NumberFormatException e2) {
				System.out.println("유효하지 않는 나이는 0살로 처리" + e2.getMessage());
			}
			Friend friend = new Friend(name, tel, age);
			jtArea.append(friend.toString() + "\n");
			friends.add(friend);
			
			jtName.setText("");
			jtTel.setText("");
			jtAge.setText("");
			System.out.println(friends.size() + "명 입력됨");
		}
	}
	
	public static void main(String[] args) {
		new Ex03_Gui("Gui 예제");
	}
}