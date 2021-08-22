package kr.green.matboda.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.*;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.pagination.PageMaker;
import kr.green.matboda.service.MemberService;
import kr.green.matboda.service.ReviewService;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReviewVO;
import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/review")
public class ReviewController {

	private ReviewService reviewService;
	private MemberService memberService;

	@PostMapping("/add")
	public String addPost(@RequestBody ReviewVO Review, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		return reviewService.insertReview(Review, user);
	}
	
	@GetMapping("/list/{page}/{rp_bo_num}")
	public Map<String, Object> listGet(
		@PathVariable("page") int page, @PathVariable("rp_bo_num") int rp_bo_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria(page, 5);
		ArrayList<ReviewVO> list = reviewService.getReviewList(rp_bo_num, cri);
		int totalCount = reviewService.getTotalCount(rp_bo_num);
		map.put("list", list);
		map.put("pm", new PageMaker(totalCount, 5, cri));
		return map;
	}
	@PostMapping("/del")
	public String delPost(Integer rp_num, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		return reviewService.deleteReview(rp_num, user);
	}
}
