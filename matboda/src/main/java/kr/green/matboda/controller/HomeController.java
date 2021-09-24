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
	public ModelAndView home(ModelAndView mv, String type) {
		
		ArrayList<RestaurantVO> list = restaurantService.getRestaurant();
		
		ArrayList<BoardVO> boardList = boardService.getMainBoardList();
		
		ArrayList<RestaurantVO> korTop3 = restaurantService.getCaTop3Restaurant("한식");
		ArrayList<RestaurantVO> japTop3 = restaurantService.getCaTop3Restaurant("일식");
		ArrayList<RestaurantVO> chickenTop3 = restaurantService.getCaTop3Restaurant("치킨");
		ArrayList<RestaurantVO> snackTop3 = restaurantService.getCaTop3Restaurant("분식");
		ArrayList<RestaurantVO> wesTop3 = restaurantService.getCaTop3Restaurant("양식/피자");
		ArrayList<RestaurantVO> cafeTop3 = restaurantService.getCaTop3Restaurant("카페/디저트");
		ArrayList<RestaurantVO> chiTop3 = restaurantService.getCaTop3Restaurant("중식");
		ArrayList<RestaurantVO> brunchTop3 = restaurantService.getCaTop3Restaurant("브런치/버거/샌드위치");
		
		mv.addObject("title", "메인");
		mv.addObject("list", list);
		mv.addObject("boardList", boardList);
		
		mv.addObject("korTop3", korTop3);
		mv.addObject("chickenTop3", chickenTop3);
		mv.addObject("japTop3", japTop3);
		mv.addObject("snackTop3", snackTop3);
		mv.addObject("wesTop3", wesTop3);
		mv.addObject("cafeTop3", cafeTop3);
		mv.addObject("chiTop3", chiTop3);
		mv.addObject("brunchTop3", brunchTop3);
		
		mv.setViewName("/template/main/home");
		return mv;
	}
	
}