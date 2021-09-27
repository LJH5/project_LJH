package kr.green.matboda.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.pagination.PageMaker;
import kr.green.matboda.service.MemberService;
import kr.green.matboda.service.RestaurantService;
import kr.green.matboda.service.ReviewService;
import kr.green.matboda.vo.FavoritesVO;
import kr.green.matboda.vo.ImageVO;
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
	public ModelAndView restaurantMainGet(ModelAndView mv, Integer num, Criteria cri, HttpServletRequest request) {
		restaurantService.updateView(num);
		RestaurantVO rt = restaurantService.getRt(num);
		
		MemberVO user = memberService.getMemberByRequest(request);
		
		//즐겨찾기 정보 가져오기
		FavoritesVO fvo = restaurantService.getFavority(num, user);
		
		restaurantService.getFavorityCount(num);
		
		cri.setPerPageNum(5);
		ArrayList<ReviewVO> review = reviewService.getReviewList(num, cri, user);
		int totalCount = reviewService.getTotalCount(num, cri);
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		
		restaurantService.updateReCount(num, totalCount);
		
		reviewService.getImageList(review);
		ArrayList<ImageVO> imageList = reviewService.getTopImageList(num);
	
		
		mv.addObject("pm", pm);
		mv.addObject("title", rt.getRt_name());
		mv.addObject("rt", rt);
		mv.addObject("reviews", review);
		mv.addObject("imageList", imageList);
		mv.addObject("fvo", fvo);
		mv.setViewName("/template/restaurant/main");
		return mv;
	}
	@GetMapping("/modify")
	public ModelAndView restaurantModifyGet(ModelAndView mv, Integer num) {
		RestaurantVO rt = restaurantService.getRt(num);
		mv.addObject("title", rt.getRt_name());
		mv.addObject("rt", rt);
		mv.setViewName("/template/restaurant/modify");
		return mv;
	}
	@PostMapping("/modify")
	public ModelAndView restaurantModifyPost(ModelAndView mv, RestaurantVO rt, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		restaurantService.updateRt(rt, user);
		mv.addObject("num", rt.getRt_num());
		mv.setViewName("redirect:/restaurant/main");
		return mv;
	}
	@GetMapping("/delete")
	public ModelAndView restaurantDeletePost(ModelAndView mv, Integer num, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		restaurantService.deleteRt(num, user);
		mv.setViewName("redirect:/");
		return mv;
	}
	@GetMapping("/search")
	public ModelAndView home(ModelAndView mv, Criteria cri) {
		ArrayList<RestaurantVO> list = restaurantService.getSearchRestaurant(cri);
		
		mv.addObject("title", "메인");
		mv.addObject("list", list);
		mv.addObject("cri", cri);
		mv.setViewName("/template/restaurant/search");
		return mv;
	}
	@ResponseBody
	@GetMapping("favorites/{state}/{rt_num}")
	public String recommendGet(@PathVariable("state") int state, @PathVariable("rt_num") Integer rt_num, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		return restaurantService.updateFaverites(rt_num, user, state);
	}
} 