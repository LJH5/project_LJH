package kr.green.matboda.service;

import java.util.ArrayList;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReviewVO;

public interface ReviewService {

	String insertReview(ReviewVO Review, MemberVO user);

	ArrayList<ReviewVO> getReviewList(int rp_bo_num, Criteria cri);

	int getTotalCount(int rp_bo_num);

	String modifyReview(ReviewVO Review, MemberVO user);

	String deleteReview(Integer rp_num, MemberVO user);

}
