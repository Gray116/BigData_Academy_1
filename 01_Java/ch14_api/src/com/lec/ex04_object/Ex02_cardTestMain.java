package com.lec.ex04_object;

import java.util.Random;

public class Ex02_cardTestMain {
	public static void main(String[] args) {
		Card[] cards = {new Card('��', 3),
										  new Card('��', 1),
										  new Card('��', 3),
										  new Card('��', 2)
										  };
		Random random = new Random();
		char[] kinds = {'��', '��', '��', '��'};
		
		Card com = new Card(kinds[random.nextInt(4)], random.nextInt(12) + 1);
		System.out.println(com);
		
		for(int idx=0; idx<cards.length; idx++) {
			if(cards[idx].equals(com)) {
				System.out.println(idx + "��° ī��� �����ϴ�." + cards[idx]);
			}
			else {
				System.out.println(idx + "��° ī��� �ٸ��ϴ�." + cards[idx]);
			}
		}
	} // main
} // class