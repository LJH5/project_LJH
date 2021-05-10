package day9;

public class CardGame {

	public static void main(String[] args) {
		// 배열에 같은 숫자 3개가 있으면 있는 숫자들을 배열에 저장하여 알려주는 코드를 작성하세요.
		/* 포커: 같은 수 4개
		 * 풀하우스: 트리플1+페어1 또는 트리플 2
		 * 스트레이트: 연속된 숫자가 4개
		 * 트리플: 같은 숫자가 3개
		 * 투페어: 같은 숫자가 2개씩 2개
		 * 페어: 같은 숫자 2개
		 * 탑: 위의 조건이 없는 경우 가장 큰 수
		 */
		
		int []arr=new int[] {1,2,3,4,5,6,7};
		int result;
		int [] resultArr;
		if((result=poker(arr))!=0){
			System.out.println("포커: " + poker(arr));
		}else if((result=fullHouse(arr))!=0) {
			System.out.println("풀하우스: " + fullHouse(arr));
		}else if((result=straight(arr))!=0) {
			System.out.println("스트레이트: " + straight(arr));
		}else if((result=triple(arr))!=0) {
			System.out.println("트리플: " + triple(arr));
		}else if((resultArr=twoPair(arr))!=null) {
			for(int tmp : resultArr) {
				System.out.println(tmp + " ");
			}
			System.out.print("투페어: ");
		}else if((result=onePair(arr))!=0) {
			System.out.println("원페어: " + onePair(arr));
		}else {
			System.out.println("버그인가?");
		}
				
	}
	
	/* 포커를 확인할 수 있는 메소드를 정리해보세요,
	 * 기능	 : 배열에 숫자를 비교 포커가 있으면 해당 숫자를 없으면 0을 알려주는 메소드
	 * 매개변수: int []
	 * 리턴타입: int
	 * 메소드명: poker
	 */
	public static int poker(int card[]) {
		int cnt=1;
		int res=0;
		
		for(int i=0; i<card.length-1; i+=1) {
			if(card[i]==card[i+1]) {
				cnt +=1;
				if(cnt==4) {
					return card[i];
				}
			}else {
				cnt=1;
			}	
		}
		return 0;
	}
	
	/* 트리플을 확인할 수 있는 메소드를 정리, 트리플이 있다면 해당 트리플의 숫자를 확인할 수 있는 메소드를 만들어야 함
	 * 기능   : 배열을 확인하여 트리플이 있으면 해당 숫자를, 없으면 0을 알려줌 
	 * 매개변수: int []
	 * 리턴타입: int []
	 * 메소드명: tripleList
	 */
	public static int[] tripleList(int card[]) {

		int []triple=new int[2];
		int cnt=1;
		int res=0;
		int num=0;
		
		for(int i=0; i<card.length-1; i+=1) {
			if(card[i]==card[i+1]) {
				num=card[i];
				cnt+=1;					
			}else {
				if(cnt==3) {
					triple[res]=num;
					res+=1;
				}
				cnt=1;
			}
			
		}
		if(cnt==3) {
			triple[res]=num;
			res+=1;
		}
		
		if(res==0) {
			return null;
		}else if(res==2) {
			return triple;
		}
		else {
			int []tmp = new int[1];
			tmp[0]=triple[0];
			return tmp;
		}
	}
	
	/* 트리플 기능을 하도록 메소드를 정리하고 코드를 작성하세요.
	 * 기능	 : 배열에 트리플이 있으면 해당 숫자를 알려주고 없으면 0으 알려주는 메소드
	 * 매개변수: int []
	 * 리턴타입: int
	 * 메소드명: triple
	 */
	public static int triple(int card[]) {
		int []res = tripleList(card);
		if (res==null || res.length==2) {
			return 0;
		}
		return res[0];
	}
	
	/*페어를 확인할 수 있는 메소드를 정리해보세요. 페어가 있다면 해당 페어의 숫자들을 알려주고, 없으면 null을 알려주는 메소드
	 * 기능	 : 배열에 같은 숫자가 2개 있으면 알려줌, 없으면 return null;
	 * 매개변수: int []
	 * 리턴타입: int []
	 * 메소드명: pairList
	 */
	public static int[] pairList(int card[]) {
		int pair[]=new int[3];
		int cnt=1;
		int num=0;
		int res=0;
		
		for(int i=0; i<card.length-1; i+=1) {
			if(card[i]==card[i+1]) {
				cnt+=1;
				num=card[i];
				
			}else {
				if(cnt==2) {
					pair[res]=num;
					res +=1;
				}
				cnt=1;
			}
		}
		if(cnt==2) {
			pair[res]=num;
			res +=1;
		}
		if(res==0) {
			return null;
		}else if(res<3){
			int []tmpArr = new int[res];
			for(int i=0; i<res; i+=1) {
				tmpArr[i]=pair[i];
			}
			return tmpArr;
		}
		return pair;
	}
	
	/* 원페어를 확인할 수 있는 메소드
	 * 기능	 : 베열에서 원페어인 숫자를 알려줌
	 * 매개변수: int []
	 * 리턴타입: int
	 * 메소드명: onePair 
	 */
	public static int onePair(int card[]) {
		int []res = pairList(card);
		if (res!=null && res.length==1) {
			return res[0];
		}
		return 0;
	}
	
	/* 투페어를 확인할 수 있는 메소드
	 * 기능	 : 베열에서 투페어인 숫자를 알려줌
	 * 매개변수: int []
	 * 리턴타입: int []
	 * 메소드명: twoPair 
	 */
	public static int[] twoPair(int card[]) {
		int []res = pairList(card);
		if (res==null || res.length==1) {
			return null;
		}
		return res;
	}

	/* 풀하우스를 확인할 수 있는 메소드
	 * 기능	 : 풀하우스가 있으면 풀하우스 숫자를 없으면 0을 알려주는 메소드
	 * 매개변수: int []
	 * 리턴타입: int
	 * 메소드명: fullHouse
	 */
	 public static int fullHouse(int []card) {
		int []triple = tripleList(card);
		int []pair = pairList(card);
		
		if(triple==null) {
			 return 0;
		 }
		if(triple.length==2) {
			 if(triple[0]>triple[1]) {
				 return triple[0];
			 }
			 return triple[1];
		}else if(pair!=null) {
			return triple[0];
		}else {
		return 0;
		}
	
		 /*
		  * //강사님 방법
		  
		 int[]triple = tripleList(card);
		 
		 if(triple==null) {
			 return 0;
		 }
		 if(triple.length==2) {
			 if(triple[0]>triple[1]) {
				 return triple[0];
			 }
			 return triple[1];
		 }
		 int []pair = pairList(card);
		 if(pair!=null) {
			 return triple[0];
		 }
		 return 0;
		 */
	}

	 /* 스트레이트를 확인할 수 있는 메소드, 백스트레이트
	  * 기능	  : 배열에서 스트레이트 있으면 스트레이트 중 가장 큰 수를 알려줌
	  * 매개변수: int []
	  * 리턴타입: int
	  * 매소드명: straight
	  */
	 public static int straight(int []card) {
		 int cnt=1;
		 int num=0;
		 
		 for(int i=0; i<card.length-1; i+=1) {
			 if(card[i]==card[i+1]) {
				 continue;
			 }
			 if(card[i]+1==card[i+1]) {
				 cnt+=1;
				 num=card[i+1];
			 }else {
				 if(cnt>=5) {
					 return num;
				 }
				 cnt=1;
			 }
		 }
		 if(cnt>=5) {
			 return num;
		 }
		 return 0;
	 }
}
