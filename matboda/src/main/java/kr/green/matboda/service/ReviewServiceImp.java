package kr.green.matboda.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.green.matboda.dao.BoardDAO;
import kr.green.matboda.dao.ReviewDAO;
import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.BoardVO;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReviewVO;
import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class ReviewServiceImp implements ReviewService {
	
	private ReviewDAO reviewDao;
	private BoardDAO boardDao;
	
	@Override
	public String insertReview(ReviewVO Review, MemberVO user) {
		if(Review == null || Review.getRe_num() <= 0 || user == null)
			return "FAIL";
		BoardVO board = boardDao.selectBoard(Review.getRe_num());
		if(board == null)
			return "FAIL";
		Review.setRe_me_id(user.getMe_id());
		reviewDao.insertReview(Review);
		return "OK";
	}

	@Override
	public ArrayList<ReviewVO> getReviewList(int rp_bo_num, Criteria cri) {
		return reviewDao.selectReviewList(rp_bo_num, cri);
	}

	@Override
	public int getTotalCount(int rp_bo_num) {
		return reviewDao.selectTotalCount(rp_bo_num);
	}

	@Override
	public String modifyReview(ReviewVO Review, MemberVO user) {
		if(Review == null || user == null)
			return "FAIL";
		ReviewVO dbReview = reviewDao.selectReview(Review.getRe_num());
		if(dbReview == null || !dbReview.getRe_me_id().equals(user.getMe_id()))
			return "FAIL";
		reviewDao.updateReview(Review);
		return "OK";
	}

	@Override
	public String deleteReview(Integer rp_num, MemberVO user) {
		if(user == null || rp_num <= 0)
			return "FAIL";
		ReviewVO dbReview = reviewDao.selectReview(rp_num);
		if(dbReview == null || !dbReview.getRe_me_id().equals(user.getMe_id()))
			return "FAIL";
		reviewDao.deleteReview(rp_num);
		return "OK";
	}
}
