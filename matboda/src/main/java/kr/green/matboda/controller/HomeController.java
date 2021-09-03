package kr.green.matboda.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.matboda.service.MemberService;
import kr.green.matboda.service.RestaurantService;
import kr.green.matboda.service.ReviewService;
import kr.green.matboda.service.ReviewServiceImp;
import kr.green.matboda.vo.ImageVO;
import kr.green.matboda.vo.RestaurantVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {
	
	RestaurantService restaurantService;
	ReviewService reviewService;
	@GetMapping("/")
	public ModelAndView home(ModelAndView mv) {
		
		ArrayList<RestaurantVO> list = restaurantService.getRestaurant();
		
		mv.addObject("title", "메인");
		mv.addObject("list", list);
		mv.setViewName("/template/main/home");
		return mv;
	}

}