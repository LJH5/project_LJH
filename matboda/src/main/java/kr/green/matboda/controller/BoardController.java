package kr.green.matboda.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.matboda.service.BoardService;
import kr.green.matboda.vo.BoardVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/board")
public class BoardController {
	
	BoardService boardService;
	
	@GetMapping("/list")
	public ModelAndView listGet(ModelAndView mv) {
		ArrayList<BoardVO> list = boardService.getBoardList();
		mv.addObject("title", "게시판");
		mv.addObject("list", list);
		mv.setViewName("/template/board/list");
		return mv;
	}

}