package day15;

public interface BoardService {
	/* 기능	 : 게시글 등록하는 메소드
	 * 매개변수: Board board
	 * 리턴타입: void
	 * 메소드명: insert
	 */
	void insert(Board board); // 기본제한자 생략시 public
	
	/* 기능	 : 게시글 삭제하는 메소드
	 * 매개변수: int num
	 * 리턴타입: boolean
	 * 메소드명: delete
	 */
	boolean delete(int num);
	
	/* 기능	 : 게시글 수정하는 메소드
	 * 매개변수: Board board
	 * 리턴타입: void
	 * 메소드명: modify
	 */
	void modify(Board board);
	
	/* 기능	 : 게시글 번호가 주어지면 게시글을 전달하는 메소드
	 * 매개변수: int num
	 * 리턴타입: Board board
	 * 메소드명: getBoard
	 */
	Board getBoard(int num);
	
	/* 기능	 : 게시글 리스트를 가져오는 메소드
	 * 매개변수: 
	 * 리턴타입: Board[]
	 * 메소드명: getBoardList
	 */
	Board[] getBoardList();
	
	/* 기능	 : 검색어가 들어간 게시글 리스트를 가져오는 메소드
	 * 매개변수: String search
	 * 리턴타입: Board[]
	 * 메소드명: getBoardList
	 */
	Board[] getBoardList(String search); //메소드 오버로딩: 메소드명이 같아도 매개변수가 달라서 가능
}
class Board{
	int num;
	String title;
	String contents;
	String writer;
	String registerDate;
}