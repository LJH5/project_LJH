package kr.green.matboda.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.matboda.service.MemberService;
import kr.green.matboda.service.ReviewService;
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
	public ModelAndView registerPost(ModelAndView mv, ReviewVO review, HttpServletRequest request, MultipartFile [] fileList) throws Exception {
		MemberVO user = memberService.getMemberByRequest(request);
		reviewService.insertReview(review, user, fileList);
		mv.setViewName("redirect:/restaurant/main?num="+review.getRe_rt_num());
		return mv;
	}
	@ResponseBody
	@PostMapping("/delete")
	public String deletePost(Integer re_num, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		return reviewService.deleteReview(re_num, user);
	}
}
