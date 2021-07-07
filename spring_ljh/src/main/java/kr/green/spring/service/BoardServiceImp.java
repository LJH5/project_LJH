package kr.green.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.spring.dao.BoardDAO;
import kr.green.spring.vo.BoardVO;

@Service
public class BoardServiceImp implements BoardService{
	@Autowired
	BoardDAO boardDao;

	@Override
	public ArrayList<BoardVO> getBoardList() {
		
		return boardDao.getBoardList();
	}

	@Override
	public BoardVO getBoard(Integer num) {
		//게시글 번호가 없으면 게시글이 없다고 전달 => num가 null인지 확인하여 null이면 null 반환
		if(num == null) {
			return null;
		}
		// 다오에게 게시글 번호를 주면서 게시글을 가져오라고 시킴
		BoardVO board = boardDao.getBoard(num);
		// 가져온 게시글을 전달
		return board;
	}

	@Override
	public void insertBoard(BoardVO board) {
		//  다오에게 게시글 정보를 주면서 게시글을 등록하라고 시킴
		boardDao.insertBoard(board);
		
	}

	
}
