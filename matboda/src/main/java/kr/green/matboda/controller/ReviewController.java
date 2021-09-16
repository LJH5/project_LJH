package kr.green.matboda.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.matboda.service.MemberService;
import kr.green.matboda.service.ReviewService;
import kr.green.matboda.vo.ImageVO;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReviewVO;
import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/review")
public class ReviewController {
	
	ReviewService reviewService;
	MemberService memberService;
	
	@GetMapping("/register")
	public ModelAndView registerGet(ModelAndView mv, Integer num, ReviewVO review) {
		review.setRe_rt_num(num);
		mv.addObject("num", num);
		mv.setViewName("/template/review/register");
		return mv;
	}
	@PostMapping("/register")
	public ModelAndView registerPost(ModelAndView mv, ReviewVO review, MultipartFile [] imageList, HttpServletRequest request) throws Exception {
		MemberVO user = memberService.getMemberByRequest(request);
		reviewService.insertReview(review, imageList, user);
		mv.setViewName("redirect:/restaurant/main?num="+review.getRe_rt_num());
		return mv;
	}
	@ResponseBody
	@PostMapping("/delete")
	public String deletePost(Integer re_num, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		return reviewService.deleteReview(re_num, user);
	}
	@GetMapping("/modify")
	public ModelAndView modifyGet(ModelAndView mv, Integer num) {
		ReviewVO review = reviewService.getReview(num);
		ArrayList<ImageVO> imageList = reviewService.getimageList(num);
		mv.addObject("review", review);
		mv.addObject("imageList", imageList);
		mv.setViewName("/template/review/modify");
		return mv;
	}
	@PostMapping("/modify")
	public ModelAndView modifyPost(ModelAndView mv, ReviewVO review, HttpServletRequest request, MultipartFile[] imageList, Integer[] imageNum) throws Exception {
		MemberVO user = memberService.getMemberByRequest(request);
		reviewService.updateReview(review, user, imageList, imageNum);
		mv.addObject("re_num", review.getRe_num());
		mv.setViewName("redirect:/restaurant/main?num="+review.getRe_rt_num());
		return mv;
	}
	@ResponseBody
	@GetMapping("recommend/{state}/{re_num}")
	public String recommendGet(@PathVariable("state") int state, @PathVariable("re_num") Integer re_num, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		return reviewService.updateRecommend(re_num, user, state);
	}
}
