package day18;

import java.util.ArrayList;
import java.util.Scanner;

public class ListTest2 {

	public static void main(String[] args) {
		//오늘의 할일을 저장하는 리스트를 생성한 후 오늘의 할일을 입력받고 다 받은 후에 출력하는 코드를 작성하세요 
		ArrayList<String> list = new ArrayList<String>();
		String todo;
		Scanner sc = new Scanner(System.in);
		do {
			System.out.print("오늘의 할일을 입력: ");
			todo = sc.next();
			list.add(todo);
		}while(!todo.equals("종료"));
		/*
		 while(true){
		 	System.out.print("오늘의 할일을 입력: ");
			todo = sc.next();
			if(todo.equals("종료")){
				break;
			}
			list.add(todo);
		 */
		for(int i=0; i<list.size()-1; i++) {
			System.out.println(i+1+". "+ list.get(i));
		}
		
		sc.close();
	}

}
