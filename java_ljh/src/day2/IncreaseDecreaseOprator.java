package day2;

public class IncreaseDecreaseOprator {
	
	public static void main(String[] args) {
		int num1, num2;
		
		num1 = 10;
		num2 = 10;
		
		System.out.println("num1= " + num1 + ", num2 =" +num2);
		System.out.println("++num1= " + ++num1 + ", num2++ =" + num2++);
		System.out.println("num1= " + num1 + ", num2 =" +num2);
		System.out.println();
		
		num1++;
		++num1;
		//이때 num을 출력하면 얼마가 나올까요? 13		
		
		num1 = 10;
		num2 = 10;
		
		System.out.println("num1= " + num1 + ", num2 =" +num2);
		num1++;
		System.out.println("++num1= " + num1 + ", num2++ =" + num2);
		num2++;
		System.out.println("num1= " + num1 + ", num2 =" +num2);

	}
}