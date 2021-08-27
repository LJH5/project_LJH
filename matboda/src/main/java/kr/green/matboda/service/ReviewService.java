package kr.green.matboda.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReviewVO;

public interface ReviewService {

	void insertReview(ReviewVO review, MemberVO user, MultipartFile[] fileList);

	ArrayList<ReviewVO> getReviewList(Integer num);

	void deleteReview(Integer num, MemberVO user);
}
