package singleton.step1;

public class SingletonClass {
	private int i;
	private static SingletonClass INSTANCE;
	public static SingletonClass getInstance() {
		// 생성된 객체가 없으면 객체를 생성하여 주소를 리턴.
		// 생성된 객체가 있을 경우 그 객체를 리턴한다.
		if(INSTANCE == null) {
			INSTANCE = new SingletonClass();
		}
		return INSTANCE;
	}
	
	private SingletonClass() {}
	
	public int getI() {
		return i;
	}
	
	public void setI(int i) {
		this.i = i;
	}
}