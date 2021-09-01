package kr.green.matboda.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.matboda.service.MemberService;
import kr.green.matboda.service.RestaurantService;
import kr.green.matboda.service.ReviewService;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.RestaurantVO;
import kr.green.matboda.vo.ReviewVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/restaurant")
public class RestaurantController {

	@Autowired
	private RestaurantService restaurantService;
	private MemberService memberService;
	private ReviewService reviewService;

	@GetMapping("/register")
	public ModelAndView restaurantRegisterGet(ModelAndView mv) {
		mv.addObject("title", "음식점 등록");
		mv.setViewName("/template/restaurant/register");
		return mv;
	}
	@PostMapping("/register")
	public ModelAndView restaurantRegisterPost(ModelAndView mv, RestaurantVO rt, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		restaurantService.insertRestaurant(rt, user);
		mv.setViewName("redirect:/");
		return mv;
	}
	@GetMapping("/main")
	public ModelAndView restaurantMainGet(ModelAndView mv, Integer num) {
		RestaurantVO rt = restaurantService.getRt(num);
		
		ArrayList<ReviewVO> review = reviewService.getReviewList(num);
		reviewService.getImageList(review);
		mv.addObject("title", rt.getRt_name());
		mv.addObject("rt", rt);
		mv.addObject("reviews", review);
		mv.setViewName("/template/restaurant/main");
		return mv;
	}
	@GetMapping("/modify")
	public ModelAndView restaurantmodifyGet(ModelAndView mv, Integer num) {
		RestaurantVO rt = restaurantService.getRt(num);
		mv.addObject("title", rt.getRt_name());
		mv.addObject("rt", rt);
		mv.setViewName("/template/restaurant/modify");
		return mv;
	}
	@PostMapping("/modify")
	public ModelAndView restaurantmodifyPost(ModelAndView mv, RestaurantVO rt, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		restaurantService.updateRt(rt, user);
		mv.addObject("num", rt.getRt_num());
		mv.setViewName("redirect:/restaurant/main");
		return mv;
	}
	@GetMapping("/delete")
	public ModelAndView restaurantdeletePost(ModelAndView mv, Integer num, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		restaurantService.deleteRt(num, user);
		mv.setViewName("redirect:/");
		return mv;
	}
} 