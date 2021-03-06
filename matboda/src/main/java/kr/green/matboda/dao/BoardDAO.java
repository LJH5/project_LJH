package kr.green.matboda.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.BoardVO;
import kr.green.matboda.vo.ImageVO;

public interface BoardDAO {

	ArrayList<BoardVO> selectBoardList(@Param("cri")Criteria cri);

	BoardVO selectBoard(Integer num);

	void insertBoard(@Param("board")BoardVO board);

	int selectTotalCount(@Param("cri")Criteria cri);

	void updateBoard(BoardVO dbBoard);

	void deleteBoard(Integer num);

	void deleteReplyBoard(Integer num);

	void insertImage(ImageVO image);

	void updateViews(Integer num);
	
	ArrayList<ImageVO> selectFileList(Integer num);

	void deleteFile(int im_num);

	ArrayList<Integer> selectFileNumList(int bo_num);

	ImageVO selectFile(Integer tmp);

	ArrayList<BoardVO> selectMainBoardList();

}
