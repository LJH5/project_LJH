package kr.green.matboda.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.matboda.vo.ImageVO;
import kr.green.matboda.vo.ReviewVO;

public interface ReviewDAO {

	void insertReview(@Param("review")ReviewVO review);

	ArrayList<ReviewVO> selectReview(Integer num);

	void insertImage(ImageVO file);

	ReviewVO selectRe(Integer num);

	void deleteReview(Integer re_num);

	ArrayList<ImageVO> selectimageList(Integer num);

	void updateReview(ReviewVO dbReview);

	void deleteFile(int im_num);

}
