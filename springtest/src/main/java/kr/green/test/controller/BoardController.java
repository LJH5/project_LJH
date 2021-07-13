package kr.green.test.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.test.pagination.Criteria;
import kr.green.test.pagination.PageMaker;
import kr.green.test.service.BoardService;
import kr.green.test.service.MemberService;
import kr.green.test.vo.BoardVO;
import kr.green.test.vo.MemberVO;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/board/*")
public class BoardController {
	@Autowired
	BoardService boardService;
	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/list")
	public ModelAndView list(ModelAndView mv, String msg, Criteria cri) {
		cri.setPerPageNum(2);
		ArrayList<BoardVO> list = boardService.getBoardList(cri);
		// 현재 페이지정보(검색타입, 검색어)에 대한 총 게시글 수를 가져와야함
		int totalCount=boardService.getTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount,2,cri);
		System.out.println(list);
		mv.addObject("pm", pm);
		mv.addObject("list", list);
		mv.addObject("msg", msg);
		mv.setViewName("board/list");
		return mv;
	}

	@RequestMapping(value = "/detail")
	public ModelAndView detail(ModelAndView mv, Integer num, String msg) {
		boardService.updateViews(num);
		BoardVO board = boardService.getBoard(num);
		mv.addObject("board", board);
		mv.addObject("msg", msg);
		mv.setViewName("board/detail");
		return mv;
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView registerGet(ModelAndView mv) {
		mv.setViewName("board/register");
		return mv;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView registerPost(ModelAndView mv, BoardVO board, HttpServletRequest r) {
		MemberVO user = memberService.getMember(r);
		boardService.insertBoard(board, user);
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public ModelAndView modifyGet(ModelAndView mv, Integer num, HttpServletRequest r) {
		BoardVO board = boardService.getBoard(num);
		mv.addObject("board", board);
		mv.setViewName("board/modify");
		MemberVO user = memberService.getMember(r);
		if(board == null || !board.getWriter().equals(user.getId())) {
			mv.setViewName("redirect:/board/list");
		}
		return mv;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ModelAndView modifyPost(ModelAndView mv, BoardVO board, HttpServletRequest r) {
		int res = boardService.updateBoard(board);
		String msg = res != 0? board.getNum()+"번 게시글이 수정되었습니다." : "없는 게시글입니다."; 
		mv.setViewName("redirect:/board/detail");
		mv.addObject("num",board.getNum());
		MemberVO user = memberService.getMember(r);
		if(board == null || !board.getWriter().equals(user.getId())) {
			mv.setViewName("redirect:/board/list");
		}else {
			boardService.updateBoard(board);
		}
		return mv;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView deletePost(ModelAndView mv, Integer num, HttpServletRequest r) {
		log.info("/board/delete: " + num);
		MemberVO user = memberService.getMember(r);
		int res = boardService.deleteBoard(num, user);
		if(res!=0 && res != 1) 
			mv.addObject("msg",num+"번째 글을 삭제했습니다.");
		else if(res == 1)
			mv.addObject("msg","권한이 없습니다.");
		else
			mv.addObject("msg", "게시글이 없거나 이미 삭제되었습니다.");
		
		mv.setViewName("redirect:/board/list");
		return mv;
	}

}
