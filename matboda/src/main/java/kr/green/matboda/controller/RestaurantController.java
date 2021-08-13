package kr.green.matboda.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.matboda.service.MemberService;
import kr.green.matboda.service.RestaurantService;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.RestaurantVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/restaurant")
public class RestaurantController {
	
	@Autowired
	private RestaurantService restaurantService;
	private MemberService memberService;

	
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
		System.out.println(rt);
		mv.setViewName("redirect:/");
		return mv;
	}
	
}