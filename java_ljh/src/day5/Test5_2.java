package day5;

public class Test5_2 {

	public static void main(String[] args) {
		
		String str1 = "ab";		// 이때 'ab'는 리티널에 저장된다. str1에는 'ab'가 저장된 리터널의 주소값이 저장됨
		String str2 = "ab";		// 이때 str2에는 'ab'가 저장된 리터널의 주소값이 저장됨
		
		if(str1 == str2) {		// '==(참조변수)'는 값이 저장되어있는 주소값을 비교하는 것
			System.out.println("두 문자열이 같습니다.");
		} else {
			System.out.println("두 문자열이 다릅니다.");
		}
		
		String str3 = new String("ab");		// 리터널에 저장되어있는 "ab"를 새로운 주소에 복사함 
		String str4 = new String("ab"); 	// 리터널에 저장되어있는 "ab"를 새로운 주소에 복사함 
		
		if(str3 == str4) {
			System.out.println("두 문자열이 같습니다.");
		} else {
			System.out.println("두 문자열이 다릅니다.");
		}
	}

}
