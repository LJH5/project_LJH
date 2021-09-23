package kr.green.matboda.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.matboda.dao.BoardDAO;
import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.utils.UploadFileUtils;
import kr.green.matboda.vo.BoardVO;
import kr.green.matboda.vo.ImageVO;
import kr.green.matboda.vo.MemberVO;

@Service
public class BoardServiceImp implements BoardService{
	@Autowired
	BoardDAO boardDao;
	
	private String uploadPath = "D:\\JAVA_LJH\\img";
	private String uploadThumbnailPath = "D:\\JAVA_LJH\\img";
	
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
	public void insertBoard(BoardVO board, MultipartFile[] fileList, MemberVO user) throws Exception {
		if(board == null || user == null || board.getBo_title().length() == 0 )
			return;
		board.setBo_me_id(user.getMe_id());
		boardDao.insertBoard(board);
		if(fileList == null)
			return;
		int size = fileList.length < 3 ? fileList.length : 3;
		for(int i = 0; i<size; i++) {
			insertFile(fileList[i], board.getBo_type(), board.getBo_num());
		}
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return boardDao.selectTotalCount(cri);
	}

	@Override
	public void updateBoard(BoardVO board, MultipartFile[] fileList, MemberVO user, Integer[] fileNumList) throws Exception {
		if(board == null || user == null)
			return;
		BoardVO dbBoard = boardDao.selectBoard(board.getBo_num());
		if(dbBoard == null || !user.getMe_id().equals(dbBoard.getBo_me_id()))
			return;
		dbBoard.setBo_title(board.getBo_title());
		dbBoard.setBo_content(board.getBo_content());
		boardDao.updateBoard(dbBoard);
		
		ArrayList<Integer> dbFileNumList = boardDao.selectFileNumList(board.getBo_num());
		int dbSize = 0;
		if(dbFileNumList != null) {
			dbSize = dbFileNumList.size();
			ArrayList<Integer> inputFileNumList = new ArrayList<Integer>();
			if(fileNumList != null) {
				for(Integer tmp : fileNumList) {
					inputFileNumList.add(tmp);
					dbSize--;
				}
			}
			for(Integer tmp : dbFileNumList) {
				if(!inputFileNumList.contains(tmp)) {
					deleteFile(boardDao.selectFile(tmp));
				}
			}
			
		}
		if(fileList == null)
			return;
		for(MultipartFile tmp : fileList) {
			if(insertFile(tmp, board.getBo_type(), board.getBo_num()))
				dbSize++;
			if(dbSize == 3)
				break;
		}
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
		
		ArrayList<ImageVO> fList = boardDao.selectFileList(num);
		if(fList == null || fList.size() == 0)
			return;
		for(ImageVO tmp: fList) {
			deleteFile(tmp);
		}
	}
	@Override
	public void updateViews(Integer num) {
		boardDao.updateViews(num);
	}

	@Override
	public ArrayList<ImageVO> getFileList(Integer num) {
		if(num == null)
			return null;
		 return boardDao.selectFileList(num);  
	}
	@Override
	public ResponseEntity<byte[]> downloadFile(String fileName) throws IOException {
		InputStream in = null;
	    ResponseEntity<byte[]> entity = null;
	    try{
	        HttpHeaders headers = new HttpHeaders();
	        in = new FileInputStream(uploadPath+fileName);

	        fileName = fileName.substring(fileName.indexOf("_")+1);
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition",  "attachment; filename=\"" 
				+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
	    }catch(Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally {
	        in.close();
	    }
	    return entity;
	}
	public boolean insertFile(MultipartFile tmp, String type, int num) throws Exception {
		if(tmp == null || tmp.getOriginalFilename().length() == 0) {
			return false;
		}
		String name = UploadFileUtils.uploadFile(uploadPath, tmp.getOriginalFilename(), tmp.getBytes());
		ImageVO image = new ImageVO(type, num, name, tmp.getOriginalFilename());
		boardDao.insertImage(image);
		return true;
	}
	
	private void deleteFile(ImageVO tmp) {
		File file = new File(uploadPath+tmp.getIm_name());
		if(file.exists())
			file.delete();
		boardDao.deleteFile(tmp.getIm_num());
	}

	@Override
	public String uploadImg(MultipartFile file) throws Exception {
		int extensionIndex = file.getOriginalFilename().lastIndexOf('.');
		String extension = file.getOriginalFilename().substring(extensionIndex);
		String name = "img" + extension;
		System.out.println(name);
		return UploadFileUtils.uploadFile(uploadThumbnailPath, name , file.getBytes());
	}

	@Override
	public ArrayList<BoardVO> getMainBoardList() {
		return boardDao.selectMainBoardList();
	}
}
