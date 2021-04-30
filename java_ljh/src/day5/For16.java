package day5;

public class For16 {
	
	public static void main(String[] args) {
		// 중첩 for문을 이용해 *출력
		int k, i;
		for(k=1; k<=5; k += 1) {
			for(i=1; i<=k; i += 1) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println("---------");
		
		for(k=1; k<=5; k += 1) {
			for(i=1; i<=4; i += 1) {
				System.out.print(" ");
			}
			for(i=1; i<=4; i += 1) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println("---------");
		
		for(k=1; k<=5; k += 1) {
			for(i=1; i<=5-k; i += 1) {
				System.out.print(" ");
			}
			for(i=1; i<=k; i += 1) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println("---------");
		
		
		
		
		
		/*          *
		 *         ***
		 *        *****
		 *       *******
		 *      *********      
		 */     
		 
		
		for(k=1; k<=5; k += 1) {
			for(i=1; i<=5-k; i += 1) {
				System.out.print(" ");
			}
			for(i=1; i<=k; i += 1) {
				System.out.print("*");
			}
			for(i=1; i<=k-1; i +=1 ) {
			System.out.print("*");
			}
			System.out.println();
		}
		System.out.println("---------");
		
		for(k=1; k<=5; k += 1) {
			for(i=1; i<=5-k; i += 1) {
				System.out.print(" ");
			}
			for(i=1; i<=k*2-1; i += 1) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println("---------");
		
		
		 /*     ********* 
		 *   	 *******
		 *        *****
		 *         ***
		 *          *	  
		 */   
		
		for(k=1; k<=5; k += 1) {
			for(i=1; i<=k-1; i += 1) {
				System.out.print(" ");
			}
			for(i=1; i<=6-k; i += 1) {
				System.out.print("*");
			}
			for(i=1; i<=5-k; i +=1 ) {
				System.out.print("*");
				}
			System.out.println();
		}
		

	}
}  