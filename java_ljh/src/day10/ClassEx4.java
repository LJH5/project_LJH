package day10;

import java.util.Scanner;

public class ClassEx4 {

	public static void main(String[] args) {
		/* 콘솔에서 x좌표와 y좌표를 입력받아 점을 만들고 만들어진 점의 위치를 출력하는 예제
		 */
		
		Scanner sc = new Scanner(System.in);
		System.out.print("좌표를 입력하세요(x, y 순으로): ");
		int x = sc.nextInt();
		int y = sc.nextInt();
		
		//입력받은 좌표를 이용하여 점을 생성
		Point pt = new Point();
		
		//만들어진 pt의 x,y좌표는? (0,0)
		pt.print();
		
		//pt의 초기값을 입력한 값인 4,5로 변경하는 코드를 작성하세요.
		pt.move(x, y);
		
		/* 다른 방법
		 * pt.setX(x);
		 * pt.setY(y);
		 */
		
		pt.print();
		
		sc.close();

	}

}
