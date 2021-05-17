package Practice;

public class CalculatorEx {

	public static void main(String[] args) {
	Calculator myCalc = new Calculator();
	myCalc.powerOn();
	
	int res1 = myCalc.plus(5, 6);
	System.out.println("res1: "+res1);
	
	int x = 10;
	int y = 4;
	double res2 = myCalc.divide(x, y);
	System.out.println("res2: "+res2);

	myCalc.powerOff();
	}

}
