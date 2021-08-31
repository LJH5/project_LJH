package kr.green.matboda.dao;

import java.util.ArrayList;

import kr.green.matboda.vo.ImageVO;
import kr.green.matboda.vo.ReviewVO;

public interface ReviewDAO {

	void insertReview(ReviewVO review);

	ArrayList<ReviewVO> selectReview(Integer num);

	void insertImage(ImageVO file);

	ReviewVO selectRe(Integer num);

	void deleteReview(Integer re_num);


}
