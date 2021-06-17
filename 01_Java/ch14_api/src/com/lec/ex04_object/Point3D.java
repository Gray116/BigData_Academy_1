package com.lec.ex04_object;

public class Point3D implements Cloneable{
	private int x;
	private int y;
	private int z;
	
	public Point3D() {} // ÀÚµ¿À¸·Î 0À¸·Î ¼³Á¤;

	public Point3D(int x, int y, int z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}
	
	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj != null && obj instanceof Point3D) {
			boolean xChk = x == ((Point3D)obj).x;
			boolean yChk = y == ((Point3D)obj).y;
			boolean zChk = z == ((Point3D)obj).z;
			
			return xChk && yChk && zChk;
		}
		else {
			return false;
		}
	}
	
	@Override
	public String toString() {
		return "[xÁÂÇ¥] : " + x + "\t[yÁÂÇ¥] : " + y + "\t[zÁÂÇ¥] : " + z;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public int getZ() {
		return z;
	}

	public void setZ(int z) {
		this.z = z;
	}
}