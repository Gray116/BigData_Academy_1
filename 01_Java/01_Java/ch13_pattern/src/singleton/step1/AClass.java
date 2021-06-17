package singleton.step1;

public class AClass {
	private int intVar;
	public static AClass INSTANCE;
	private AClass() {}
	
	public static AClass getInstace() {
		if(INSTANCE == null) {
			INSTANCE = new AClass();
		}
		return INSTANCE;
	}
	
	public int getIntVar() {
		return intVar;
	}
	public void setIntVar(int intVar) {
		this.intVar = intVar;
	}
}