package day16;

public class TryTest6 {

	public static void main(String[] args) {
		int []arr = new int [5];
		
		//try와 catch또는 throws를 이용하지 않고 조건문과 리턴값을 이용하여 예외처리할 수 있다.
		//하지만 메소드에 리턴값이 이미 있는 경우는 조건문과 리턴값을 이용하여 예외처리할 수 있다.
		int res = setData2(arr, 0, 10); 
		if(res == -1) {
			System.out.println("배열의 번지가 잘못");
		}else if(res == 0) {
			System.out.println("배열 생성 안됨");
		}else {
			System.out.println("데이터 저장 성공");
		}
		
		
		try {
			setData(arr, 0, 10);
			int num = getData(arr, 0);
			System.out.println(num);
		}catch(Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		System.out.println("프로그램 종료");
	}
	/* 기능	 : 정수형 배열 index 번지에 있는 값을 data로 설정하는 메소드
	 * 매개변수: int[] arr, int index, int data
	 * 리턴타입: void
	 * 메소드명: setData*/
	/*나의 방법, 메소드에서 직접 예외처리를 하지 않는다....
	 public static void setData(int arr[], int index, int data) {
		try {
			arr[index]=data;
		}catch(NullPointerException e) {
			System.out.println("배열이 없습니다.");
		}catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("배열의 범위를 벗어났습니다.");
		}catch(Exception e) {
			System.out.println("예외 발생");
		}
	}*/
	
	/* 기능	 : 정수형 배열 index 번지에 있는 값을 가져오는 메소드
	 * 매개변수: int arr[], int index
	 * 리턴타입: int
	 * 메소드명: getData*/
	/*
	 public static int getData(int arr[], int index) {
		try {
			return arr[index];
		}catch(NullPointerException e) {
			System.out.println("배열이 없습니다.");
		}catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("배열의 범위를 벗어났습니다.");
		}catch(Exception e) {
			System.out.println("예외 발생");
		}
		return 0;
	}*/
	
	/* 기능	 : 정수형 배열 index 번지에 있는 값을 data로 설정하는 메소드
	 * 매개변수: int[] arr, int index, int data
	 * 리턴타입: void
	 * 메소드명: setData*/
	public static void setData(int arr[], int index, int data) {//메소드는 직접 예외 처리를 하지않음
		if(arr == null) {
			throw new NullPointerException("배열이 생성되지 않았습니다.");
		}
		if(index<0 || index >= arr.length) {
			throw new ArrayIndexOutOfBoundsException(index+"번지는 "+arr.length+"개짜리 배열에서 유효하지 않은 배열의 번지입니다.");
		}
		arr[index]=data;
	}
	
	/* 기능	 : 정수형 배열 index 번지에 있는 값을 가져오는 메소드
	 * 매개변수: int arr[], int index
	 * 리턴타입: int
	 * 메소드명: getData*/
	public static int getData(int arr[], int index) {

		
		if(arr == null) {
			throw new NullPointerException("배열이 생성되지 않았습니다.");
		}
		if(index<0 || index >= arr.length) {
			throw new ArrayIndexOutOfBoundsException(index+"번지는 "+arr.length+"개짜리 배열에서 유효하지 않은 배열의 번지입니다.");
		}
		
		return arr[index];
		
	}
	
	//
	public static int setData2(int arr[], int index, int data) {//메소드는 직접 예외 처리를 하지않음
		if(arr == null) {
			return 0;
		}
		if(index<0 || index >= arr.length) {
			return -1;
		}
		arr[index]=data;
		return 1;
	}
}
