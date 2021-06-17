package com.lec.ex0_janmuri;

public class JumsuMain {
	public static void main(String[] args) {
		Jumsu[] student = {new Jumsu("정우성", 90, 90, 90),
												new Jumsu("김하늘", 90, 90, 91),
												new Jumsu("황정민", 81, 80 ,80),
												new Jumsu("강동원", 80, 80 ,80),
												new Jumsu("유아인", 70, 70, 70)
		};
		int[] tot = new int[5];		
		double[] totAver = new double[5];				
		
		System.out.println("\t\t\t성적표");
		System.out.println("----------------------------");
		System.out.println("번호\t이름\t\t국어\t 영어\t 수학\t 총점\t  평균");
		
		for(Jumsu s : student) {
			s.infoPrint();
			tot[0] += s.getKuk();
			tot[1] += s.getEng();
			tot[2] += s.getMath();
			tot[3] += s.getHap();
			tot[4] += s.getAver();
		}
		
		System.out.println("----------------------------");
		System.out.print("총점\t\t");
		/* 한열 씩 출력 될 때 각 과목의 점수를 총점에 */
		for(int idx=0; idx<tot.length; idx++) {
			System.out.print("     " + tot[idx]);
			
			totAver[idx] = tot[idx] / (tot.length * (1.0));
		}
		System.out.print("\n평균\t\t");
		
//		for(int idx2=0; idx2<totAver.length; idx2++) {
//			System.out.print("    " + totAver[idx2]);
//		}
		
		for(double a : totAver) {
			System.out.print("   " + a);
		}
	
	} // main
} //class
