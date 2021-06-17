package singleton.step2;

public class SecondClass {
	public static void main(String[] args) {
		SingletonClass sobj = SingletonClass.getInstance();
		System.out.println("SecondClass 积己磊 救俊辑");
		System.out.println(sobj.getI());
		System.out.println("SecondClass 积己磊 场");
	}
}