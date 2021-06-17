package com.lec.ex04_object;

public class Ex04_point3DTestMain {
	public static void main(String[] args) throws CloneNotSupportedException {
		Point3D p1 = new Point3D(3, 4, 5);
		Point3D p2 = new Point3D(13, 24, 35);
		Point3D p3 = (Point3D)p2.clone();
		
		System.out.println(p1);
		System.out.println( p2);
		System.out.println( p3);
		
		if(p1 == p2) {
			System.out.println("���� �ּ�");
		}
		else {
			System.out.println("�ٸ� �ּ�");
		}
		
		if(p2.equals(p3)) {
			System.out.println("���� ��ǥ");
		}
		else {
			System.out.println("�ٸ� ��ǥ");
		}
	}
}