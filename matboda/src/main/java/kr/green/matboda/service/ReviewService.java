package kr.green.matboda.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReviewVO;

public interface ReviewService {

	void insertReview(ReviewVO review, MemberVO user, MultipartFile[] fileList) throws Exception;

	ArrayList<ReviewVO> getReviewList(Integer num);

	String deleteReview(Integer re_num, MemberVO user);
}
