package day7;

public class MethodEx4 {

	public static void main(String[] args) {
		//최대 공약수를 이용하여 최대 공배수를 구하시오
		//두 정수를 A, B라 하고 최대 공약수를 G, 최소 공배수를 L이라소 했을 때, A = G*a, B=G*b, L=A*B/G
		System.out.println(gcd1(8,12)); //gcd1 재사용성 높음
		gcd2(8,12);						//gcd2 재사용성 낮음
		System.out.println(lcm(8,12));
	}
	
	/* 기능	 : 두 정수의 쵀대 공약수를 알려주는 메소드
	 * 매개변수: int num1, int num2
	 * 리턴타입: int
	 * 메소드명: gcd1
	 */
	public static int gcd1(int num1, int num2) {
		int res =1;
		for(int i=1; i<=num1; i+=1) {
			if(num1%i==0 && num2%i==0) {
				res=i;
			}
		}
		return res;
	}
	
	/* 기능	 : 두 정수의 쵀대 공약수를 출력하는 메소드
	 * 매개변수: int num1, int num2
	 * 리턴타입: void
	 * 메소드명: gcd1
	 */
	public static void gcd2(int num1, int num2) {
		int res =1;
		for(int i=1; i<=num1; i+=1) {
			if(num1%i==0 && num2%i==0) {
				res=i;
			}
		}
		System.out.println(num1 + "과 " + num2 + "의 최대 공약수: " + res);
	}
	
	/* 기능	 : 두 정수의 쵀대 공배수를 알려주는 메소드
	 * 매개변수: int num1, int num2
	 * 리턴타입: void
	 * 메소드명: lcm
	 */
	public static int lcm(int num1,int num2) {
		int res = num1*num2/gcd1(num1,num2);
		return res;
	}

}
