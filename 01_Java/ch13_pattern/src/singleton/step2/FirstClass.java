package singleton.step2;

public class FirstClass {
	public static void main(String[] args) {
		SingletonClass obj = SingletonClass.getInstance();
		
		System.out.println("FristClass형 객체 생성");
		System.out.println("i값 : " + obj.getI());
		
		obj.setI(999);
		
		System.out.println("변경후 i값 : " + obj.getI());
		System.out.println("FirstClass 생성자 끝");
	}
}