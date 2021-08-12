package kr.green.matboda.service;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.BoardVO;
import kr.green.matboda.vo.ImageVO;
import kr.green.matboda.vo.MemberVO;

public interface BoardService {

	ArrayList<BoardVO> getBoardList(Criteria cri);

	BoardVO getBoard(Integer num);

	void insertBoard(BoardVO board, MultipartFile[] fileList, MemberVO user) throws Exception;

	int getTotalCount(Criteria cri);

	void updateBoard(BoardVO board, MultipartFile[] fileList, MemberVO user, Integer[] fileNumList);

	void deleteBoard(Integer num, MemberVO user);

	void updateViews(Integer num);

	ArrayList<ImageVO> getFileList(Integer num);

	ResponseEntity<byte[]> downloadFile(String fileName) throws IOException;


}
