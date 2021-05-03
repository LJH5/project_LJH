package day6;

import java.util.Calendar;

public class Enum3 {

	public static void main(String[] args) {
		//Calendar 함수를 이용하여 현재 년도와 월을 출력
		
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR); 		//now.get(1)
		int month = now.get(Calendar.MONTH)+1;	//now.get(2)
		System.out.println(year + "년" + month + "월");
	
	
	
	
	}

}
