package singleton.step2;

public class FirstClass {
	public static void main(String[] args) {
		SingletonClass obj = SingletonClass.getInstance();
		
		System.out.println("FristClass�� ��ü ����");
		System.out.println("i�� : " + obj.getI());
		
		obj.setI(999);
		
		System.out.println("������ i�� : " + obj.getI());
		System.out.println("FirstClass ������ ��");
	}
}