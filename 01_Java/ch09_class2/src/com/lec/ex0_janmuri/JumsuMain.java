package com.lec.ex0_janmuri;

public class JumsuMain {
	public static void main(String[] args) {
		Jumsu[] student = {new Jumsu("���켺", 90, 90, 90),
												new Jumsu("���ϴ�", 90, 90, 91),
												new Jumsu("Ȳ����", 81, 80 ,80),
												new Jumsu("������", 80, 80 ,80),
												new Jumsu("������", 70, 70, 70)
		};
		int[] tot = new int[5];		
		double[] totAver = new double[5];				
		
		System.out.println("\t\t\t����ǥ");
		System.out.println("----------------------------");
		System.out.println("��ȣ\t�̸�\t\t����\t ����\t ����\t ����\t  ���");
		
		for(Jumsu s : student) {
			s.infoPrint();
			tot[0] += s.getKuk();
			tot[1] += s.getEng();
			tot[2] += s.getMath();
			tot[3] += s.getHap();
			tot[4] += s.getAver();
		}
		
		System.out.println("----------------------------");
		System.out.print("����\t\t");
		/* �ѿ� �� ��� �� �� �� ������ ������ ������ */
		for(int idx=0; idx<tot.length; idx++) {
			System.out.print("     " + tot[idx]);
			
			totAver[idx] = tot[idx] / (tot.length * (1.0));
		}
		System.out.print("\n���\t\t");
		
//		for(int idx2=0; idx2<totAver.length; idx2++) {
//			System.out.print("    " + totAver[idx2]);
//		}
		
		for(double a : totAver) {
			System.out.print("   " + a);
		}
	
	} // main
} //class
