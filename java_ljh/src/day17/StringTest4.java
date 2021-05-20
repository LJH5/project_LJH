package day17;

import java.util.Scanner;

public class StringTest4 {

	public static void main(String[] args) {
		//substring(index): index부터 끝까지 부분 문자열을 생성
		//substring(begin, end): begin번지부터 end번지 전까지 부분 문자열 생성
		String str = "안녕하세요";
		System.out.println(str.substring(2));
		//원본을 바꾸지 않고 새로운 문자열을 생성해서 전달
		System.out.println(str);
		System.out.println(str.substring(2, 3));	
	
		//주민등록번호를 입력해서 생년월일 부분을 추출하여 년도 월 일을 출력하는 코드를 작성하세요
		Scanner sc = new Scanner(System.in);
		
		System.out.print("주민등록번호를 입력하세요(예: 020101-3234567): ");
		try {	
			String num = sc.next();	
			String year = num.substring(0, 2);
			String mon = num.substring(2, 4);
			String day = num.substring(4, 6);
			String yearFront ="";
			
			if(num.substring(7,8) != null && (num.substring(7,8).equals("3") || num.substring(7,8).equals("4"))) {
				yearFront = "20";
			}else if(num.substring(7,8) !=null && (num.substring(7,8).equals("1") || num.substring(7,8).equals("2"))) {
				yearFront = "19";
			}else {
				System.out.println("잘못된 입력");
				return;
			}
				
			System.out.println(yearFront + year+ "년 "+mon+"월 "+ day+"일");
		}catch(Exception e) {
			System.out.println("잘못된 입력입니다.");
		}
		sc.close();
	}

}
