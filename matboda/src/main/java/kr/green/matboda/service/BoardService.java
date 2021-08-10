package kr.green.matboda.service;

import java.util.ArrayList;

import kr.green.matboda.vo.BoardVO;

public interface BoardService {

	ArrayList<BoardVO> getBoardList();

	BoardVO getBoard(Integer num);


}
