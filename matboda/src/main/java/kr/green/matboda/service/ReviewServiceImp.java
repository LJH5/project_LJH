package kr.green.matboda.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.matboda.dao.ReviewDAO;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReviewVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReviewServiceImp implements ReviewService {
	
	private ReviewDAO reviewDao;

	@Override
	public void insertReview(ReviewVO review, MemberVO user, MultipartFile[] fileList) {
		if(user == null || review == null)
			return;
		review.setRe_me_nickname(user.getMe_nickname());
		reviewDao.insertReview(review);
	}

	@Override
	public ArrayList<ReviewVO> getReviewList(Integer num) {
		if(num == null)
			return null;
		return reviewDao.selectReview(num);
	}

	@Override
	public void deleteReview(Integer num, MemberVO user) {
		// TODO Auto-generated method stub
		
	}
}
