package kr.green.matboda.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.pagination.PageMaker;
import kr.green.matboda.service.BoardService;
import kr.green.matboda.service.MemberService;
import kr.green.matboda.vo.BoardVO;
import kr.green.matboda.vo.ImageVO;
import kr.green.matboda.vo.MemberVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/board")
public class BoardController {
	
	BoardService boardService;
	MemberService memberService;
	
	@GetMapping("/list")
	public ModelAndView listGet(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(10);
		ArrayList<BoardVO> list = boardService.getBoardList(cri);
		int totalCount = boardService.getTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		
		mv.addObject("title", "Q&A");
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		mv.setViewName("/template/board/list");
		return mv;
	}
	@GetMapping("/detail")
	public ModelAndView detailGet(ModelAndView mv, Integer num) {
		boardService.updateViews(num);
		BoardVO board = boardService.getBoard(num);
		
		ArrayList<ImageVO> fList = boardService.getFileList(num);
		mv.addObject("title", "Q&A");
		mv.addObject("board", board);
		mv.addObject("fList", fList);
		mv.setViewName("/template/board/detail");
		return mv;
	}
	@GetMapping("/register")
	public ModelAndView registerGet(ModelAndView mv) {
		mv.addObject("title", "Q&A");
		mv.setViewName("/template/board/register");
		return mv;
	}
	@PostMapping("/register")
	public ModelAndView registerPost(ModelAndView mv, BoardVO board, MultipartFile [] fileList, HttpServletRequest request ) throws Exception {
		MemberVO user = memberService.getMemberByRequest(request);
		board.setBo_type("Q&A");
		boardService.insertBoard(board, fileList, user);
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	@GetMapping("/modify")
	public ModelAndView modifyGet(ModelAndView mv, Integer num) {
		BoardVO board = boardService.getBoard(num);
		
		ArrayList<ImageVO> fList = boardService.getFileList(num);
		
		mv.addObject("title", "게시글 수정");
		mv.addObject("board", board);
		mv.addObject("fList", fList);
		mv.setViewName("/template/board/modify");
		return mv;
	}
	@PostMapping("/modify")
	public ModelAndView modifyPost(ModelAndView mv, BoardVO board, MultipartFile [] fileList, HttpServletRequest request, Integer [] fileNumList ) throws Exception {
		MemberVO user = memberService.getMemberByRequest(request);
		board.setBo_type("Q&A");
		boardService.updateBoard(board, fileList, user, fileNumList);
		mv.addObject("bo_num", board.getBo_num());
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	@GetMapping("/delete")
	public ModelAndView deleteGet(ModelAndView mv,Integer num,HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		boardService.deleteBoard(num, user);
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	@ResponseBody
	@GetMapping("/download")
	public ResponseEntity<byte[]> downloadFile(String fileName)throws Exception{
	    return boardService.downloadFile(fileName);
	}
	@ResponseBody
	@PostMapping("/img/upload")
	public String imgUploadPost(MultipartFile file) throws Exception {
		String imgUrl = boardService.uploadImg(file);
		return imgUrl;
	}
}