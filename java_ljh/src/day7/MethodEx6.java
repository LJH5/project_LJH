package day7;

public class MethodEx6 {

	public static void main(String[] args) {
		/* 다음과 같이 출력하는 메소드를 만드세요
		* *
		* **
		* ***
		* ****
		* *****
		*/
		
		/* 다음과 같이 출력하는 메소드를 만드세요
		*     *
		*    **
		*   ***
		*  ****
		* *****
		*/
		PrintLeftTriangle('+',5);
		PrintRightTriangle('^',7);
	}
	
	/* 기능	 : 
	 * 매개변수: char ch, int n
	 * 리턴타입: void
	 * 메소드명: PrintLeftTriangle
	 */
	public static void PrintLeftTriangle(char ch, int n) {
		for(int i=0; i<n; i+=1) {
			for(int j=0; j<=i; j+=1) {
				System.out.print(ch);
			}
			System.out.println();
		}
	}
	
	/* 기능	 : 
	 * 매개변수: char ch, int n
	 * 리턴타입: void
	 * 메소드명: PrintRightTriangle
	 */
	public static void PrintRightTriangle(char ch, int n) {
		for(int i=0; i<n; i+=1) {
			for(int j=0; j<n-(i+1); j+=1) {
				System.out.print(" ");
			}
			for(int j=0; j<=i; j += 1) {
				System.out.print(ch);
			}
			System.out.println();
		}	
	}
	
	/* 기능	 : 주어진 문자를 이용하여 n줄 삼각형을 출력하는데 주어진 삼각 종류에 맞게 출력하는 메소드
	 * 매개변수: char ch, int n, TriangleShape
	 * 리턴타입: void
	 * 메소드명: PrintTriangle
	 */
	public static void PrintTriangle(char ch, int n, TriangleShape shape) {
		switch(shape) {
		case LEFT_TRIANGLE:
			PrintLeftTriangle(ch, n);
			break;
		case RIGHT_TRIANGLE:
			PrintRightTriangle(ch, n);
			break;
		}
	}
}
enum TriangleShape{LEFT_TRIANGLE, RIGHT_TRIANGLE}