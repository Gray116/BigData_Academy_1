package com.lec.ex03;

public abstract class Super { // �߻� Ŭ����
	public Super() {} // ����Ʈ ������
	public abstract void method1(); // �߻� �޼ҵ�(�����δ� ���� ���𹮸�), ��ӹ޴� Ŭ�������� �ݵ�� override
	public void mehtod2() { // �Ϲ� �޼ҵ�
		System.out.println("Super�� method2()");
	}
}