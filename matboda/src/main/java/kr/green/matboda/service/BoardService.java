package kr.green.matboda.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.green.matboda.vo.BoardVO;
import kr.green.matboda.vo.MemberVO;

public interface BoardService {

	ArrayList<BoardVO> getBoardList();

	BoardVO getBoard(Integer num);

	void insertBoard(BoardVO board, MultipartFile[] fileList, MemberVO user);


}
