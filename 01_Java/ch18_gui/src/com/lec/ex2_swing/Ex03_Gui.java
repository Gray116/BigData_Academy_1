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
	/* ȭ�� ���� */
	private Container containPane;
	private JPanel jP;
	private JTextField jtName, jtTel, jtAge;
	private ImageIcon icon;
	private JButton btnOut;
	private JTextArea jtArea;
	private JScrollPane jsPane;
	/* �Էµ� �����Ͱ� ����Ǵ� Array */
	private ArrayList<Friend> friends;
	
	public Ex03_Gui(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		/* �����̳ʸ� �����ؼ� ������Ʈ ��ü���� ���� �� �߰� */
		containPane = getContentPane();
		jP = new JPanel(new GridLayout(3, 2)); // 3�� 2���� ���̾ƿ� ����
		jtName = new JTextField();
		jtTel = new JTextField();
		jtAge = new JTextField();
		
		icon = new ImageIcon("icon/output.png");
		btnOut = new JButton("ȭ�����", icon);
		jtArea = new JTextArea(5, 30);
		jsPane = new JScrollPane(jtArea);
		friends = new ArrayList<Friend>();
		
		jP.add(new Label("�� ��", (int)CENTER_ALIGNMENT));
		jP.add(jtName);
		jP.add(new Label("�� ȭ", (int)CENTER_ALIGNMENT));
		jP.add(jtTel);
		jP.add(new Label("�� ��", (int)CENTER_ALIGNMENT));
		jP.add(jtAge);
		
		containPane.add(jP, BorderLayout.NORTH);
		containPane.add(btnOut, BorderLayout.CENTER);
		containPane.add(jsPane, BorderLayout.SOUTH);
		
		jtArea.setText("�̸�\t��ȭ\t\t����\n");
		setVisible(true);
		setBounds(100, 100, 400, 300);
		
		/* �̺�Ʈ �߰� */
		btnOut.addActionListener(this);
	}
	public Ex03_Gui() {
		this("");
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == btnOut) { 
			// jtName, jtTel, jtAge���� friends�� ��ü�� �߰�
			String name = jtName.getText().trim();
			String tel = jtTel.getText().trim();
			if(name.equals("") || tel.equals("")) {
				System.out.println("�̸��� ��ȭ��ȣ�� �ʼ� �Է»����Դϴ�.");
				return;
			}
			int age = 0;
			try {
				age = Integer.parseInt(jtAge.getText());
				if(age<0 || age>=150) {
					System.out.println("��ȿ���� �ʴ� ���̴� 0��� ó��");
					age = 0;
				}
			} catch (NumberFormatException e2) {
				System.out.println("��ȿ���� �ʴ� ���̴� 0��� ó��" + e2.getMessage());
			}
			Friend friend = new Friend(name, tel, age);
			jtArea.append(friend.toString() + "\n");
			friends.add(friend);
			
			jtName.setText("");
			jtTel.setText("");
			jtAge.setText("");
			System.out.println(friends.size() + "�� �Էµ�");
		}
	}
	
	public static void main(String[] args) {
		new Ex03_Gui("Gui ����");
	}
}