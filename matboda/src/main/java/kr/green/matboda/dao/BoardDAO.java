package kr.green.matboda.dao;

import java.util.ArrayList;

import kr.green.matboda.vo.BoardVO;

public interface BoardDAO {

	ArrayList<BoardVO> selectBoardList();

}
