package kr.green.matboda.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.matboda.dao.BoardDAO;
import kr.green.matboda.vo.BoardVO;
import kr.green.matboda.vo.MemberVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardServiceImp implements BoardService{
	BoardDAO boardDao;

	@Override
	public ArrayList<BoardVO> getBoardList() {
		return boardDao.selectBoardList();
	}

	@Override
	public BoardVO getBoard(Integer num) {
		if(num == null)
			return null;
		return boardDao.selectBoard(num);
	}

	@Override
	public void insertBoard(BoardVO board, MultipartFile[] fileList, MemberVO user) {
		if(board == null || user == null)
			return;
		board.setBo_me_id(user.getMe_id());
		System.out.println(board);
		boardDao.insertBoard(board);
		
	}
	
}
