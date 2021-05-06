package Practice;

import java.util.Scanner;

public class ForToWhile {

	public static void main(String[] args) {
		
		//For1, "Hello world" 5번 출력
		int i=1;
		while(i<=5) {
			System.out.println("Hello World");
			i+=1;
		}
		System.out.println("-------------------");
		
		//For2, 1~5까지 출력
		i=1;
		while(i<=5) {
			System.out.print(i + " ");
			i+=1;
		}
		System.out.println();
		System.out.println("-------------------");
		
		//For3, 구구단 7단
		i=1;
		while(i<=9) {
			System.out.println("7 x " + i + " = "+ (7 * i));
			i+=1;
		}
		System.out.println("-------------------");
		
		//For4, 10이하 짝수 출력
		i=1;
		while(i<=10) {
			if(i%2==0) {
				System.out.print(i + " ");
			}
			i+=1;
		}
		System.out.println();
		System.out.println("-------------------");
		
		//For5, 1~5까지 합 구하기
		i=1;
		int sum=0;
		while(i<=5) {
			sum+=i;
			i+=1;
		}
		System.out.println(sum);
		System.out.println("-------------------");
		
		//For6, 정수의 약수 출력
		i=1;
		int num = 10;
		while(i<=num) {
			if(num%i==0) {
				System.out.print(i + " ");
			}
			i+=1;
		}
		System.out.println();
		System.out.println("-------------------");
		
		//For7, 두 수의 최대 공약수 구하기
		i=1;
		int num1, num2, gcd;
		num1=8;
		num2=12;
		gcd=1;
		while(i<=num2) {
			if(num1%i==0 && num2%i==0) {
				gcd=i;
			}
			i+=1;
		}
		System.out.println(num1 + ", " + num2 + "의 최대 공약수: " + gcd);
		System.out.println("-------------------");
		
		//For 8, a~z까지 출력
		i=0;
		while(i<26) {
			System.out.print((char)(i+'a') + " ");
			i+=1;
		}
		System.out.println();
		System.out.println("-------------------");
		
		//For9, 무한루프
		/*
		i=1;
		while(i<5) {
			System.out.println("Hello would!");
		}
		System.out.println("-------------------");
		*/
		
		//For10, 반복횟수가 정해져 있지 않은 예제, 콘솔에서 q나 Q를 입력받을 때까지 반복하는 예제
		Scanner scan = new Scanner(System.in);
		char ch = 'a';
		while(ch!='q' && ch!='Q') {
			System.out.print("알파벳을 입력하세요(종료하려면 q/Q를 입력) : ");
			ch = scan.next().charAt(0);
		}
		scan.close();
		System.out.println("-------------------");
		
		//For11, 두 정수의 최소 공배수 구하기
		num1=8;
		num2=12;
		i=num1;
		while(true) {
			if(i%num2==0) {
				System.out.println(num1 + ", " + num2 + "의 최대 공약수:" + i);
				break;
			}
			i+=num1;
		}
		System.out.println("-------------------");
		
		//For12, 하나의 *를 이용하여 다음과 같이 출력되도록 작성하세요.  왜 안되냐
		/* 	*****
		 * 	*****
		 *  *****
		 *  *****
		 *  *****
		 */
		i=1;
		int j=1;
		while(i<=5) {
			while(j<=5) {
				System.out.print("*");
				j+=1;
			}
			System.out.println();
			j=1; //5까지 증가한 j를 다시 1로 초기화
			i+=1;
		}
		
		System.out.println("-------------------");
		
		//For14, 정수 num가 소수인지 아닌지 판별하는 코드를 작성
		i=1;
		int cnt=0;
		num=13;
		while(i<=num) {
			if(num%i==0) {
				cnt+=1;
			}
			i+=1;
		}
		if(cnt==2) {
			System.out.println(num + "은/는 소수입니다.");
		} else {
			System.out.println(num + "은/는 소수가 아닙니다.");
		}
		System.out.println("-------------------");
		
		//For15, 100 이하의 모든 소수를 출력하는 코드를 작성
		i=1;
		j=1;
		while(i<=100) {
			cnt=0;
			while(j<=i) {
				if(i%j==0) {
					cnt+=1;
				}
				j+=1;
			}
			if(cnt==2) {
				System.out.print(i + " ");
			}
			j=1;
			i+=1;
		}
		
		
	}
}

