package day2;

import java.util.Scanner;

public class Test2_3 {

	public static void main(String[] args) {
		/* 국어 성적을 입력받고 국어 과목을 패스했는지 안했는지 확인하는 코드를 작성하시오.
		 * 국어 성적이 60점 미만이면 Fail, 국어 성적이 60점 이상이면 Pass
		 */
		
		Scanner scan = new Scanner(System.in);
		System.out.print("국어 성적을 입력하세요. : " );
		int Kor = scan.nextInt();
		
		//방법1
		System.out.println("국어 과목을 패스했습니까? : " + (Kor>=60));
		
		//방법2
		String result = Kor >= 60 ?  "Pass" : "Fail";
		System.out.println("국어 과목을 패스했습니까? : " + result);
		
		
		//국어 성적이 A학점인지 아닌지를 판별하는 코드를 작성하세요. A학점은 90점 이상, 100점 이하
		boolean result2 = 90<= Kor && Kor <= 100;
		System.out.println("국어 성적은 A 학점인가? : " + result2);
		
		// 조건 선택 연산자를 통해 국어 성적의 학점을 출력하는 코드를 작성하세요.
		String result3 = 90 <= Kor && Kor <= 100 ? "A" :
						 80 <= Kor && Kor <  90  ? "B" : 
						 70 <= Kor && Kor <  80  ? "C" : 
						 60 <= Kor && Kor <  70  ? "D" : "F" ;
		System.out.println("국어 성적 : " + result3);

		scan.close();
	}

}