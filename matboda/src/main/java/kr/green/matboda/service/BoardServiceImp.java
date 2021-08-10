package kr.green.matboda.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.green.matboda.dao.BoardDAO;
import kr.green.matboda.vo.BoardVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardServiceImp implements BoardService{
	BoardDAO boardDao;

	@Override
	public ArrayList<BoardVO> getBoardList() {
		return boardDao.selectBoardList();
	}
	
}
