package singleton.step2;

public class SecondClass {
	public static void main(String[] args) {
		SingletonClass sobj = SingletonClass.getInstance();
		System.out.println("SecondClass ������ �ȿ���");
		System.out.println(sobj.getI());
		System.out.println("SecondClass ������ ��");
	}
}