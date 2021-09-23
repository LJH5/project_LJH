package kr.green.matboda.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.matboda.service.BoardService;
import kr.green.matboda.service.RestaurantService;
import kr.green.matboda.service.ReviewService;
import kr.green.matboda.vo.BoardVO;
import kr.green.matboda.vo.RestaurantVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {
	
	RestaurantService restaurantService;
	ReviewService reviewService;
	BoardService boardService;
	
	@GetMapping("/")
	public ModelAndView home(ModelAndView mv) {
		
		ArrayList<RestaurantVO> list = restaurantService.getRestaurant();
		
		ArrayList<BoardVO> boardList = boardService.getMainBoardList();
		
		mv.addObject("title", "메인");
		mv.addObject("list", list);
		mv.addObject("boardList", boardList);
		mv.setViewName("/template/main/home");
		return mv;
	}
	
}