package com.lec.ex03_point;

public class TestMain {
	public static void main(String[] args) {
		Point3D point3d = new Point3D();
		
		point3d.setX(5);
		point3d.setY(10);
		point3d.setZ(15);
		point3d.point3dPrint();
		
		System.out.println(point3d.point3dInfoString());
	}
}