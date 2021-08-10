package kr.green.matboda.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.matboda.vo.BoardVO;

public interface BoardDAO {

	ArrayList<BoardVO> selectBoardList();

	BoardVO selectBoard(Integer num);

	void insertBoard(@Param("board")BoardVO board);

}
