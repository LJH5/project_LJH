package kr.green.matboda.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.green.matboda.vo.ImageVO;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReviewVO;

public interface ReviewService {

	void insertReview(ReviewVO review, MultipartFile[] imageList, MemberVO user) throws Exception;

	ArrayList<ReviewVO> getReviewList(Integer num);

	String deleteReview(Integer re_num, MemberVO user);

	ReviewVO getReview(Integer num);

	ArrayList<ImageVO> getimageList(Integer num);

	void getImageList(ArrayList<ReviewVO> review);

	void updateReview(ReviewVO review, MemberVO user, MultipartFile[] imageList, Integer[] imageNum) throws Exception;

	ArrayList<ImageVO> getTopImageList(Integer num);


}
