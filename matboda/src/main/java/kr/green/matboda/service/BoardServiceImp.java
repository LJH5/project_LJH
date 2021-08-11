package kr.green.matboda.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.matboda.dao.BoardDAO;
import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.BoardVO;
import kr.green.matboda.vo.MemberVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardServiceImp implements BoardService{
	BoardDAO boardDao;

	@Override
	public ArrayList<BoardVO> getBoardList(Criteria cri) {
		return boardDao.selectBoardList(cri);
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

	@Override
	public int getTotalCount(Criteria cri) {
		return boardDao.selectTotalCount(cri);
	}

	@Override
	public void updateBoard(BoardVO board, MultipartFile[] fileList, MemberVO user) {
		if(board == null || user == null)
			return;
		BoardVO dbBoard = boardDao.selectBoard(board.getBo_num());
		if(dbBoard == null || !user.getMe_id().equals(dbBoard.getBo_me_id()))
			return;
		dbBoard.setBo_title(board.getBo_title());
		dbBoard.setBo_content(board.getBo_content());
		boardDao.updateBoard(dbBoard);
	}

	@Override
	public void deleteBoard(Integer num, MemberVO user) {
		if(num == null || user == null)
			return ;
		BoardVO board = boardDao.selectBoard(num);
		if(board == null || !board.getBo_me_id().equals(user.getMe_id()))
				return;
		boardDao.deleteBoard(num);
		boardDao.deleteReplyBoard(num);
	}
	
}
